import os
import re
import shutil
import sys
from datetime import datetime

def merge_postprocessors(mill_dir="mill_post", lathe_dir="lathe_post"):
    """
    Объединяет mill и lathe постпроцессоры в текущей директории
    """
    try:
        # Получаем текущую директорию скрипта
        current_dir = os.path.dirname(os.path.abspath(__file__))
        if not current_dir:
            current_dir = os.getcwd()
        
        # Проверяем существование исходных директорий
        mill_path = os.path.join(current_dir, mill_dir)
        lathe_path = os.path.join(current_dir, lathe_dir)
        
        if not os.path.exists(mill_path):
            print(f"Ошибка: Директория mill постпроцессора не найдена: {mill_path}")
            return None
        if not os.path.exists(lathe_path):
            print(f"Ошибка: Директория lathe постпроцессора не найдена: {lathe_path}")
            return None

        # Создаем выходную директорию
        timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
        combined_dir = os.path.join(current_dir, f"combined_post_{timestamp}")
        os.makedirs(combined_dir, exist_ok=True)
        print(f"Создана выходная директория: {combined_dir}")

        # Основные файлы для обработки
        tcl_files = []
        def_files = []

        # Функция для поиска файлов в директории
        def find_post_files(directory):
            found = {"tcl": [], "def": []}
            for root, _, files in os.walk(directory):
                for file in files:
                    if file.endswith('.tcl'):
                        found["tcl"].append(os.path.join(root, file))
                    elif file.endswith('.def'):
                        found["def"].append(os.path.join(root, file))
            return found

        # Поиск файлов в mill и lathe постпроцессорах
        mill_files = find_post_files(mill_path)
        lathe_files = find_post_files(lathe_path)
        
        # Объединение файлов
        all_files = {
            "tcl": mill_files["tcl"] + lathe_files["tcl"],
            "def": mill_files["def"] + lathe_files["def"]
        }

        # Копирование всех файлов в целевую директорию
        for file_list in all_files.values():
            for file_path in file_list:
                file_name = os.path.basename(file_path)
                shutil.copy2(file_path, os.path.join(combined_dir, file_name))

        # Обработка главного TCL-файла
        main_tcl = find_main_tcl(combined_dir)
        if main_tcl:
            print(f"Обработка главного TCL-файла: {main_tcl}")
            add_safety_checks(main_tcl)
            merge_tcl_content(combined_dir, main_tcl)
        else:
            print("Предупреждение: Главный TCL-файл не найден")

        # Объединение DEF-файлов
        if all_files["def"]:
            def_files = [f for f in os.listdir(combined_dir) if f.endswith('.def')]
            if def_files:
                main_def = os.path.join(combined_dir, def_files[0])
                merge_def_files(main_def, [os.path.join(combined_dir, f) for f in def_files[1:]])

        print(f"Объединение завершено успешно!")
        return combined_dir

    except Exception as e:
        print(f"Ошибка при объединении: {str(e)}")
        import traceback
        traceback.print_exc()
        return None

def find_main_tcl(directory):
    """Находит главный TCL-файл в директории"""
    for file in os.listdir(directory):
        if file.endswith('.tcl'):
            if 'event_handler' in file.lower() or 'main' in file.lower():
                return os.path.join(directory, file)
    # Если не нашли по имени, берем первый попавшийся
    for file in os.listdir(directory):
        if file.endswith('.tcl'):
            return os.path.join(directory, file)
    return None

def merge_tcl_content(directory, main_tcl_path):
    """Объединяет содержимое всех TCL-файлов в главный файл"""
    try:
        # Собираем содержимое всех TCL-файлов
        all_content = []
        for file in os.listdir(directory):
            if file.endswith('.tcl') and file != os.path.basename(main_tcl_path):
                with open(os.path.join(directory, file), 'r', encoding='utf-8') as f:
                    all_content.append(f.read())
        
        # Добавляем в конец главного файла
        if all_content:
            with open(main_tcl_path, 'a', encoding='utf-8') as f_main:
                f_main.write("\n\n" + "\n\n".join(all_content))
                print(f"Объединено {len(all_content)} TCL-файлов в {os.path.basename(main_tcl_path)}")
    
    except Exception as e:
        print(f"Ошибка при объединении TCL-файлов: {str(e)}")

