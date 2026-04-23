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
    refactored_lines = []
    txt_path = get_path(str(year) + '.txt')
    with open(txt_path, 'rt', encoding='utf-8') as infile:
        lines = infile.readlines()
    for i, line in enumerate(lines):   
        line = line.strip()
        if 'Cause of Death' in line:
            continue
        if 'Resident County' in line:
            line = 'Resident County'
        elif 'Deaths' in line:
            line = 'Total Deaths'
        elif line[0].islower():
                if any(char.isupper() for char in line):
                    lines[i - 1] = lines[i - 1] + line[:findUpper(line)]
                    #lines.remove(line)
                else:
                    lines[i - 1] = lines[i - 1] + line
        refactored_lines.append(line)
    return refactored_lines
for line in refactorFile(2011):
    print(line)