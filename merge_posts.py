import os
import re
import shutil
from collections import OrderedDict
import glob

def read_file(file_path):
    """Чтение содержимого файла с обработкой различных кодировок"""
    encodings = ['utf-8', 'latin-1', 'cp1252']
    for encoding in encodings:
        try:
            with open(file_path, 'r', encoding=encoding) as f:
                return f.read()
        except UnicodeDecodeError:
            continue
    raise ValueError(f"Не удается декодировать файл: {file_path}")

def write_file(file_path, content):
    """Запись файла в UTF-8"""
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)

def merge_def_files(mill_def, lathe_def):
    """
    Объединяет два DEF-файла для создания токарно-фрезерного постпроцессора.
    
    Ожидает:
        mill_def (str): содержимое фрезерного DEF-файла
        lathe_def (str): содержимое токарного DEF-файла
        
    Стратегия объединения:
        1. Сохраняет все уникальные команды из обоих файлов
        2. Для дублирующихся команд создает версии с суффиксами _MILL и _LATHE
        3. Добавляет перенаправление, которое выбирает команду на основе типа операции
        4. Объединяет блоки данных с одинаковыми именами
        5. Сохраняет уникальные блоки данных
        
    Возвращает:
        str: объединенное содержимое DEF-файла
    """
    # Регулярные выражения для парсинга
    command_pattern = re.compile(r'^\s*(\w+)\s*:(.*)$', re.MULTILINE)
    data_block_pattern = re.compile(r'^(_\w+)\s+{(.*?)^}', re.MULTILINE | re.DOTALL)
    
    # Парсинг фрезерного DEF
    mill_commands = dict(command_pattern.findall(mill_def))
    mill_blocks = {name: content for name, content in data_block_pattern.findall(mill_def)}
    
    # Парсинг токарного DEF
    lathe_commands = dict(command_pattern.findall(lathe_def))
    lathe_blocks = {name: content for name, content in data_block_pattern.findall(lathe_def)}
    
    # Обработка команд
    combined_commands = []
    handled_commands = set()
    
    # 1. Обработка уникальных команд
    all_commands = set(mill_commands.keys()) | set(lathe_commands.keys())
    for cmd in all_commands:
        if cmd in mill_commands and cmd not in lathe_commands:
            combined_commands.append(f"{cmd} :{mill_commands[cmd]}")
        elif cmd in lathe_commands and cmd not in mill_commands:
            combined_commands.append(f"{cmd} :{lathe_commands[cmd]}")
        handled_commands.add(cmd)
    
    # 2. Обработка дублирующихся команд
    duplicate_commands = set(mill_commands.keys()) & set(lathe_commands.keys())
    for cmd in duplicate_commands:
        # Создаем версии для фрезерной и токарной обработки
        mill_cmd = f"{cmd}_MILL"
        lathe_cmd = f"{cmd}_LATHE"
        
        combined_commands.append(f"{mill_cmd} :{mill_commands[cmd]}")
        combined_commands.append(f"{lathe_cmd} :{lathe_commands[cmd]}")
        
        # Добавляем перенаправление для сохранения совместимости
        combined_commands.append(
            f"{cmd} : ${{::[expr {{$::OPERATION_TYPE == \"MILL\" ? \"{mill_cmd}\" : \"{lathe_cmd}\"}}]}}"
        )
        handled_commands.add(cmd)
    
    # Обработка блоков данных
    combined_blocks = []
    all_blocks = set(mill_blocks.keys()) | set(lathe_blocks.keys())
    
    for block in all_blocks:
        if block in mill_blocks and block in lathe_blocks:
            # Объединение содержимого блоков
            combined_content = mill_blocks[block].strip() + "\n" + lathe_blocks[block].strip()
            combined_blocks.append(f"{block} {{\n{combined_content}\n}}")
        elif block in mill_blocks:
            combined_blocks.append(f"{block} {{\n{mill_blocks[block].strip()}\n}}")
        else:
            combined_blocks.append(f"{block} {{\n{lathe_blocks[block].strip()}\n}}")
    
    # Сборка итогового файла
    return "\n\n".join(combined_commands + [""] + combined_blocks)

