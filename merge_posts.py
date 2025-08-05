import os
import sys
from datetime import datetime
import re

# Скрипт объединения LATHE и MILL постов в единый COMBI

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
LATHE_DEF = 'LATHE.def'
MILL_DEF  = 'MILL.def'
LATHE_TCL = 'LATHE.tcl'
MILL_TCL  = 'MILL.tcl'
LATHE_PUI = 'LATHE.pui'
MILL_PUI  = 'MILL.pui'
COMBI_PREFIX = 'COMBI'
TIMESTAMP = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')


def read_file(name):
    path = os.path.join(SCRIPT_DIR, name)
    if not os.path.isfile(path):
        print(f"Error: file {name} not found in {SCRIPT_DIR}")
        sys.exit(1)
    with open(path, 'r', encoding='utf-8') as f:
        return f.read()


def write_file(name, content):
    out_name = f"{TIMESTAMP}_{name}"
    path = os.path.join(SCRIPT_DIR, out_name)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Generated {out_name}")


def clean_blank_lines(text):
    # Убираем более двух подряд пустых строк
    return re.sub(r"(\n\s*){3,}", "\n\n", text)


def merge_def():
    lathe_text = read_file(LATHE_DEF)
    mill_text  = read_file(MILL_DEF)
    content = lathe_text.rstrip() + '\n\n' + mill_text.rstrip() + '\n'
    content = clean_blank_lines(content)
    write_file(f"{COMBI_PREFIX}.def", content)


def merge_tcl():
    lathe_text = read_file(LATHE_TCL)
    mill_text  = read_file(MILL_TCL)
    # Конкатенация с разделителем
    separator = '\n\n'
    content = lathe_text.rstrip() + separator + mill_text.rstrip() + '\n'
    content = clean_blank_lines(content)
    write_file(f"{COMBI_PREFIX}.tcl", content)


def merge_pui():
    lines = read_file(LATHE_PUI).splitlines()
    out = []
    in_link = False
    for line in lines:
        if '#Linked Posts Sequence Start' in line:
            out.append(line)
            out.append('LATHE')
            out.append('MILL')
            in_link = True
            continue
        if in_link and '#Linked Posts Sequence End' in line:
            out.append(line)
            in_link = False
            continue
        if not in_link:
            out.append(line)
    content = '\n'.join(out) + '\n'
    write_file(f"{COMBI_PREFIX}.pui", content)


def main():
    print(f"Merging posts in {SCRIPT_DIR} at {TIMESTAMP}")
    merge_def()
    merge_tcl()
    merge_pui()

if __name__ == '__main__':
    main()
