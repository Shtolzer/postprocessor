import os
import re
import sys
import xml.etree.ElementTree as ET
from datetime import datetime
import glob
import shutil
from collections import defaultdict

def is_combined_file(filename):
    """Проверяет, является ли файл ранее объединенным"""
    pattern = r'\d{4}-\d{2}-\d{2}_\d{2}-\d{2}-\d{2}'
    return re.search(pattern, filename) is not None

def merge_postprocessors():
    """Объединяет mill и lathe постпроцессоры в единый токарно-фрезерный"""
    try:
        current_dir = os.getcwd()
        timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
        print(f"Начало объединения в: {current_dir}")

        # Поиск исходных файлов
        source_files = [f for f in glob.glob(os.path.join(current_dir, '*.*')) 
                       if not is_combined_file(f) and os.path.isfile(f)]
        
        if not source_files:
            print("Ошибка: Файлы для объединения не найдены")
            return False

        # Группировка файлов по типу и назначению
        file_groups = defaultdict(list)
        for f in source_files:
            fname = os.path.basename(f).lower()
            if 'mill' in fname: key = 'mill'
            elif 'lathe' in fname: key = 'lathe'
            else: key = 'common'
            file_groups[key].append(f)

        # Проверка наличия необходимых файлов
        if not file_groups['mill'] or not file_groups['lathe']:
            print("Ошибка: Не найдены mill и lathe файлы")
            return False

        # Создание объединенных файлов
        combined_tcl = f"combined_{timestamp}.tcl"
        combined_def = f"combined_{timestamp}.def"
        combined_pui = f"combined_{timestamp}.pui"

        # Объединение TCL
        if not merge_tcl_files(
            file_groups['mill'] + file_groups['lathe'] + file_groups['common'],
            combined_tcl
        ):
            return False

        # Объединение DEF
        def_files = [f for f in source_files if f.lower().endswith('.def')]
        if def_files:
            merge_def_files(def_files, combined_def)

        # Объединение PUI
        pui_files = [f for f in source_files if f.lower().endswith('.pui')]
        if pui_files:
            merge_pui_files(pui_files, combined_pui)
        else:
            print("Предупреждение: PUI-файлы не найдены")

        print("\nОбъединение успешно завершено!")
        print(f"Созданы файлы: {combined_tcl}, {combined_def}, {combined_pui}")
        return True

    except Exception as e:
        print(f"Критическая ошибка: {str(e)}")
        return False

def merge_tcl_files(source_files, output_file):
    """Объединяет TCL-файлы с разрешением конфликтов"""
    try:
        print(f"\nОбъединение TCL-файлов в {output_file}")
        
        # Собираем все процедуры для обработки конфликтов
        all_procs = {}
        combined_content = []
        safety_code = """
# ===== [AUTO-GENERATED SAFETY CHECKS] =====
global mom_event_handler_file_name
if {![info exists mom_event_handler_file_name]} {
    set mom_event_handler_file_name "[file tail [info script]]"
}

proc is_turning_operation {} {
    global mom_operation_type
    if {[info exists mom_operation_type] && [string match "*turn*" $mom_operation_type]} {
        return 1
    }
    return 0
}
"""

        for file_path in source_files:
            if not file_path.lower().endswith('.tcl'):
                continue
                
            print(f"  Обработка: {os.path.basename(file_path)}")
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
                
                # Извлекаем все процедуры
                procs = re.findall(r'proc\s+(PB_CMD_\w+)\s*\{([^}]*)\}', content)
                for proc_name, proc_args in procs:
                    if proc_name not in all_procs:
                        all_procs[proc_name] = []
                    all_procs[proc_name].append((proc_args, content))
                
                # Сохраняем не-процедурный контент
                non_proc_content = re.sub(r'proc\s+PB_CMD_\w+\s*\{[^}]*\}.*?\{.*?\}', '', content, flags=re.DOTALL)
                combined_content.append(non_proc_content)

        # Разрешаем конфликты процедур
        resolved_procs = []
        for proc_name, versions in all_procs.items():
            if len(versions) > 1:
                # Конфликт: создаем обертку
                wrapper = f"""
proc {proc_name} {{}} {{
    if {{[is_turning_operation]}} {{
        {proc_name}_lathe_impl
    }} else {{
        {proc_name}_mill_impl
    }}
}}
"""
                resolved_procs.append(wrapper)
                
                # Добавляем реализации
                for i, (args, content) in enumerate(versions):
                    impl_name = f"{proc_name}_{'lathe' if i == 0 else 'mill'}_impl"
                    proc_def = re.search(r'proc\s+' + re.escape(proc_name) + r'\s*\{[^}]*\}\s*\{.*?\}', content, flags=re.DOTALL)
                    if proc_def:
                        resolved_procs.append(proc_def.group(0).replace(proc_name, impl_name))
            else:
                # Без конфликта
                proc_def = re.search(r'proc\s+' + re.escape(proc_name) + r'\s*\{[^}]*\}\s*\{.*?\}', versions[0][1], flags=re.DOTALL)
                if proc_def:
                    resolved_procs.append(proc_def.group(0))

        # Собираем финальный контент
        final_content = safety_code + "\n\n" + "\n\n".join(combined_content) + "\n\n" + "\n\n".join(resolved_procs)
        
        with open(output_file, 'w', encoding='utf-8') as f_out:
            f_out.write(final_content)
        
        return True
        
    except Exception as e:
        print(f"Ошибка объединения TCL: {str(e)}")
        return False

