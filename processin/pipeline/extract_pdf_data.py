"""
Robust IDPH county death data extractor using pdfplumber.

Library module used by deaths_pipeline.py. Also runnable standalone:
  python extract_pdf_data.py <pdf_path> <year>

Returns a DataFrame: County + cause columns + Year.
Handles year-specific column order changes (2008, 2009-2012, 2013-2014,
2015, 2016-2019, 2020-2021, 2022).
"""

import os
import re
import sys

import pandas as pd
import pdfplumber

VALID_COUNTIES = {
    'Adams', 'Alexander', 'Bond', 'Boone', 'Brown', 'Bureau', 'Calhoun', 'Carroll', 'Cass',
    'Champaign', 'Chicago', 'Christian', 'Clark', 'Clay', 'Clinton', 'Coles', 'Cook',
    'Crawford', 'Cumberland', 'DeKalb', 'DeWitt', 'Douglas', 'DuPage', 'Edgar', 'Edwards',
    'Effingham', 'Fayette', 'Ford', 'Franklin', 'Fulton', 'Gallatin', 'Greene', 'Grundy',
    'Hamilton', 'Hancock', 'Hardin', 'Henderson', 'Henry', 'ILLINOIS', 'Iroquois', 'Jackson',
    'Jasper', 'Jefferson', 'Jersey', 'Jo Daviess', 'Johnson', 'Kane', 'Kankakee', 'Kendall',
    'Knox', 'LaSalle', 'Lake', 'Lawrence', 'Lee', 'Livingston', 'Logan', 'Macon', 'Macoupin',
    'Madison', 'Marion', 'Marshall', 'Mason', 'Massac', 'McDonough', 'McHenry', 'McLean',
    'Menard', 'Mercer', 'Monroe', 'Montgomery', 'Morgan', 'Moultrie', 'Ogle', 'Peoria', 'Perry',
    'Piatt', 'Pike', 'Pope', 'Pulaski', 'Putnam', 'Randolph', 'Richland', 'Rock Island',
    'Saline', 'Sangamon', 'Schuyler', 'Scott', 'Shelby', 'St. Clair', 'Stark', 'Stephenson',
    'Suburban Cook', 'Tazewell', 'Union', 'Vermilion', 'Wabash', 'Warren', 'Washington',
    'Wayne', 'White', 'Whiteside', 'Will', 'Williamson', 'Winnebago', 'Woodford',
}

MULTI_WORD_PREFIXES = {'Jo', 'Rock', 'St.', 'Suburban'}

# Per-year column schemas derived from IDPH PDF structure verification.
# Column order changed across years — each schema maps position → cause name.
_13_CAUSE_COMMON = [
    'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Cerebrovascular_Diseases',
    'Accidents', 'Chronic_Lower_Respiratory_Diseases', 'Alzheimers_Disease',
    'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
    'Influenza_and_Pneumonia', 'Septicemia',
    'Intentional_Self_Harm', 'Chronic_Liver_Disease_Cirrhosis', 'All_Other_Causes',
]
_12_CAUSE_COMMON = _13_CAUSE_COMMON[:-1]
_10_CAUSE_CEREB_FIRST = [
    'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Cerebrovascular_Diseases',
    'Accidents', 'Chronic_Lower_Respiratory_Diseases', 'Alzheimers_Disease',
    'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
    'Influenza_and_Pneumonia', 'Septicemia',
]
_10_CAUSE_2015 = [
    'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Cerebrovascular_Diseases',
    'Chronic_Lower_Respiratory_Diseases', 'Accidents', 'Alzheimers_Disease',
    'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
    'Influenza_and_Pneumonia', 'Septicemia',
]

