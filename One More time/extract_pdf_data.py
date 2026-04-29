"""
Robust IDPH county death data extractor using pdfplumber.
Works for any year's PDF (2008–present). Pass in pdf_path + year.
Returns a DataFrame of raw death counts with standardized underscore column names.
"""

import re
import pdfplumber
import pandas as pd

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

# Column schemas derived from existing verified CSVs and cross-checked against CDC statistics.
# Each value is (column_name_list) — Total_Deaths is always first.
#
# Column order changes:
#   2008          : Heart, Cancer, Cerebro, CLRD,     Accidents (13 causes)
#   2009–2012     : Heart, Cancer, Cerebro, Accidents, CLRD      (13 causes)
#   2013–2014     : Heart, Cancer, Cerebro, Accidents, CLRD      (12 causes, no All_Other)
#   2015          : Heart, Cancer, Cerebro, CLRD,     Accidents  (10 causes)
#   2016–2019     : Heart, Cancer, Cerebro, Accidents, CLRD      (10 causes)
#   2020–2021     : Heart, Cancer, COVID,   Accidents, Cerebro   (10 causes, COVID verified
#                   from ILLINOIS row: pos-3 = 15715/2020, 11297/2021 = COVID counts)
#   2022          : Heart, Cancer, Accidents, COVID,  Cerebro    (10 causes)

_13_CAUSE_COMMON = [
    'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Cerebrovascular_Diseases',
    'Accidents', 'Chronic_Lower_Respiratory_Diseases', 'Alzheimers_Disease',
    'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
    'Influenza_and_Pneumonia', 'Septicemia',
    'Intentional_Self_Harm', 'Chronic_Liver_Disease_Cirrhosis', 'All_Other_Causes',
]
_12_CAUSE_COMMON = _13_CAUSE_COMMON[:-1]   # drop All_Other_Causes
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
    # 2020–2021: COVID verified as position 3 from ILLINOIS row (15,715 and 11,297)
    **{yr: [
        'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms',
        'COVID_19', 'Accidents', 'Cerebrovascular_Diseases',
        'Chronic_Lower_Respiratory_Diseases', 'Alzheimers_Disease',
        'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
        'Influenza_and_Pneumonia',
    ] for yr in [2020, 2021]},
    # 2022: Accidents before COVID (from header and ILLINOIS row verification)
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
    known = sorted(YEAR_SCHEMAS)
    closest = min(known, key=lambda y: abs(y - year))
    print(f"  Warning: no schema for {year}, using {closest} as fallback")
    return YEAR_SCHEMAS[closest]


def _parse_nums(s: str) -> list[int]:
    return [int(n.replace(',', '')) for n in re.findall(r'[\d,]+', s)]


def _match_county(line: str) -> str | None:
    """Return county name if line starts with a valid county, else None."""
    line = line.strip()
    if not line:
        return None

    tokens = line.split()
    if not tokens:
        return None

    # Two-word prefixes: check two-token names first
    if tokens[0] in MULTI_WORD_PREFIXES and len(tokens) >= 2:
        two = tokens[0] + ' ' + tokens[1]
        if two in VALID_COUNTIES:
            return two
        # "Suburban" alone on a line is handled separately in extract_year
        if tokens[0] == 'Suburban':
            return None

    if tokens[0] in VALID_COUNTIES:
        return tokens[0]

    return None


def extract_year(pdf_path: str, year: int) -> pd.DataFrame:
    """
    Extract all county death counts from one IDPH PDF.
    Returns DataFrame: County + all cause columns + Year.
    """
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

        # --- Special case: "Suburban" alone on a line ---
        if line == 'Suburban':
            if i + 1 < len(all_lines):
                nxt = all_lines[i + 1].strip()
                # nxt is either "Cook <numbers>" or just "<numbers>"
                if nxt.startswith('Cook '):
                    combined = 'Suburban ' + nxt      # → "Suburban Cook 20567 ..."
                else:
                    combined = 'Suburban Cook ' + nxt  # → "Suburban Cook 20567 ..."
                nums = _parse_nums(combined)
                row = _build_row('Suburban Cook', nums, schema)
                if row:
                    rows.append(row)
                i += 2
            else:
                i += 1
            continue

        county = _match_county(line)
        if county:
            nums = _parse_nums(line)
            # If line has too few numbers, try continuing onto the next line
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
    df.insert(df.columns.get_loc('Total_Deaths') + 1 if 'Total_Deaths' in df.columns else 1,
              'Year', year)

    illinois_count = (df['County'] == 'ILLINOIS').sum()
    print(f"  {year}: {len(df)} rows extracted "
          f"({'ILLINOIS found' if illinois_count else 'ILLINOIS MISSING'})")
    return df


def _build_row(county: str, nums: list[int], schema: list[str]) -> dict | None:
    if len(nums) < 2:
        return None
    row: dict = {'County': county}
    for idx, col in enumerate(schema):
        row[col] = nums[idx] if idx < len(nums) else 0
    return row


if __name__ == '__main__':
    import os, sys
    if len(sys.argv) < 3:
        print('Usage: python extract_pdf_data.py <pdf_path> <year>')
        sys.exit(1)
    pdf_path, year = sys.argv[1], int(sys.argv[2])
    df = extract_year(pdf_path, year)
    out = f'csv_output/death_data_{year}_extracted.csv'
    os.makedirs('csv_output', exist_ok=True)
    df.to_csv(out, index=False)
    print(f'Saved to {out}')
    print(df.to_string())
