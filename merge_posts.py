import os
import re
import hashlib
from datetime import datetime
import sys
from collections import defaultdict
import traceback

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

def parse_def_file(content):
    """
    Усовершенствованный парсер DEF-файлов
    Обрабатывает как команды, так и блоки данных
    """
    library = {
        'commands': {},
        'blocks': {}
    }
    
    # Состояния парсера
    current_block = None
    block_lines = []
    in_block = False
    
    for line in content.splitlines():
        stripped = line.strip()
        
        # Обработка блока данных
        if in_block:
            if stripped == '}':
                # Конец блока
                block_content = "\n".join(block_lines)
                signature = hashlib.md5(block_content.encode()).hexdigest()
                library['blocks'][current_block] = (signature, block_content)
                
                # Сброс состояния
                current_block = None
                block_lines = []
                in_block = False
            else:
                block_lines.append(line)
            continue
        
        # Обработка начала блока данных
        if stripped.startswith('_') and stripped.endswith('{'):
            block_name = stripped[:-1].strip()
            current_block = block_name
            in_block = True
            block_lines = []
            continue
        
        # Обработка команд
        if ':' in line:
            parts = line.split(':', 1)
            cmd = parts[0].strip()
            definition = parts[1].strip()
            
            if cmd:  # Игнорировать пустые команды
                signature = hashlib.md5(f"{cmd}{definition}".encode()).hexdigest()
                library['commands'][cmd] = (signature, definition)
    
    return library

def create_library(content, file_type):
    """
    Создает временную библиотеку элементов из содержимого файла
    Возвращает словарь: {тип элемента: {имя: (сигнатура, содержимое)}}
    """
    if file_type == 'def':
        return parse_def_file(content)
    
    library = defaultdict(dict)
    
    if file_type == 'tcl':
        # Парсинг процедур
        procs = re.findall(r'^proc\s+(\w+)\s*(\{.*?\})\s*(\{.*?^\})', content, re.MULTILINE | re.DOTALL)
        for name, args, body in procs:
            signature = hashlib.md5(f"{name}{args}{body}".encode()).hexdigest()
            library['procedures'][name] = (signature, (args, body))
        
        # Парсинг глобальных переменных
        globals = re.findall(r'^\s*set\s+::(\w+)\s+(.*)$', content, re.MULTILINE)
        for name, value in globals:
            signature = hashlib.md5(f"{name}{value}".encode()).hexdigest()
            library['globals'][name] = (signature, value.strip())
    
    elif file_type == 'pui':
        # Парсинг секций
        sections = re.split(r'(^SECTION .*?^ENDSECTION)', content, flags=re.MULTILINE | re.DOTALL)
        for section in sections:
            if section.strip():
                if section.startswith("SECTION"):
                    name_line = section.split('\n', 1)[0]
                    name = name_line.split(' ', 1)[1].strip()
                    signature = hashlib.md5(section.encode()).hexdigest()
                    library['sections'][name] = (signature, section.strip())
                else:
                    # Глобальные настройки
                    library['global_settings'] = (hashlib.md5(section.encode()).hexdigest(), section.strip())
    
    return library