def merge_def_files(target_path, source_paths):
    """Объединяет DEF-файлы"""
    try:
        if not source_paths:
            return
            
        with open(target_path, 'r', encoding='utf-8') as f_target:
            target_content = f_target.readlines()
        
        # Собираем уникальные определения
        formats = {}
        for line in target_content:
            if line.strip().startswith('FORMAT'):
                parts = line.split()
                if len(parts) >= 3:
                    formats[parts[2]] = line
        
        # Добавляем определения из других файлов
        for path in source_paths:
            if os.path.exists(path):
                with open(path, 'r', encoding='utf-8') as f_source:
                    for line in f_source:
                        if line.strip().startswith('FORMAT'):
                            parts = line.split()
                            if len(parts) >= 3 and parts[2] not in formats:
                                formats[parts[2]] = line
        
        # Перезаписываем DEF-файл
        with open(target_path, 'w', encoding='utf-8') as f_out:
            # Сохраняем заголовок
            for line in target_content:
                if not line.strip().startswith('FORMAT'):
                    f_out.write(line)
            
            # Добавляем объединенные форматы
            for format_line in formats.values():
                f_out.write(format_line)
                
        print(f"Объединено {len(source_paths)} DEF-файлов в {os.path.basename(target_path)}")
    
    except Exception as e:
        print(f"Ошибка при объединении DEF-файлов: {str(e)}")

def add_safety_checks(tcl_file_path):
    """Добавляет защитные проверки в TCL-скрипт"""
    try:
        with open(tcl_file_path, 'r+', encoding='utf-8') as f:
            content = f.read()
            
            # Добавляем инициализацию в начало файла
            init_code = """
# ===== [AUTO-GENERATED SAFETY CHECKS] =====
global mom_event_handler_file_name
if {![info exists mom_event_handler_file_name]} {
    set mom_event_handler_file_name "[file tail [info script]]"
}

# Защита от неопределенных переменных
proc safe_get_var {var_name default} {
    upvar $var_name var
    if {[info exists var]} {return $var}
    return $default
}
"""
            # Проверяем, не добавлен ли уже этот код
            if "AUTO-GENERATED SAFETY CHECKS" not in content:
                content = init_code + content
            
            # Добавляем проверки в проблемную процедуру
            if 'PB_CMD_kin_init_mill_turn' in content:
                content = re.sub(
                    r'(\s*set\s+base_name\s+\[file rootname\s+\$mom_event_handler_file_name\])',
                    r'    set base_name [safe_get_var mom_event_handler_file_name "combined_post"]',
                    content
                )
            
            # Перезаписываем файл
            f.seek(0)
            f.write(content)
            f.truncate()
        
        print(f"Добавлены защитные проверки в {os.path.basename(tcl_file_path)}")
    
    except Exception as e:
        print(f"Ошибка при добавлении защитных проверок: {str(e)}")

if __name__ == "__main__":
    # Параметры по умолчанию
    mill_dir = "mill_post"
    lathe_dir = "lathe_post"
    
    # Обработка аргументов командной строки
    if len(sys.argv) > 1:
        mill_dir = sys.argv[1]
    if len(sys.argv) > 2:
        lathe_dir = sys.argv[2]
    
    print(f"Начало объединения постпроцессоров:")
    print(f"  Mill директория: {mill_dir}")
    print(f"  Lathe директория: {lathe_dir}")
    
    result_dir = merge_postprocessors(mill_dir, lathe_dir)
    
    if result_dir:
        print(f"\nОбъединенный постпроцессор создан в:")
        print(f"  {result_dir}")
        print("\nИнструкция по использованию в NX:")
        print("  1. Откройте Post Builder")
        print("  2. Выберите File -> Open")
        print(f"  3. Перейдите в директорию: {result_dir}")
        print("  4. Откройте .pui файл")
    else:
        print("Объединение не удалось. Проверьте сообщения об ошибках.")
