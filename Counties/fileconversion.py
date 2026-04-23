import csv
import os
import re
def get_path(file_name, start_dir='/'):
    for root, dirs, files in os.walk(start_dir):
        if file_name in files or file_name in dirs:
            return os.path.join(root, file_name)
    return None
def extractData(year):
    txt_path = get_path(str(year) + '.txt')
    if txt_path is None:
        raise FileNotFoundError("The file '2010.txt' was not found in the specified directory.")
    with open(txt_path, 'rt', encoding='utf-8') as infile:
        lines = infile.readlines()
    headers = [
        'Resident County',
        'Total Deaths',
        'Diseases of heart',
        'Malignant neoplasms',
        'Cerebro vascular diseases (stroke)',
        'Chronic lower respiratory diseases',
        'Accidents',
        "Alzheimer's disease",
        'Nephritis, nephrotic syndrome and nephrosis',
        'Diabetes mellitus',
        'Influenza and pneumonia',
        'Septicemia',
        'Intentional self-harm (suicide)',
        'Chronic liver disease and cirrhosis',
        'All other causes'
    ]
    index = -1
    for i, line in enumerate(lines):
        line = line.strip()
        if line.startswith('ILLINOIS'):
            index = i
            break
    if index == -1:
        raise ValueError("No line starting with 'ILLINOIS' was found in the file")
    with open(str(year) + '.csv', 'w', newline='', encoding='utf-8') as csvout:
        writer = csv.DictWriter(csvout, fieldnames=headers)
        writer.writeheader()   
        for line_number, line in enumerate(lines[index:], start=index+1):
            line = line.strip()
            stats = line.split()
            combined_stats = []
            temp_item = []
            missinglines = 0
            for item in stats:
                if any(char.isalpha() for char in item):
                    temp_item.append(item)
                else:
                    if temp_item:
                        combined_stats.append(" ".join(temp_item))
                        temp_item = []
                    combined_stats.append(item)
            if temp_item:
                combined_stats.append(" ".join(temp_item))
            if len(combined_stats) != len(headers):
                missinglines += 1
            else:
                data = dict(zip(headers, combined_stats))
                writer.writerow(data)
    print(missinglines, 'missing lines for', year)
years = [2009, 2010, 2011]
for year in years:
    extractData(year)