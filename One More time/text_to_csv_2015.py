import pandas as pd

# The raw text data (copy-pasted from the conversation)
raw_data = '''
 ILLINOIS 106,879 25,653 24,713 5,709 5,544 4,853 3,687 2,818 2,543 2,343 1,819
 Adams 832 162 159 33 60 52 41 11 18 29 37
 Alexander 97 17 32 5 3 3 2 3 12 2 2
 Bond 192 51 42 4 7 15 16 4 7 2 4
 Boone 398 94 94 28 30 21 10 10 17 6 3
 Brown 47 13 9 1 2 1 0 2 0 1 2
 Bureau 379 101 83 26 25 24 15 8 9 13 3
 Calhoun 50 18 7 2 1 4 2 2 4 2 1
 Carroll 192 48 41 8 11 11 1 2 5 3 0
 Cass 144 34 26 6 12 10 4 4 5 7 2
 Champaign 1,256 220 271 79 71 78 73 14 20 28 17
 Christian 448 112 98 24 25 20 12 6 10 23 10
 Clark 209 54 40 10 18 7 2 3 11 5 1
 Clay 198 43 38 7 19 7 2 4 25 8 5
 Clinton 376 109 63 22 26 19 8 9 6 15 8
 Coles 558 169 130 29 35 22 21 12 14 8 10
 Cook 40,287 10,156 9,553 2,239 1,595 1,607 1,369 1,190 927 873 649
 Chicago 19,308 4,939 4,536 1,052 703 828 563 637 457 421 332
 Suburban Cook 20,979 5,217 5,017 1,187 892 779 806 553 470 452 317
 Crawford 242 73 47 23 13 7 9 3 6 8 4
 Cumberland 125 25 20 13 10 3 7 6 3 3 1
 DeKalb 701 137 165 36 27 44 29 21 19 17 9
 DeWitt 197 37 44 13 9 19 14 6 4 5 5
 Douglas 201 52 49 10 11 10 10 4 5 6 5
 DuPage 6,099 1,356 1,455 344 309 240 218 110 138 129 83
 Edgar 254 66 55 20 17 6 17 4 8 6 3
 Edwards 70 17 15 7 5 1 0 2 2 2 2
 Effingham 405 98 81 35 21 22 22 10 4 8 8
 Fayette 255 50 71 13 26 12 17 8 4 6 3
 Ford 190 48 36 14 14 6 10 0 2 1 1
 Franklin 561 77 133 22 56 41 31 21 14 18 15
 Fulton 466 107 82 21 31 21 17 7 12 9 6
 Gallatin 74 20 13 4 6 3 0 2 1 3 2
 Greene 163 39 40 8 10 12 5 5 2 4 1
 Grundy 396 98 99 17 23 19 11 15 7 10 4
 Hamilton 94 30 27 6 10 2 2 2 1 3 0
 Hancock 168 47 45 5 7 3 8 3 3 5 4
 Hardin 54 11 13 3 10 0 2 2 2 2 0
 Henderson 79 21 19 7 5 2 3 3 2 1 4
 Henry 559 131 142 23 36 19 7 15 16 13 9
 Iroquois 394 90 93 16 25 18 23 14 7 8 7
 Jackson 471 108 99 19 26 35 16 8 14 12 12
 Jasper 98 33 24 5 5 8 4 0 0 3 1
 Jefferson 433 122 74 17 19 30 24 21 19 9 15
 Jersey 239 54 44 10 21 21 16 19 3 0 4
 Jo Daviess 238 57 58 16 10 17 10 4 4 5 0
 Johnson 116 25 25 8 7 6 1 4 1 0 1
 Kane 3,143 672 699 179 170 118 66 116 97 80 48
 Kankakee 1,108 284 267 51 63 41 42 30 15 30 17
 Kendall 587 137 154 31 37 24 15 13 15 9 7
 Knox 705 172 136 31 69 25 41 22 18 21 7
 Lake 4,557 1,003 1,098 222 237 196 158 153 116 81 87
 LaSalle 1,356 346 293 56 89 69 47 42 16 37 24
 Lawrence 221 61 44 7 10 8 16 6 2 4 2
 Lee 366 100 85 26 19 23 21 7 4 11 4
 Livingston 432 113 87 26 11 22 10 10 7 10 4
 Logan 359 74 91 16 29 7 9 5 9 8 5
 McDonough 325 86 71 14 23 12 6 5 2 12 7
 McHenry 2,060 456 482 112 115 112 77 49 68 30 28
 McLean 1,195 277 269 52 75 79 60 32 26 20 19
 Macon 1,249 280 275 62 73 55 35 26 28 26 22
 Macoupin 545 128 116 27 32 30 13 14 14 13 9
 Madison 2,813 677 657 139 176 175 116 55 67 62 48
 Marion 559 145 128 19 51 24 17 17 18 13 13
 Marshall 165 42 45 8 7 9 7 2 4 2 1
 Mason 181 37 36 4 10 7 10 5 6 4 3
 Massac 220 57 46 9 20 8 5 5 1 1 4
 Menard 118 17 35 6 6 6 1 5 4 4 2
 Mercer 184 48 43 12 9 7 10 8 2 0 2
 Monroe 310 69 77 16 15 12 5 6 4 5 5
 Montgomery 366 88 79 26 14 12 28 6 8 9 5
 Morgan 415 124 96 17 23 23 4 10 7 8 7
 Moultrie 198 50 39 8 10 11 3 5 3 3 2
 Ogle 513 114 122 35 28 19 31 10 14 8 9
 Peoria 1,887 394 427 116 112 83 57 35 35 66 48
 Perry 252 61 47 13 14 7 9 9 10 4 6
 Piatt 136 37 33 5 9 5 1 2 2 6 1
 Pike 209 42 52 7 15 12 9 4 3 4 6
 Pope 50 14 14 1 1 1 1 3 2 0 1
 Pulaski 106 34 30 0 10 2 3 2 4 2 3
 Putnam 55 16 15 3 1 1 4 1 0 1 0
 Randolph 386 96 89 28 22 28 14 8 8 3 5
 Richland 226 52 43 14 12 12 2 3 6 10 7
 Rock Island 1,564 424 318 78 95 63 59 39 35 38 28
 St. Clair 2,509 552 588 136 139 122 84 86 76 46 68
 Saline 374 72 84 12 35 20 19 4 13 16 10
 Sangamon 2,010 444 496 112 89 110 45 51 43 51 48
 Schuyler 95 26 23 5 6 6 0 3 3 3 3
 Scott 63 18 17 1 1 2 1 1 2 1 3
 Shelby 263 74 58 14 13 16 3 8 3 9 3
 Stark 92 18 14 4 9 5 8 3 2 1 2
 Stephenson 542 119 117 31 35 21 18 17 9 2 9
 Tazewell 1,498 365 343 82 85 75 50 33 24 38 29
 Union 230 47 54 12 15 7 9 6 10 7 5
 Vermilion 1,019 289 218 50 84 47 28 19 35 7 14
 Wabash 136 32 26 5 7 6 2 3 1 2 1
 Warren 192 46 38 8 22 8 6 3 4 3 2
 Washington 157 38 27 11 12 22 3 1 3 4 3
 Wayne 192 48 52 8 19 4 4 5 4 6 2
 White 238 53 45 13 18 7 4 5 8 5 11
 Whiteside 646 182 139 26 56 29 15 14 16 7 11
 Will 4,331 1,031 1,046 243 214 211 122 109 110 74 59
 Williamson 740 124 148 40 66 48 22 16 24 22 34
 Winnebago 3,003 718 690 137 169 191 98 50 75 60 41
 Woodford 412 97 98 25 29 16 23 8 5 13 2
'''