def merge_def_files(source_files, output_file):
    """Объединяет DEF-файлы"""
    try:
        print(f"\nОбъединение DEF-файлов в {output_file}")
        
        formats = {}
        other_content = []
        
        for file_path in source_files:
            if not file_path.lower().endswith('.def'):
                continue
                
            with open(file_path, 'r', encoding='utf-8') as f:
                for line in f:
                    line = line.strip()
                    if line.startswith('FORMAT'):
                        parts = line.split()
                        if len(parts) >= 3:
                            key = f"{parts[1]}_{parts[2]}"
                            formats[key] = line
                    elif line:
                        other_content.append(line)
        
        # Сохраняем объединенный DEF
        with open(output_file, 'w', encoding='utf-8') as f_out:
            f_out.write("\n".join(other_content) + "\n")
            for line in formats.values():
                f_out.write(line + "\n")
        
        return True
        
    except Exception as e:
        print(f"Ошибка объединения DEF: {str(e)}")
        return False

def merge_pui_files(source_files, output_file):
    """Объединяет PUI-файлы (XML) с разрешением конфликтов"""
    try:
        print(f"\nОбъединение PUI-файлов в {output_file}")
        
        # Создаем базовую структуру
        root = ET.Element("PostProcessor")
        machine = ET.SubElement(root, "Machine")
        program = ET.SubElement(root, "Program")
        nc_data = ET.SubElement(root, "NCData")
        
        # Словари для объединения
        events = defaultdict(list)
        axes = set()
        gcodes = {}
        
        # Обработка всех PUI-файлов
        for file_path in source_files:
            if not file_path.lower().endswith('.pui'):
                continue
                
            print(f"  Обработка: {os.path.basename(file_path)}")
            tree = ET.parse(file_path)
            pui_root = tree.getroot()
            
            # Машинная конфигурация (оси и лимиты)
            for machine_elem in pui_root.findall("Machine"):
                for axis in machine_elem.findall("Axis"):
                    axis_name = axis.get("name")
                    if axis_name:
                        axes.add(axis_name)
            
            # Программные события
            for program_elem in pui_root.findall("Program"):
                for event in program_elem.findall("Event"):
                    event_name = event.get("name")
                    if event_name:
                        events[event_name].append(event)
            
            # NC-данные (G-коды, форматы)
            for nc_elem in pui_root.findall("NCData"):
                for gcode in nc_elem.findall("GCode"):
                    gname = gcode.get("name")
                    if gname:
                        gcodes[gname] = gcode
        
        # Добавляем оси в машинную конфигурацию
        for axis_name in sorted(axes):
            ET.SubElement(machine, "Axis", name=axis_name)
        
        # Добавляем события с разрешением конфликтов
        for event_name, event_list in events.items():
            if len(event_list) > 1:
                # Конфликт: создаем диспетчер
                event_elem = ET.SubElement(program, "Event", name=event_name)
                cmd_elem = ET.SubElement(event_elem, "Command")
                cmd_elem.text = f"if {{[is_turning_operation]}} {{ {event_name}_lathe }} else {{ {event_name}_mill }}"
                
                # Сохраняем оригинальные реализации
                for i, event in enumerate(event_list):
                    impl_name = f"{event_name}_{'lathe' if i == 0 else 'mill'}"
                    event.set("name", impl_name)
                    program.append(event)
            else:
                # Без конфликта
                program.append(event_list[0])
        
        # Добавляем G-коды
        for gcode in gcodes.values():
            nc_data.append(gcode)
        
        # Сохраняем объединенный PUI
        tree = ET.ElementTree(root)
        tree.write(output_file, encoding="utf-8", xml_declaration=True)
        return True
        
    except Exception as e:
        print(f"Ошибка объединения PUI: {str(e)}")
        return False

if __name__ == "__main__":
    print("=" * 70)
    print("Автоматическое объединение Mill и Lathe постпроцессоров")
    print("Создает токарно-фрезерный постпроцессор")
    print("=" * 70)
    
    if merge_postprocessors():
        print("\n" + "=" * 70)
        print("Успешно создан объединенный постпроцессор!")
        print("Особенности реализации:")
        print("- Автоматическое разрешение конфликтов процедур")
        print("- Интегрированная обработка событий для mill/lathe")
        print("- Объединенная кинематика осей")
        print("=" * 70)
    else:
        print("\nОбъединение завершено с ошибками")