def merge_libraries(lib1, lib2, file_type):
    """Объединение двух библиотек с разрешением конфликтов"""
    merged = defaultdict(dict)
    
    if file_type == 'def':
        # Объединение команд
        all_commands = set(lib1['commands'].keys()) | set(lib2['commands'].keys())
        for cmd in all_commands:
            if cmd in lib1['commands'] and cmd in lib2['commands']:
                # Разрешение конфликта
                sig1, def1 = lib1['commands'][cmd]
                sig2, def2 = lib2['commands'][cmd]
                
                if sig1 == sig2:
                    # Одинаковые команды
                    merged['commands'][cmd] = (sig1, def1)
                else:
                    # Создаем версии с суффиксами
                    merged['commands'][f"{cmd}_MILL"] = (sig1, def1)
                    merged['commands'][f"{cmd}_LATHE"] = (sig2, def2)
                    merged['commands'][cmd] = (
                        hashlib.md5(f"{cmd}_dispatch".encode()).hexdigest(),
                        f"${{::[expr {{$::OPERATION_TYPE == \"MILL\" ? \"{cmd}_MILL\" : \"{cmd}_LATHE\"}}]}}"
                    )
            elif cmd in lib1['commands']:
                merged['commands'][cmd] = lib1['commands'][cmd]
            else:
                merged['commands'][cmd] = lib2['commands'][cmd]
        
        # Объединение блоков данных
        all_blocks = set(lib1['blocks'].keys()) | set(lib2['blocks'].keys())
        for block in all_blocks:
            if block in lib1['blocks'] and block in lib2['blocks']:
                sig1, content1 = lib1['blocks'][block]
                sig2, content2 = lib2['blocks'][block]
                
                if sig1 == sig2:
                    merged['blocks'][block] = (sig1, content1)
                else:
                    # Объединение содержимого
                    merged_content = f"{content1}\n\n{content2}"
                    merged['blocks'][block] = (
                        hashlib.md5(merged_content.encode()).hexdigest(),
                        merged_content
                    )
            elif block in lib1['blocks']:
                merged['blocks'][block] = lib1['blocks'][block]
            else:
                merged['blocks'][block] = lib2['blocks'][block]
    
    elif file_type == 'tcl':
        # Объединение процедур
        all_procs = set(lib1['procedures'].keys()) | set(lib2['procedures'].keys())
        for proc in all_procs:
            if proc in lib1['procedures'] and proc in lib2['procedures']:
                sig1, (args1, body1) = lib1['procedures'][proc]
                sig2, (args2, body2) = lib2['procedures'][proc]
                
                if sig1 == sig2:
                    merged['procedures'][proc] = (sig1, (args1, body1))
                else:
                    # Создаем обертку
                    merged['procedures'][f"{proc}_MILL"] = (sig1, (args1, body1))
                    merged['procedures'][f"{proc}_LATHE"] = (sig2, (args2, body2))
                    
                    dispatcher = f"""
# ============================================================================
# ДИСПЕТЧЕРИЗАЦИЯ ПРОЦЕДУРЫ: {proc}
# ============================================================================
proc {proc} {{ args }} {{
    if {{$::OPERATION_TYPE == "MILL"}} {{
        return [eval {proc}_MILL $args]
    }} else {{
        return [eval {proc}_LATHE $args]
    }}
}}
"""
                    merged['dispatchers'][proc] = (
                        hashlib.md5(dispatcher.encode()).hexdigest(),
                        dispatcher.strip()
                    )
            elif proc in lib1['procedures']:
                merged['procedures'][proc] = lib1['procedures'][proc]
            else:
                merged['procedures'][proc] = lib2['procedures'][proc]
        
        # Объединение глобальных переменных
        all_globals = set(lib1['globals'].keys()) | set(lib2['globals'].keys())
        for var in all_globals:
            if var in lib1['globals'] and var in lib2['globals']:
                sig1, val1 = lib1['globals'][var]
                sig2, val2 = lib2['globals'][var]
                
                if sig1 == sig2:
                    merged['globals'][var] = (sig1, val1)
                else:
                    # Выбираем значение из фрезерного файла
                    merged['globals'][var] = (sig1, val1)
            elif var in lib1['globals']:
                merged['globals'][var] = lib1['globals'][var]
            else:
                merged['globals'][var] = lib2['globals'][var]
    
    elif file_type == 'pui':
        # Глобальные настройки
        if 'global_settings' in lib1 or 'global_settings' in lib2:
            merged['global_settings'] = lib1.get('global_settings', lib2.get('global_settings'))
        
        # Объединение секций
        all_sections = set(lib1['sections'].keys()) | set(lib2['sections'].keys())
        for section in all_sections:
            if section in lib1['sections'] and section in lib2['sections']:
                sig1, content1 = lib1['sections'][section]
                sig2, content2 = lib2['sections'][section]
                
                if sig1 == sig2:
                    merged['sections'][section] = (sig1, content1)
                else:
                    # Объединяем содержимое секций
                    merged_content = f"{content1}\n\n{content2}"
                    merged['sections'][section] = (
                        hashlib.md5(merged_content.encode()).hexdigest(),
                        merged_content
                    )
            elif section in lib1['sections']:
                merged['sections'][section] = lib1['sections'][section]
            else:
                merged['sections'][section] = lib2['sections'][section]
    
    return merged

def generate_file_from_library(library, file_type):
    """Генерация содержимого файла из объединенной библиотеки"""
    content = ""
    
    if file_type == 'def':
        # Команды
        for cmd, (_, definition) in library['commands'].items():
            content += f"{cmd} : {definition}\n"
        
        # Блоки данных
        for block, (_, block_content) in library['blocks'].items():
            content += f"\n{block} {{\n{block_content}\n}}"
    
    elif file_type == 'tcl':
        # Инициализация
        init_code = """
# ============================================================================
# ИНИЦИАЛИЗАЦИЯ ТИПА ОПЕРАЦИИ
# ============================================================================
set ::OPERATION_TYPE "MILL" ; Значение по умолчанию

proc set_operation_type { type } {
    # Устанавливает тип текущей операции (MILL или LATHE)
    set ::OPERATION_TYPE $type
}
"""
        content += init_code.strip() + "\n\n"
        
        # Глобальные переменные
        for var, (_, value) in library['globals'].items():
            content += f"set ::{var} {value}\n"
        
        content += "\n"
        
        # Процедуры
        for proc, (_, (args, body)) in library['procedures'].items():
            content += f"proc {proc} {args} {body}\n\n"
        
        # Диспетчеры
        for _, (_, dispatcher) in library.get('dispatchers', {}).items():
            content += f"{dispatcher}\n\n"
    
    elif file_type == 'pui':
        # Глобальные настройки
        if 'global_settings' in library:
            _, settings = library['global_settings']
            content += settings + "\n\n"
        
        # Секции
        for _, (_, section_content) in library['sections'].items():
            content += section_content + "\n\n"
    
    return content.strip()