YEAR_SCHEMAS: dict[int, list[str]] = {
    2008: [
        'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Cerebrovascular_Diseases',
        'Chronic_Lower_Respiratory_Diseases', 'Accidents', 'Alzheimers_Disease',
        'Diabetes_Mellitus', 'Influenza_and_Pneumonia', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
        'Septicemia', 'Intentional_Self_Harm', 'Chronic_Liver_Disease_Cirrhosis', 'All_Other_Causes',
    ],
    **{yr: _13_CAUSE_COMMON for yr in range(2009, 2013)},
    **{yr: _12_CAUSE_COMMON for yr in range(2013, 2015)},
    2015: _10_CAUSE_2015,
    **{yr: _10_CAUSE_CEREB_FIRST for yr in range(2016, 2020)},
    **{yr: [
        'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms',
        'COVID_19', 'Accidents', 'Cerebrovascular_Diseases',
        'Chronic_Lower_Respiratory_Diseases', 'Alzheimers_Disease',
        'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
        'Influenza_and_Pneumonia',
    ] for yr in [2020, 2021]},
    2022: [
        'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms',
        'Accidents', 'COVID_19', 'Cerebrovascular_Diseases',
        'Chronic_Lower_Respiratory_Diseases', 'Alzheimers_Disease',
        'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
        'Influenza_and_Pneumonia',
    ],
}


def get_schema(year: int) -> list[str]:
    if year in YEAR_SCHEMAS:
        return YEAR_SCHEMAS[year]
    closest = min(YEAR_SCHEMAS, key=lambda y: abs(y - year))
    print(f"  Warning: no schema for {year}, using {closest} as fallback")
    return YEAR_SCHEMAS[closest]


def _parse_nums(s: str) -> list[int]:
    return [int(n.replace(',', '')) for n in re.findall(r'[\d,]+', s)]


def _match_county(line: str) -> str | None:
    line = line.strip()
    if not line:
        return None
    tokens = line.split()
    if not tokens:
        return None
    if tokens[0] in MULTI_WORD_PREFIXES and len(tokens) >= 2:
        two = tokens[0] + ' ' + tokens[1]
        if two in VALID_COUNTIES:
            return two
        if tokens[0] == 'Suburban':
            return None
    if tokens[0] in VALID_COUNTIES:
        return tokens[0]
    return None


def _build_row(county: str, nums: list[int], schema: list[str]) -> dict | None:
    if len(nums) < 2:
        return None
    row: dict = {'County': county}
    for idx, col in enumerate(schema):
        row[col] = nums[idx] if idx < len(nums) else 0
    return row


def extract_year(pdf_path: str, year: int) -> pd.DataFrame:
    """Extract all county death counts from one IDPH PDF."""
    schema = get_schema(year)
    all_lines: list[str] = []
    with pdfplumber.open(pdf_path) as pdf:
        for page in pdf.pages:
            text = page.extract_text()
            if text:
                all_lines.extend(text.split('\n'))

    rows: list[dict] = []
    i = 0
    while i < len(all_lines):
        line = all_lines[i].strip()

        if line == 'Suburban':
            if i + 1 < len(all_lines):
                nxt = all_lines[i + 1].strip()
                combined = 'Suburban ' + nxt if nxt.startswith('Cook ') else 'Suburban Cook ' + nxt
                row = _build_row('Suburban Cook', _parse_nums(combined), schema)
                if row:
                    rows.append(row)
                i += 2
            else:
                i += 1
            continue

        county = _match_county(line)
        if county:
            nums = _parse_nums(line)
            if len(nums) < len(schema) and i + 1 < len(all_lines):
                nxt = all_lines[i + 1].strip()
                if nxt and not _match_county(nxt) and nxt != 'Suburban':
                    nums = nums + _parse_nums(nxt)
                    i += 1
            row = _build_row(county, nums, schema)
            if row:
                rows.append(row)
        i += 1

    if not rows:
        print(f"  Warning: no rows extracted from {pdf_path}")
        return pd.DataFrame()

    df = pd.DataFrame(rows)
    df.insert(df.columns.get_loc('Total_Deaths') + 1 if 'Total_Deaths' in df.columns else 1, 'Year', year)
    illinois_found = (df['County'] == 'ILLINOIS').sum() > 0
    print(f"  {year}: {len(df)} rows ({'ILLINOIS found' if illinois_found else 'ILLINOIS MISSING'})")
    return df


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print('Usage: python extract_pdf_data.py <pdf_path> <year>')
        sys.exit(1)
    pdf_path, year = sys.argv[1], int(sys.argv[2])
    df = extract_year(pdf_path, year)
    out_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'csv_output')
    os.makedirs(out_dir, exist_ok=True)
    out = os.path.join(out_dir, f'death_data_{year}_extracted.csv')
    df.to_csv(out, index=False)
    print(f'Saved to {out}')