def merge_tcl_files(mill_tcl, lathe_tcl):
    """
    Объединяет два TCL-файла для создания токарно-фрезерного постпроцессора.
    
    Ожидает:
        mill_tcl (str): содержимое фрезерного TCL-файла
        lathe_tcl (str): содержимое токарного TCL-файла
        
    Стратегия объединения:
        1. Добавляет инициализацию переменной OPERATION_TYPE
        2. Добавляет процедуру для установки типа операции
        3. Сохраняет все процедуры из обоих файлов
        4. Для дублирующихся процедур сохраняет фрезерную версию
        5. Объединяет глобальные переменные, удаляя дубликаты
        6. Сохраняет все остальные элементы кода
        
    Возвращает:
        str: объединенное содержимое TCL-файла
    """
    # Добавляем инициализацию типа операции
    init_code = """
# ============================================================================
# ИНИЦИАЛИЗАЦИЯ ТИПА ОПЕРАЦИИ ДЛЯ ТОКАРНО-ФРЕЗЕРНОГО ПОСТПРОЦЕССОРА
# ============================================================================
set ::OPERATION_TYPE "MILL" ; Значение по умолчанию

proc set_operation_type { type } {
    # Устанавливает тип текущей операции (MILL или LATHE)
    set ::OPERATION_TYPE $type
}
"""
    
    # Удаляем начальные и конечные пустые строки
    mill_tcl = mill_tcl.strip()
    lathe_tcl = lathe_tcl.strip()
    
    # Объединяем содержимое файлов
    combined = f"{init_code}\n\n{mill_tcl}\n\n{lathe_tcl}"
    
    # Поиск всех процедур в обоих файлах
    proc_pattern = re.compile(r'^proc\s+(\w+)\s*\{.*?\}\s*\{', re.MULTILINE | re.DOTALL)
    mill_procs = set(proc_pattern.findall(mill_tcl))
    lathe_procs = set(proc_pattern.findall(lathe_tcl))
    
    # Обработка дубликатов процедур
    duplicate_procs = mill_procs & lathe_procs
    for proc in duplicate_procs:
        # Удаляем токарную версию процедуры (мы оставляем фрезерную)
        combined = re.sub(
            rf'^proc\s+{proc}\s*{{.*?}}\s*{{.*?^}}$', 
            '', 
            combined, 
            flags=re.MULTILINE | re.DOTALL
        )
        
        # Убедимся, что фрезерная версия процедуры присутствует
        mill_proc_match = re.search(
            rf'^(proc\s+{proc}\s*{{.*?}}\s*{{.*?^}})$', 
            mill_tcl, 
            flags=re.MULTILINE | re.DOTALL
        )
        if mill_proc_match:
            # Вставляем фрезерную версию в начало
            combined = f"{mill_proc_match.group(1)}\n\n{combined}"
    
    # Обработка глобальных переменных
    global_vars = re.findall(r'^\s*set\s+::(\w+)', combined, re.MULTILINE)
    unique_globals = OrderedDict()
    for var in global_vars:
        unique_globals[var] = True
    
    # Удаляем дубликаты объявлений глобальных переменных
    for var in unique_globals:
        # Сохраняем только первое объявление
        combined = re.sub(
            rf'^(set\s+::{var}\s+.*)$', 
            '', 
            combined, 
            flags=re.MULTILINE | re.DOTALL
        )
        # Находим объявление в mill_tcl
        mill_match = re.search(
            rf'^(set\s+::{var}\s+.*)$', 
            mill_tcl, 
            flags=re.MULTILINE
        )
        if mill_match:
            combined = f"{mill_match.group(0)}\n{combined}"
        else:
            # Если не нашли в mill, ищем в lathe
            lathe_match = re.search(
                rf'^(set\s+::{var}\s+.*)$', 
                lathe_tcl, 
                flags=re.MULTILINE
            )
            if lathe_match:
                combined = f"{lathe_match.group(0)}\n{combined}"
    
    return combined

