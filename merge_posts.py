import os
import re
import sys
from datetime import datetime

def merge_tcl_files(filenames, output_filename):
    print(f"\n🔧 Объединение TCL-файлов в {output_filename}")
    global_vars = set()
    procedures = {}
    conflicts = {}
    global_code = []
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    # Шаг 1: Анализ файлов
    for filename in filenames:
        print(f"  📄 Анализ: {os.path.basename(filename)}")
        with open(filename, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Сбор глобальных переменных (корректный метод)
        lines = content.split('\n')
        for line in lines:
            stripped = line.strip()
            if stripped.startswith('global'):
                # Извлекаем только валидные имена переменных
                vars_part = stripped[6:].split('#')[0]  # Удаляем комментарии
                for var in vars_part.split():
                    if re.match(r'^[a-zA-Z_]\w*$', var):  # Проверка на валидное имя
                        global_vars.add(var)
        
        # Сбор процедур с балансировкой скобок
        proc_matches = []
        start = 0
        while start < len(content):
            # Поиск начала процедуры
            proc_start = content.find('proc ', start)
            if proc_start == -1:
                break
                
            # Поиск начала тела процедуры
            body_start = content.find('{', proc_start)
            if body_start == -1:
                break
                
            # Поиск конца процедуры с балансировкой скобок
            brace_count = 1
            pos = body_start + 1
            while pos < len(content) and brace_count > 0:
                if content[pos] == '{':
                    brace_count += 1
                elif content[pos] == '}':
                    brace_count -= 1
                pos += 1
                
            if brace_count == 0:
                proc_end = pos
                proc_block = content[proc_start:proc_end]
                
                # Извлечение имени процедуры
                name_match = re.search(r'proc\s+(\w+)\s*\{', proc_block)
                if name_match:
                    proc_name = name_match.group(1)
                    if proc_name not in procedures:
                        procedures[proc_name] = {}
                    procedures[proc_name][filename] = proc_block
                
                start = proc_end
            else:
                break
    
    # Шаг 2: Выявление конфликтов
    for proc_name, files in procedures.items():
        if len(files) > 1:
            conflict_files = ', '.join([os.path.basename(f) for f in files.keys()])
            print(f"  ⚠️ Конфликт процедур: {proc_name} найдена в {conflict_files}")
            conflicts[proc_name] = files
    
    # Шаг 3: Генерация объединённого файла
    output_lines = [
        "# ============================================================================",
        f"# ОБЪЕДИНЕННЫЙ ПОСТПРОЦЕССОР (АВТОМАТИЧЕСКОЕ СЛИЯНИЕ)",
        f"# Создано: {timestamp}",
        "# ============================================================================",
        ""
    ]
    
    # Инициализация глобальных переменных
    if global_vars:
        output_lines.append("# ИНИЦИАЛИЗАЦИЯ ГЛОБАЛЬНЫХ ПЕРЕМЕННЫХ")
        output_lines.append(f"global {' '.join(sorted(global_vars))}")
        output_lines.append("")
    
    # Добавление неконфликтных процедур
    output_lines.append(f"# {'=' * 70}")
    output_lines.append("# НЕКОНФЛИКТНЫЕ ПРОЦЕДУРЫ")
    output_lines.append(f"# {'=' * 70}")
    
    for proc_name, files in procedures.items():
        if proc_name not in conflicts:
            for filename, proc_block in files.items():
                output_lines.append(f"# Процедура из {os.path.basename(filename)}")
                output_lines.append(proc_block)
                output_lines.append("")
    
    # Добавление конфликтных процедур с разрешением
    output_lines.append(f"# {'=' * 70}")
    output_lines.append("# РАЗРЕШЕНИЕ КОНФЛИКТОВ ПРОЦЕДУР")
    output_lines.append(f"# {'=' * 70}")
    
    for proc_name, files in conflicts.items():
        output_lines.append(f"# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: {proc_name}")
        
        # Генерация обёртки
        output_lines.append(f"proc {proc_name} {{ args }} {{")
        output_lines.append("  global mom_operation_type")
        output_lines.append("  if {[info exists mom_operation_type]} {")
        output_lines.append('    if {$mom_operation_type == "Turning"} {')
        
        # Поиск токарной версии
        lathe_file = next((f for f in files if "LATHE" in f.upper()), None)
        if lathe_file:
            output_lines.append(f"      # Токарная версия из {os.path.basename(lathe_file)}")
            output_lines.append(f"      return [::{proc_name}_turn] $args")
        else:
            output_lines.append("      # Токарная версия отсутствует")
            output_lines.append(f"      return [::{proc_name}_mill] $args")
        
        output_lines.append("    }")
        output_lines.append("  }")
        output_lines.append("  ")
        output_lines.append("  # По умолчанию используем фрезерную версию")
        
        # Поиск фрезерной версии
        mill_file = next((f for f in files if "MILL" in f.upper()), None)
        if mill_file:
            output_lines.append(f"  return [::{proc_name}_mill] $args")
        else:
            output_lines.append(f"  return [::{proc_name}_turn] $args")
        
        output_lines.append("}")
        output_lines.append("")
        
        # Добавление оригинальных процедур с суффиксами
        for filename, proc_block in files.items():
            suffix = "_turn" if "LATHE" in filename.upper() else "_mill"
            new_proc_name = f"{proc_name}{suffix}"
            
            # Замена имени процедуры в блоке
            modified_block = re.sub(
                r'proc\s+' + re.escape(proc_name) + r'\b',
                f'proc {new_proc_name}',
                proc_block
            )
            
            output_lines.append(f"# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ {os.path.basename(filename)}")
            output_lines.append(modified_block)
            output_lines.append("")
    
    # Сохранение файла
    with open(output_filename, 'w', encoding='utf-8') as f:
        f.write('\n'.join(output_lines))
    
    # Проверка баланса скобок
    with open(output_filename, 'r', encoding='utf-8') as f:
        content = f.read()
        open_braces = content.count('{')
        close_braces = content.count('}')
        if open_braces != close_braces:
            print(f"  ⚠️ Внимание: Несбалансированные скобки! {{={open_braces} }}={close_braces}")
            print(f"  Разница: {abs(open_braces - close_braces)} скобок")
            
            # Попытка автоматического исправления
            diff = open_braces - close_braces
            if diff > 0:
                content += '\n}' * diff
            else:
                content = '{' * abs(diff) + content
                
            with open(output_filename, 'w', encoding='utf-8') as f_fixed:
                f_fixed.write(content)
            print(f"  ✔️ Автоматически добавлены недостающие скобки")
    
    print(f"  ✔️ Создан файл: {output_filename}")
    return True

def merge_def_files(filenames, output_filename):
    print(f"\n🔧 Объединение DEF-файлов в {output_filename}")
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    content = []
    for filename in filenames:
        print(f"  📄 Обработка: {os.path.basename(filename)}")
        with open(filename, 'r', encoding='utf-8') as f:
            content.append(f"\n\n{'*' * 60}")
            content.append(f"; СОДЕРЖИМОЕ ИЗ {os.path.basename(filename)}")
            content.append(f"{'*' * 60}\n")
            content.append(f.read())
    
    with open(output_filename, 'w', encoding='utf-8') as f:
        f.write(f"; ============================================================================\n")
        f.write(f"; ОБЪЕДИНЕННЫЙ ПОСТПРОЦЕССОР (АВТОМАТИЧЕСКОЕ СЛИЯНИЕ)\n")
        f.write(f"; Создано: {timestamp}\n")
        f.write(f"; ============================================================================\n")
        f.write('\n'.join(content))
    
    print(f"  ✔️ Создан файл: {output_filename}")
    return True

def merge_pui_files(filenames, output_filename):
    print(f"\n🔧 Объединение PUI-файлов в {output_filename}")
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    content = []
    for filename in filenames:
        print(f"  📄 Обработка: {os.path.basename(filename)}")
        try:
            with open(filename, 'r', encoding='utf-8') as f:
                content.append(f"\n\n{'#' * 60}")
                content.append(f"# СОДЕРЖИМОЕ ИЗ {os.path.basename(filename)}")
                content.append(f"{'#' * 60}\n")
                content.append(f.read())
        except Exception as e:
            print(f"  ⚠️ Ошибка: {str(e)}")
            content.append(f"\n\n{'#' * 60}")
            content.append(f"# ОШИБКА ЧТЕНИЯ {os.path.basename(filename)}")
            content.append(f"{'#' * 60}")
    
    with open(output_filename, 'w', encoding='utf-8') as f:
        f.write(f"## POSTBUILDER_VERSION=2012.0.1.0\n")
        f.write(f"{'#' * 78}\n")
        f.write(f"#                                                                            #\n")
        f.write(f"#  ОБЪЕДИНЕННЫЙ ПОСТПРОЦЕССОР (АВТОМАТИЧЕСКОЕ СЛИЯНИЕ)                      #\n")
        f.write(f"#  Создано: {timestamp}                           #\n")
        f.write(f"#                                                                            #\n")
        f.write(f"#  ВНИМАНИЕ: Содержимое этого файла не должно изменяться вручную!            #\n")
        f.write(f"#             Все изменения должны вноситься через TCL/DEF файлы             #\n")
        f.write(f"#                                                                            #\n")
        f.write(f"{'#' * 78}\n")
        f.write('\n'.join(content))
    
    print(f"  ✔️ Создан файл: {output_filename}")
    return True

def main():
    print("\n" + "=" * 80)
    print("🛠️ ИНТЕЛЛЕКТУАЛЬНОЕ ОБЪЕДИНЕНИЕ ПОСТПРОЦЕССОРОВ")
    print("=" * 80)
    
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    
    # Проверка файлов
    required_files = [
        'MILL.tcl', 'LATHE.tcl',
        'MILL.def', 'LATHE.def',
        'MILL.pui', 'LATHE.pui'
    ]
    missing = [f for f in required_files if not os.path.exists(f)]
    
    if missing:
        print("\n❌ ОШИБКА: Отсутствуют файлы:")
        for f in missing:
            print(f"  - {f}")
        return
    
    try:
        # Обработка
        combined_tcl = f"combined_{timestamp}.tcl"
        merge_tcl_files(['MILL.tcl', 'LATHE.tcl'], combined_tcl)
        
        combined_def = f"combined_{timestamp}.def"
        merge_def_files(['MILL.def', 'LATHE.def'], combined_def)
        
        combined_pui = f"combined_{timestamp}.pui"
        merge_pui_files(['MILL.pui', 'LATHE.pui'], combined_pui)
        
        # Результаты
        print("\n✅ УСПЕШНО: Постпроцессор создан")
        print(f"  - TCL: {combined_tcl}")
        print(f"  - DEF: {combined_def}")
        print(f"  - PUI: {combined_pui}")
        
        print("\n" + "=" * 80)
        print("🌟 РЕКОМЕНДАЦИИ ПО ИСПОЛЬЗОВАНИЮ:")
        print("1. Для токарных операций установите: set mom_operation_type \"Turning\"")
        print("2. Для фрезерных операций установите: set mom_operation_type \"Milling\"")
        print("3. Если есть ошибки в NX, проверьте:")
        print("   - Баланс скобок в TCL-файле")
        print("   - Корректность глобальных переменных")
        print("4. Протестируйте на простых операциях перед использованием")
        print("=" * 80)
        
    except Exception as e:
        print(f"\n❌ КРИТИЧЕСКАЯ ОШИБКА: {str(e)}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main()
