import csv

# Raw text data as a string
raw_data = '''ILLINOIS 110,012 25,747 23,877 6,013 5,853 5,639 4,029 2,879 2,644 2,562 1,790
Adams 871 181 162 51 48 56 49 9 20 18 26
Alexander 86 22 18 4 1 8 5 5 1 0 1
Bond 162 38 36 9 13 8 7 1 5 3 5
Boone 479 117 101 27 18 27 17 13 9 10 2
Brown 57 13 13 2 5 4 0 1 1 2 0
Bureau 391 102 87 24 17 25 9 6 15 6 4
Calhoun 50 17 9 1 5 2 5 0 0 0 0
Carroll 191 56 31 15 5 9 4 6 5 1 5
Cass 136 27 32 9 4 17 1 1 2 1 3
Champaign 1,365 268 256 98 57 91 79 32 42 29 9
Christian 430 95 100 15 15 31 11 6 9 16 17
Clark 205 43 50 13 14 15 7 6 3 5 6
Clay 182 54 41 5 6 17 3 5 2 3 0
Clinton 353 88 79 21 20 20 16 6 8 8 9
Coles 520 110 98 26 34 24 22 12 5 22 8
Cook 41,096 10,194 8,984 2,231 2,439 1,605 1,215 1,119 1,094 984 596
Chicago 19,660 4,874 4,130 1,304 1,172 727 499 594 520 466 296
Suburban Cook 21,436 5,320 4,854 927 1,267 878 716 525 574 518 300
Crawford 217 58 51 7 11 15 11 4 6 2 5
Cumberland 111 20 20 4 6 8 3 3 4 9 2
DeKalb 753 152 173 43 40 40 40 11 14 12 5
DeWitt 203 47 48 7 15 14 18 4 3 5 3
Douglas 190 33 50 13 7 15 18 2 5 5 2
DuPage 6,444 1,478 1,384 286 378 267 267 128 133 140 77
Edgar 235 61 38 9 8 18 2 10 9 5 3
Edwards 70 22 11 4 5 1 1 1 1 2 2
Effingham 397 74 63 25 17 36 25 14 5 6 10
Fayette 230 47 45 14 13 18 11 9 6 9 2
Ford 209 41 48 9 7 20 5 4 4 6 3
Franklin 493 100 83 27 13 40 26 14 14 20 20
Fulton 487 105 106 22 21 33 25 10 8 18 9
Gallatin 86 16 20 4 4 5 1 2 6 2 1
Greene 160 39 31 9 4 16 12 8 6 4 4
Grundy 414 84 92 24 21 23 23 24 7 3 3
Hamilton 101 23 24 3 8 7 3 4 3 4 3
Hancock 205 42 45 16 13 13 8 2 5 4 5
Hardin 63 14 12 3 3 2 0 2 1 0 1
Henderson 98 34 18 6 4 8 4 4 0 3 1
Henry 534 147 116 25 22 33 16 12 11 11 8
Iroquois 404 101 85 28 17 26 21 13 9 7 10
Jackson 520 101 115 36 20 36 19 17 18 11 15
Jasper 96 25 22 5 4 5 5 4 1 3 2
Jefferson 477 123 98 35 17 30 25 9 9 6 10
Jersey 275 64 54 23 16 18 24 9 3 8 5
Jo Daviess 235 57 53 9 13 9 12 5 7 3 2
Johnson 151 29 33 11 3 14 5 4 4 2 6
Kane 3,405 701 763 158 195 146 75 88 102 75 63
Kankakee 1,153 325 241 70 66 62 56 18 33 27 24
Kendall 598 102 145 32 28 38 19 16 12 12 11
Knox 681 161 125 26 28 55 60 19 17 21 11
Lake 4,780 966 1,150 256 207 233 199 128 107 121 110
LaSalle 1,342 314 322 90 64 90 53 31 20 34 17
Lawrence 209 30 52 14 10 16 13 11 2 5 7
Lee 380 97 73 18 17 30 20 7 13 7 3
Livingston 472 112 101 32 28 32 27 11 4 12 4
Logan 377 84 75 20 20 29 22 9 3 18 6
McDonough 316 66 50 15 20 23 13 6 12 6 10
McHenry 2,224 485 539 132 102 122 101 63 54 34 32
McLean 1,281 308 269 64 46 85 92 37 24 14 23
Macon 1,270 270 253 59 68 92 49 27 25 30 27
Macoupin 556 129 132 31 21 40 16 7 3 23 11
Madison 3,016 722 631 211 178 162 161 77 66 57 60
Marion 549 142 131 25 35 38 22 6 20 8 6
Marshall 169 43 40 7 14 12 6 3 3 5 3
Mason 191 35 47 10 15 10 8 14 4 4 1
Massac 206 48 34 8 14 19 15 5 10 4 4
Menard 121 23 34 10 3 3 0 5 5 5 2
Mercer 217 48 54 17 5 10 6 6 5 2 0
Monroe 310 78 56 11 10 24 6 7 8 11 2
Montgomery 357 62 79 31 18 27 18 6 6 9 10
Morgan 431 156 87 25 18 29 6 4 3 15 5
Moultrie 191 52 32 11 3 9 5 6 1 4 1
Ogle 517 119 119 18 22 30 34 10 10 6 8
Peoria 1,853 389 370 105 88 88 75 45 37 54 39
Perry 242 47 45 8 13 22 5 15 12 3 5
Piatt 153 35 33 7 4 14 7 7 2 5 2
Pike 189 51 41 7 8 9 2 9 1 2 1
Pope 50 13 6 4 3 5 0 2 2 1 0
Pulaski 85 31 25 5 0 5 1 0 3 1 1
Putnam 55 13 15 1 3 2 1 1 1 4 2
Randolph 378 81 83 32 14 21 10 21 5 15 10
Richland 198 54 37 5 9 13 3 4 6 14 4
Rock Island 1,638 374 338 78 81 122 52 57 41 29 27
St. Clair 2,724 639 558 163 158 149 90 105 61 51 63
Saline 361 72 68 17 22 31 10 8 13 13 11
Sangamon 2,022 461 441 110 91 96 56 47 38 62 45
Schuyler 117 27 21 7 10 9 0 1 3 5 2
Scott 48 9 16 2 2 1 1 2 0 2 0
Shelby 246 65 48 13 11 11 8 6 3 9 6
Stark 88 13 21 3 6 7 5 6 2 1 0
Stephenson 554 120 132 52 28 25 23 17 7 12 6
Tazewell 1,447 336 308 64 70 71 66 40 24 40 29
Union 227 61 50 1 8 14 5 3 5 4 5
Vermilion 972 233 196 52 37 72 39 33 17 24 17
Wabash 113 25 26 2 7 10 4 3 5 2 2
Warren 200 56 45 7 11 15 6 9 2 4 2
Washington 159 41 30 8 4 14 2 1 1 7 2
Wayne 202 40 43 16 10 18 4 4 3 2 3
White 209 53 39 6 11 22 5 4 8 7 4
Whiteside 708 190 149 27 23 48 28 10 15 21 8
Will 4,812 1,050 1,141 251 253 252 162 145 137 101 55
Williamson 759 143 163 36 30 60 13 15 22 17 23
Winnebago 3,062 701 628 242 147 203 137 67 70 55 39
Woodford 372 82 91 18 25 14 27 3 3 8 6'''