def merge_pui_files(mill_pui, lathe_pui):
    """
    Объединяет два PUI-файла (текстовый формат) для создания интерфейса постпроцессора.
    
    Важное уточнение:
        PUI-файлы НЕ являются XML, как ошибочно предполагалось ранее. 
        Это текстовые файлы со специальным синтаксисом, используемым NX для описания 
        пользовательского интерфейса постпроцессора.
    
    Ожидает:
        mill_pui (str): содержимое фрезерного PUI-файла
        lathe_pui (str): содержимое токарного PUI-файла
        
    Стратегия объединения:
        1. Анализирует структуру файла, разделенную на секции (SECTION/ENDSECTION)
        2. Для каждой секции:
           - Если секция существует только в одном файле - добавляет ее
           - Если секция есть в обоих файлах - объединяет их контролы
        3. Сохраняет все уникальные контролы (CONTROL) из обоих файлов
        4. Сохраняет порядок секций из фрезерного файла
        5. Добавляет новые секции из токарного файла в конец
        
    Возвращает:
        str: объединенное содержимое PUI-файла
    """
    # Разделение файлов на секции
    def parse_sections(pui_content):
        sections = {}
        current_section = None
        lines = []
        
        for line in pui_content.splitlines():
            if line.startswith("SECTION "):
                # Начало новой секции
                if current_section:
                    sections[current_section] = "\n".join(lines)
                section_name = line.split(" ", 1)[1].strip()
                current_section = section_name
                lines = [line]
            elif line.startswith("ENDSECTION"):
                # Конец секции
                if current_section:
                    lines.append(line)
                    sections[current_section] = "\n".join(lines)
                    current_section = None
                    lines = []
            elif current_section:
                # Содержимое секции
                lines.append(line)
            else:
                # Глобальные настройки вне секций
                lines.append(line)
        
        # Добавляем последнюю секцию, если есть
        if current_section:
            sections[current_section] = "\n".join(lines)
        
        return sections

    # Парсинг секций
    mill_sections = parse_sections(mill_pui)
    lathe_sections = parse_sections(lathe_pui)

    # Словарь для хранения объединенных секций
    merged_sections = {}
    
    # Обработка глобальных настроек
    global_settings = ""
    if "" in mill_sections:
        global_settings = mill_sections.pop("")
    if "" in lathe_sections:
        # Добавляем только отсутствующие настройки
        for line in lathe_sections[""].splitlines():
            if line not in global_settings:
                global_settings += "\n" + line

    # Объединение секций
    for name, content in mill_sections.items():
        if name in lathe_sections:
            # Объединение содержимого секций
            mill_controls = set()
            lathe_controls = []
            
            # Извлечение контролов из фрезерной секции
            mill_lines = content.splitlines()
            for line in mill_lines:
                if line.startswith("CONTROL "):
                    # Извлекаем идентификатор контрола
                    parts = line.split()
                    if len(parts) > 2 and parts[1] == "Button":
                        # Формат: CONTROL Button -id "ID_NAME"
                        id_index = parts.index("-id")
                        if id_index + 1 < len(parts):
                            mill_controls.add(parts[id_index + 1].strip('"'))
            
            # Извлечение контролов из токарной секции
            lathe_lines = lathe_sections[name].splitlines()
            for line in lathe_lines:
                if line.startswith("CONTROL "):
                    parts = line.split()
                    if len(parts) > 2 and parts[1] == "Button":
                        id_index = parts.index("-id")
                        if id_index + 1 < len(parts):
                            control_id = parts[id_index + 1].strip('"')
                            if control_id not in mill_controls:
                                lathe_controls.append(line)
            
            # Объединенное содержимое секции
            merged_content = content
            if lathe_controls:
                # Находим позицию для вставки новых контролов
                insert_index = merged_content.find("ENDSECTION")
                if insert_index == -1:
                    merged_content += "\n" + "\n".join(lathe_controls)
                else:
                    # Вставляем перед ENDSECTION
                    header = merged_content[:insert_index]
                    footer = merged_content[insert_index:]
                    merged_content = header + "\n" + "\n".join(lathe_controls) + "\n" + footer
        else:
            merged_content = content
        
        merged_sections[name] = merged_content
    
    # Добавляем уникальные секции из токарного файла
    for name, content in lathe_sections.items():
        if name not in merged_sections and name != "":
            merged_sections[name] = content

    # Сборка итогового файла
    result = global_settings + "\n\n" if global_settings else ""
    result += "\n\n".join(merged_sections.values())
    
    return result

