import csv
import os
import re
def get_path(file_name, start_dir='/'):
    for root, dirs, files in os.walk(start_dir):
        if file_name in files or file_name in dirs:
            return os.path.join(root, file_name)
    return None
def findUpper(string):
    match = re.search(r'[A-Z]', string)
    return match.start() if match else -1
def refactorFile(year):
    newlines = []
    txt_path = get_path(str(year) + '.txt')
    if txt_path is None:
        raise FileNotFoundError(f"The file '{year}.txt' was not found in the specified directory.")
    with open(txt_path, 'rt', encoding='utf-8') as infile:
        lines = infile.readlines()
    for i, line in enumerate(lines):
        if 'Cause of Death' in line:
            lines.remove(line)
        if 'Resident County' in line:
            line = 'Resident County'
        elif 'Deaths' in line:
            line = 'Total Deaths'
        elif 'Resident County' not in line:
            if line[1].islower():
                lines[i - 1] += line[:findUpper(line)]
                lines.remove(line)
        newlines.append(line)
    return newlines
for line in refactorFile(2011):
    print(line)