def safe_merge_files(content1, content2, file_type, file_name):
    """Безопасное объединение файлов с резервным вариантом"""
    try:
        # Создаем библиотеки
        lib1 = create_library(content1, file_type)
        lib2 = create_library(content2, file_type)
        
        # Объединяем библиотеки
        merged_lib = merge_libraries(lib1, lib2, file_type)
        
        # Генерируем результат
        return generate_file_from_library(merged_lib, file_type)
    except Exception as e:
        print(f"Ошибка при интеллектуальном объединении {file_name}: {str(e)}")
        print(traceback.format_exc())
        print("Использую простое объединение как резервный вариант")
        return f"{content1}\n\n{content2}"

def main():
    """Основная функция скрипта объединения постпроцессоров"""
    print("=== СИСТЕМА ОБЪЕДИНЕНИЯ ПОСТПРОЦЕССОРОВ ===")
    print("ИНТЕЛЛЕКТУАЛЬНОЕ СЛИЯНИЕ MILL И LATHE В COMBINED")
    
    # Текущая директория
    base_dir = os.getcwd()
    print(f"\nРабочая директория: {base_dir}")
    
    # Исходные файлы
    mill_files = {
        'def': "MILL.def",
        'tcl': "MILL.tcl",
        'pui': "MILL.pui"
    }
    
    lathe_files = {
        'def': "LATHE.def",
        'tcl': "LATHE.tcl",
        'pui': "LATHE.pui"
    }
    
    # Проверка наличия файлов
    missing = False
    for f_type, f_name in mill_files.items():
        if not os.path.exists(f_name):
            print(f"ОШИБКА: Отсутствует файл {f_name}")
            missing = True
    
    for f_type, f_name in lathe_files.items():
        if not os.path.exists(f_name):
            print(f"ОШИБКА: Отсутствует файл {f_name}")
            missing = True
    
    if missing:
        print("\nПрерывание: отсутствуют обязательные файлы")
        sys.exit(1)
    
    # Чтение файлов
    print("\nЧтение и анализ файлов...")
    file_contents = {}
    
    for f_type in ['def', 'tcl', 'pui']:
        try:
            # Чтение MILL файлов
            mill_content = read_file(mill_files[f_type])
            file_contents[f'mill_{f_type}'] = mill_content
            print(f" - {mill_files[f_type]}: {len(mill_content)} символов")
            
            # Чтение LATHE файлов
            lathe_content = read_file(lathe_files[f_type])
            file_contents[f'lathe_{f_type}'] = lathe_content
            print(f" - {lathe_files[f_type]}: {len(lathe_content)} символов")
            
            # Для DEF: дополнительная диагностика
            if f_type == 'def':
                print(f"   Команды в MILL.def: {len(parse_def_file(mill_content)['commands'])}")
                print(f"   Блоки в MILL.def: {len(parse_def_file(mill_content)['blocks'])}")
                print(f"   Команды в LATHE.def: {len(parse_def_file(lathe_content)['commands'])}")
                print(f"   Блоки в LATHE.def: {len(parse_def_file(lathe_content)['blocks'])}")
        except Exception as e:
            print(f"КРИТИЧЕСКАЯ ОШИБКА: {str(e)}")
            traceback.print_exc()
            sys.exit(1)
    
    # Объединение файлов
    print("\nИнтеллектуальное объединение...")
    combined_files = {}
    
    for f_type in ['def', 'tcl', 'pui']:
        print(f"Обработка {f_type.upper()} файлов...")
        mill_content = file_contents[f'mill_{f_type}']
        lathe_content = file_contents[f'lathe_{f_type}']
        
        combined_files[f_type] = safe_merge_files(
            mill_content, lathe_content, f_type, f"COMBINED.{f_type}"
        )
        print(f" - Объединенный размер: {len(combined_files[f_type])} символов")
    
    # Генерация временной метки
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    
    # Запись результатов
    print("\nСоздание объединенных файлов...")
    for f_type in ['def', 'tcl', 'pui']:
        output_file = f"COMBINED_{timestamp}.{f_type}"
        write_file(output_file, combined_files[f_type])
        print(f" - Создан файл: {output_file}")
    
    # Проверка результатов
    print("\nПроверка результатов...")
    success = True
    for f_type in ['def', 'tcl', 'pui']:
        output_file = f"COMBINED_{timestamp}.{f_type}"
        if os.path.exists(output_file):
            size = os.path.getsize(output_file)
            print(f" - {output_file}: {size} байт")
            if size == 0:
                print(f"  ПРЕДУПРЕЖДЕНИЕ: Файл пуст!")
                success = False
        else:
            print(f"  ОШИБКА: Файл {output_file} не создан!")
            success = False
    
    if success:
        print("\nОбъединение успешно завершено!")
    else:
        print("\nОбъединение завершено с ошибками!")
        sys.exit(1)

if __name__ == "__main__":
    main()