def merge_event_files(mill_dir, lathe_dir, combined_dir):
    """
    Объединяет файлы событий (.evt) из обеих директорий.
    
    Ожидает:
        mill_dir (str): путь к директории фрезерного постпроцессора
        lathe_dir (str): путь к директории токарного постпроцессора
        combined_dir (str): путь к директории объединенного постпроцессора
        
    Стратегия:
        1. Копирует все .evt файлы из фрезерного постпроцессора
        2. Копирует отсутствующие .evt файлы из токарного постпроцессора
        3. Сохраняет структуру папки events
    """
    # Создаем директорию для событий
    events_dir = os.path.join(combined_dir, "events")
    os.makedirs(events_dir, exist_ok=True)
    
    # Копируем все .evt файлы из mill_dir
    for evt_file in glob.glob(os.path.join(mill_dir, "events", "*.evt")):
        shutil.copy(evt_file, events_dir)
    
    # Копируем .evt файлы из lathe_dir, если они отсутствуют
    for evt_file in glob.glob(os.path.join(lathe_dir, "events", "*.evt")):
        dest = os.path.join(events_dir, os.path.basename(evt_file))
        if not os.path.exists(dest):
            shutil.copy(evt_file, events_dir)

def copy_additional_files(src_dir, dst_dir, extensions):
    """
    Копирует дополнительные файлы с указанными расширениями.
    
    Ожидает:
        src_dir (str): исходная директория
        dst_dir (str): целевая директория
        extensions (list): список расширений (например, ['.tbc', '.ico'])
        
    Стратегия:
        Копирует все файлы с указанными расширениями из src_dir в dst_dir
    """
    for ext in extensions:
        for file in glob.glob(os.path.join(src_dir, f"*{ext}")):
            shutil.copy(file, dst_dir)

def main():
    """Основная функция скрипта объединения постпроцессоров."""
    # Определение путей
    base_dir = os.path.dirname(os.path.abspath(__file__))
    mill_dir = os.path.join(base_dir, "mill")
    lathe_dir = os.path.join(base_dir, "lathe")
    combined_dir = os.path.join(base_dir, "combined")
    
    # Создание директории для объединенного постпроцессора
    os.makedirs(combined_dir, exist_ok=True)
    
    # Чтение основных файлов
    mill_def = read_file(os.path.join(mill_dir, "MILL.def"))
    lathe_def = read_file(os.path.join(lathe_dir, "LATHE.def"))
    mill_tcl = read_file(os.path.join(mill_dir, "MILL.tcl"))
    lathe_tcl = read_file(os.path.join(lathe_dir, "LATHE.tcl"))
    mill_pui = read_file(os.path.join(mill_dir, "MILL.pui"))
    lathe_pui = read_file(os.path.join(lathe_dir, "LATHE.pui"))
    
    # Объединение файлов
    combined_def = merge_def_files(mill_def, lathe_def)
    combined_tcl = merge_tcl_files(mill_tcl, lathe_tcl)
    combined_pui = merge_pui_files(mill_pui, lathe_pui)
    
    # Запись объединенных файлов
    write_file(os.path.join(combined_dir, "COMBINED.def"), combined_def)
    write_file(os.path.join(combined_dir, "COMBINED.tcl"), combined_tcl)
    write_file(os.path.join(combined_dir, "COMBINED.pui"), combined_pui)
    
    # Обработка событий
    merge_event_files(mill_dir, lathe_dir, combined_dir)
    
    # Копирование дополнительных файлов
    copy_additional_files(base_dir, combined_dir, ['.tbc', '.ico', '.dlx'])
    
    print("Объединение завершено успешно! Результат в папке 'combined'")

if __name__ == "__main__":
    main()