# Define the column headers
headers = ['County', 'Total Deaths', 'Diseases of Heart', 'Malignant Neoplasms', 
          'Accidents', 'Cerebrovascular Diseases', 'Chronic Lower Respiratory Diseases',
          'Alzheimer Disease', 'Diabetes Mellitus', 'Nephritis Nephrotic Syndrome Nephrosis',
          'Influenza and Pneumonia', 'Septicemia']

# Process the data
rows = []
for line in raw_data.strip().split('\n'):
    # Split the line into parts and clean up the data
    parts = line.split()
    
    # Handle county names with spaces
    if parts[0] in ['Suburban', 'Jo', 'Rock', 'St.']:  # Special cases
        if parts[0] == 'Rock':
            county = 'Rock Island'
            values = parts[2:]
        elif parts[0] == 'St.':
            county = 'St. Clair'
            values = parts[2:]
        else:
            county = parts[0] + ' ' + parts[1]
            values = parts[2:]
    else:
        county = parts[0]
        values = parts[1:]
    
    # Remove commas from numbers and convert to integers
    values = [int(v.replace(',', '')) for v in values]
    
    # Create the row with county name and values
    row = [county] + values
    rows.append(row)

# Write to CSV
output_file = 'csv_output/death_data_2018.csv'
with open(output_file, 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(headers)
    writer.writerows(rows)

print(f"Data has been written to {output_file}") 