# Define column names
columns = [
    'County',
    'Total_Deaths',
    'Diseases_of_Heart',
    'Malignant_Neoplasms',
    'Cerebrovascular_Diseases',
    'Chronic_Lower_Respiratory_Diseases',
    'Accidents',
    'Alzheimers_Disease',
    'Diabetes_Mellitus',
    'Nephritis_Nephrotic_Syndrome_Nephrosis',
    'Influenza_and_Pneumonia',
    'Septicemia'
]

# Process the data
lines = [line.strip() for line in raw_data.split('\n') if line.strip()]
data = []

for line in lines:
    parts = line.split()
    if len(parts) >= 11:  # Make sure we have all columns
        # Handle county names that might contain spaces
        num_count = sum(1 for p in parts if any(c.isdigit() for c in p))
        name_parts = parts[:(len(parts) - num_count)]
        numbers = parts[(len(parts) - num_count):]
        
        # Clean up the numbers (remove commas)
        clean_numbers = [int(n.replace(',', '')) for n in numbers]
        
        # Create row with county name and numbers
        row = [' '.join(name_parts)] + clean_numbers
        data.append(row)

# Create DataFrame
df = pd.DataFrame(data, columns=columns)

# Add year column
df['Year'] = 2015

# Save to CSV
output_file = 'csv_output/death_data_2015_manual.csv'
df.to_csv(output_file, index=False)
print(f"Saved {len(data)} records to {output_file}")

# Display first few rows to verify
print("\nFirst few rows of the data:")
print(df.head()) 