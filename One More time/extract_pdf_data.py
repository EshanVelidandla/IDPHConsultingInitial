"""
Robust IDPH county death data extractor using pdfplumber.
Works for any year's PDF (2008-present) — pass in pdf_path + year.
Returns a DataFrame of raw death counts with standardized column names.
"""

import re
import pdfplumber
import pandas as pd

# All valid Illinois county/region names accepted by the pipeline
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

# Multi-word county names that need special matching
MULTI_WORD_COUNTIES = {
    'Jo Daviess', 'Rock Island', 'St. Clair', 'Suburban Cook',
}

# Canonical column schemas, by year range, in the order values appear in the PDFs.
# These were derived from the existing intermediate CSVs and verified against CDC statistics.
YEAR_SCHEMAS = {
    2008: ['Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Cerebrovascular_Diseases',
           'Chronic_Lower_Respiratory_Diseases', 'Accidents', 'Alzheimers_Disease',
           'Diabetes_Mellitus', 'Influenza_and_Pneumonia', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
           'Septicemia', 'Intentional_Self_Harm', 'Chronic_Liver_Disease_Cirrhosis', 'All_Other_Causes'],
    # 2009-2012: 14 values (Total + 13 causes), Accidents before CLRD
    **{yr: ['Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Cerebrovascular_Diseases',
            'Accidents', 'Chronic_Lower_Respiratory_Diseases', 'Alzheimers_Disease',
            'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
            'Influenza_and_Pneumonia', 'Septicemia', 'Intentional_Self_Harm',
            'Chronic_Liver_Disease_Cirrhosis', 'All_Other_Causes'] for yr in range(2009, 2013)},
    # 2013-2014: 13 values (Total + 12 causes), no All_Other_Causes
    **{yr: ['Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Cerebrovascular_Diseases',
            'Accidents', 'Chronic_Lower_Respiratory_Diseases', 'Alzheimers_Disease',
            'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
            'Influenza_and_Pneumonia', 'Septicemia', 'Intentional_Self_Harm',
            'Chronic_Liver_Disease_Cirrhosis'] for yr in range(2013, 2015)},
    # 2015-2019: 11 values (Total + 10 causes), no Self-harm/Liver/All-other
    **{yr: ['Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Cerebrovascular_Diseases',
            'Chronic_Lower_Respiratory_Diseases', 'Accidents', 'Alzheimers_Disease',
            'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
            'Influenza_and_Pneumonia', 'Septicemia'] for yr in range(2015, 2020)},
    # 2020-2021: 11 values including COVID_19 (Heart, Cancer, Cerebro, COVID, Accidents, CLRD, ...)
    **{yr: ['Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Cerebrovascular_Diseases',
            'COVID_19', 'Accidents', 'Chronic_Lower_Respiratory_Diseases', 'Alzheimers_Disease',
            'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
            'Influenza_and_Pneumonia'] for yr in [2020, 2021]},
    # 2022: Accidents before COVID
    2022: ['Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Accidents',
           'COVID_19', 'Cerebrovascular_Diseases', 'Chronic_Lower_Respiratory_Diseases',
           'Alzheimers_Disease', 'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
           'Influenza_and_Pneumonia'],
}


def _get_schema(year: int) -> list[str]:
    """Return column list for a given year, falling back to the closest known schema."""
    if year in YEAR_SCHEMAS:
        return YEAR_SCHEMAS[year]
    # Fallback: use the schema from the nearest known year
    known = sorted(YEAR_SCHEMAS.keys())
    closest = min(known, key=lambda y: abs(y - year))
    print(f"  Warning: no schema defined for {year}, using {closest} schema as fallback")
    return YEAR_SCHEMAS[closest]


def _parse_numbers(s: str) -> list[int]:
    """Extract all integers from a string (handles comma-separated thousands)."""
    return [int(n.replace(',', '')) for n in re.findall(r'[\d,]+', s)]


def _match_county(line: str) -> str | None:
    """
    Return the county name if this line starts with a valid county, else None.
    Handles multi-word names and 'Suburban' / 'Jo' / 'Rock' / 'St.' prefixes.
    """
    line = line.strip()
    if not line:
        return None

    for county in MULTI_WORD_COUNTIES:
        if line.startswith(county):
            return county

    # Single-word county check
    first_token = line.split()[0] if line.split() else ''
    if first_token in VALID_COUNTIES:
        return first_token

    return None


def extract_year(pdf_path: str, year: int) -> pd.DataFrame:
    """
    Extract county death counts from an IDPH PDF for a given year.
    Returns a DataFrame with County + cause columns.
    """
    schema = _get_schema(year)
    expected_values = len(schema)  # includes Total_Deaths

    all_lines: list[str] = []
    with pdfplumber.open(pdf_path) as pdf:
        for page in pdf.pages:
            text = page.extract_text()
            if text:
                all_lines.extend(text.split('\n'))

    rows = []
    i = 0
    while i < len(all_lines):
        raw = all_lines[i].strip()

        # Special case: "Suburban" appears alone on a line
        if raw == 'Suburban':
            # Next line is either "Cook <numbers>" or just "<numbers>"
            if i + 1 < len(all_lines):
                next_raw = all_lines[i + 1].strip()
                if next_raw.startswith('Cook '):
                    combined = 'Suburban ' + next_raw
                else:
                    combined = 'Suburban Cook ' + next_raw
                county = 'Suburban Cook'
                nums = _parse_numbers(combined)
                if nums:
                    row = _build_row('Suburban Cook', nums, schema)
                    if row:
                        rows.append(row)
                        print(f"  [2-line] Suburban Cook: {nums[:3]}...")
                i += 2
                continue

        county = _match_county(raw)
        if county:
            nums = _parse_numbers(raw)

            # If we got too few numbers, check if the next line continues this row
            if len(nums) < expected_values and i + 1 < len(all_lines):
                next_nums = _parse_numbers(all_lines[i + 1].strip())
                if next_nums and not _match_county(all_lines[i + 1].strip()):
                    nums = nums + next_nums
                    i += 1  # consume continuation line

            row = _build_row(county, nums, schema)
            if row:
                rows.append(row)

        i += 1

    if not rows:
        print(f"  Warning: no data rows found in {pdf_path}")
        return pd.DataFrame()

    df = pd.DataFrame(rows)
    df['Year'] = year

    # Validate: ILLINOIS row should be present
    if 'ILLINOIS' not in df['County'].values:
        print(f"  Warning: ILLINOIS row not found for {year}")

    print(f"  Extracted {len(df)} counties for {year}")
    return df


def _build_row(county: str, nums: list[int], schema: list[str]) -> dict | None:
    """Map a list of extracted integers to the column schema."""
    if len(nums) < 2:
        return None

    row = {'County': county}
    for idx, col in enumerate(schema):
        row[col] = nums[idx] if idx < len(nums) else 0

    return row


if __name__ == '__main__':
    import os
    import sys

    if len(sys.argv) < 3:
        print("Usage: python extract_pdf_data.py <pdf_path> <year>")
        sys.exit(1)

    pdf_path = sys.argv[1]
    year = int(sys.argv[2])
    df = extract_year(pdf_path, year)
    out = f'csv_output/death_data_{year}_extracted.csv'
    os.makedirs('csv_output', exist_ok=True)
    df.to_csv(out, index=False)
    print(f"Saved to {out}")
    print(df.head())
