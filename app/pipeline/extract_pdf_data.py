"""
IDPH county death-count extractor.

Library module used by deaths_pipeline.py. Also runnable standalone:
  python extract_pdf_data.py <pdf_path> <year>

Returns a DataFrame: County + cause columns + Year. Missing or suppressed
cells come back as NaN, never 0.

Column order changes between IDPH report years. YEAR_SCHEMAS below was
verified cell by cell against the source PDFs in data/source/idph_death_reports/
on 2026-09-29. Nine of the fifteen years had been mapped wrongly before that
check, which silently filed one cause's deaths under another's name.

verify_header_order() re-checks the schema against each PDF's own header row at
extraction time, so a wrong mapping fails the run instead of reaching the
dashboard.
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

# Tokens IDPH uses for a cell that is not a number: suppressed, not applicable,
# or simply absent. These hold their column position and become NaN.
SUPPRESSION_TOKENS = {'*', '**', '-', '--', 'n/a', 'na', 'N/A', '.', 'NA'}

TOTAL = 'Total_Deaths'
HEART = 'Diseases_of_Heart'
CANCER = 'Malignant_Neoplasms'
STROKE = 'Cerebrovascular_Diseases'
CLRD = 'Chronic_Lower_Respiratory_Diseases'
ACCIDENT = 'Accidents'
ALZ = 'Alzheimers_Disease'
DIABETES = 'Diabetes_Mellitus'
KIDNEY = 'Nephritis_Nephrotic_Syndrome_Nephrosis'
FLU = 'Influenza_and_Pneumonia'
SEPSIS = 'Septicemia'
SUICIDE = 'Intentional_Self_Harm'
LIVER = 'Chronic_Liver_Disease_Cirrhosis'
OTHER = 'All_Other_Causes'
COVID = 'COVID_19'

# Position -> cause, per report year. Verified against the source PDFs.
# The volatile stretch is positions 3-5, where IDPH reordered stroke, chronic
# lower respiratory disease and accidents almost every year, and positions 7-8,
# where diabetes and kidney disease swapped in 2010-2011.
YEAR_SCHEMAS: dict[int, list[str]] = {
    2008: [TOTAL, HEART, CANCER, STROKE, CLRD, ACCIDENT, ALZ, DIABETES, FLU, KIDNEY, SEPSIS, SUICIDE, LIVER, OTHER],
    2009: [TOTAL, HEART, CANCER, CLRD, STROKE, ACCIDENT, ALZ, DIABETES, KIDNEY, FLU, SEPSIS, SUICIDE, LIVER, OTHER],
    2010: [TOTAL, HEART, CANCER, STROKE, CLRD, ACCIDENT, ALZ, KIDNEY, DIABETES, FLU, SEPSIS, SUICIDE, LIVER, OTHER],
    2011: [TOTAL, HEART, CANCER, STROKE, CLRD, ACCIDENT, ALZ, KIDNEY, DIABETES, FLU, SEPSIS, SUICIDE, LIVER, OTHER],
    2012: [TOTAL, HEART, CANCER, STROKE, CLRD, ACCIDENT, ALZ, DIABETES, KIDNEY, FLU, SEPSIS, SUICIDE, LIVER, OTHER],
    2013: [TOTAL, HEART, CANCER, CLRD, STROKE, ACCIDENT, ALZ, DIABETES, KIDNEY, FLU, SEPSIS, SUICIDE, LIVER],
    2014: [TOTAL, HEART, CANCER, CLRD, STROKE, ACCIDENT, ALZ, DIABETES, KIDNEY, FLU, SEPSIS, SUICIDE, LIVER],
    2015: [TOTAL, HEART, CANCER, STROKE, CLRD, ACCIDENT, ALZ, DIABETES, KIDNEY, FLU, SEPSIS],
    2016: [TOTAL, HEART, CANCER, STROKE, CLRD, ACCIDENT, ALZ, DIABETES, KIDNEY, FLU, SEPSIS],
    2017: [TOTAL, HEART, CANCER, STROKE, ACCIDENT, CLRD, ALZ, DIABETES, KIDNEY, FLU, SEPSIS],
    2018: [TOTAL, HEART, CANCER, ACCIDENT, STROKE, CLRD, ALZ, DIABETES, KIDNEY, FLU, SEPSIS],
    2019: [TOTAL, HEART, CANCER, STROKE, ACCIDENT, CLRD, ALZ, DIABETES, KIDNEY, FLU, SEPSIS],
    2020: [TOTAL, HEART, CANCER, COVID, ACCIDENT, STROKE, CLRD, ALZ, DIABETES, KIDNEY, FLU],
    2021: [TOTAL, HEART, CANCER, COVID, ACCIDENT, STROKE, CLRD, ALZ, DIABETES, KIDNEY, LIVER],
    2022: [TOTAL, HEART, CANCER, ACCIDENT, COVID, STROKE, CLRD, ALZ, DIABETES, KIDNEY, FLU],
}

# Distinctive substrings of each cause's printed header label, matched against
# the PDF header with all whitespace stripped. Used only by the header guard.
HEADER_KEYWORDS: dict[str, tuple[str, ...]] = {
    TOTAL: ('totaldeath',),
    HEART: ('ofheart', 'oftheheart'),
    CANCER: ('malignant', 'neoplasm'),
    STROKE: ('cerebro', 'stroke'),
    CLRD: ('chroniclower',),
    ACCIDENT: ('accident',),
    ALZ: ('alzheimer',),
    DIABETES: ('diabetes', 'mellitus'),
    KIDNEY: ('nephritis', 'nephrotic'),
    FLU: ('influenza',),
    SEPSIS: ('septicemia',),
    SUICIDE: ('self-harm', 'selfharm', 'suicide'),
    LIVER: ('liverdisease', 'cirrhosis'),
    OTHER: ('allother',),
    COVID: ('covid',),
}


class SchemaError(RuntimeError):
    """Raised when a PDF's printed column order disagrees with YEAR_SCHEMAS."""


def get_schema(year: int) -> list[str]:
    if year not in YEAR_SCHEMAS:
        raise SchemaError(
            f"No verified column schema for {year}. IDPH reorders columns between "
            f"report years, so guessing from a neighbouring year silently misfiles "
            f"deaths. Add {year} to YEAR_SCHEMAS after checking the PDF header."
        )
    return YEAR_SCHEMAS[year]


def _parse_nums(text: str) -> list[float | None]:
    """
    Split a data line into one value per printed column.

    Numbers may carry thousands separators. Suppression markers keep their
    position and become None so later columns do not shift left, which is how
    counts used to end up filed under the wrong cause.
    """
    values: list[float | None] = []
    for token in text.split():
        cleaned = token.strip().rstrip('.,;')
        if not cleaned:
            continue
        if cleaned in SUPPRESSION_TOKENS:
            values.append(None)
            continue
        digits = cleaned.replace(',', '')
        if digits.isdigit():
            values.append(float(digits))
        # Anything else is a word from the county name and is skipped.
    return values


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


def _build_row(county: str, values: list[float | None], schema: list[str], year: int) -> dict | None:
    """
    Map positional values onto the schema.

    A row with more values than the schema, or fewer than half of them, means
    the line did not parse as expected. Previously these were padded with 0,
    which showed up in the dashboard as "no deaths". Now they raise.
    """
    if len(values) < 2:
        return None
    if len(values) > len(schema):
        raise SchemaError(
            f"{year} {county}: parsed {len(values)} values but the schema has "
            f"{len(schema)} columns. Values: {values}"
        )
    if len(values) < len(schema):
        raise SchemaError(
            f"{year} {county}: parsed only {len(values)} of {len(schema)} columns. "
            f"A suppression marker was probably printed in a form this parser does "
            f"not recognise. Values: {values}"
        )
    row: dict = {'County': county}
    for idx, col in enumerate(schema):
        row[col] = values[idx]
    return row


def _header_labels(page, illinois_top: float, value_centres: list[float]) -> list[str]:
    """
    Reconstruct one header label per data column.

    IDPH header cells wrap over several lines, so words are grouped by how close
    their horizontal centre is to the centre of the ILLINOIS row's value in that
    column. Some years render the header with a space between every character,
    which is why the caller strips whitespace before matching.
    """
    buckets: list[list[str]] = [[] for _ in value_centres]
    for word in page.extract_words():
        if word['top'] >= illinois_top - 2:
            continue
        centre = (word['x0'] + word['x1']) / 2
        nearest = min(range(len(value_centres)), key=lambda i: abs(value_centres[i] - centre))
        if abs(value_centres[nearest] - centre) < 30:
            buckets[nearest].append(word['text'])
    return [''.join(b).lower() for b in buckets]


def verify_header_order(pdf_path: str, year: int, schema: list[str]) -> list[str]:
    """
    Check the PDF's own header against the schema and return any soft warnings.

    Hard-fails when a column's printed label names a different cause than the
    schema expects, which is exactly the defect that mislabelled nine years.
    Stays quiet when a label is too garbled to identify, because a handful of
    IDPH PDFs render headers with merged or character-spaced text.
    """
    with pdfplumber.open(pdf_path) as pdf:
        page = pdf.pages[0]
        words = page.extract_words()
        illinois = [w for w in words if w['text'].startswith('ILLINOIS')]
        if not illinois:
            return [f"{year}: no ILLINOIS row on page 1, header not verified"]
        top = illinois[0]['top']
        value_words = [
            w for w in words
            if abs(w['top'] - top) < 3 and re.fullmatch(r'[\d,]+', w['text'])
        ]
        value_words.sort(key=lambda w: w['x0'])
        centres = [(w['x0'] + w['x1']) / 2 for w in value_words]
        labels = _header_labels(page, top, centres)

    if len(labels) != len(schema):
        raise SchemaError(
            f"{year}: PDF header has {len(labels)} value columns but the schema "
            f"declares {len(schema)}."
        )

    warnings: list[str] = []
    for position, (label, expected) in enumerate(zip(labels, schema)):
        stripped = label.replace(' ', '')
        if any(k in stripped for k in HEADER_KEYWORDS[expected]):
            continue
        other = [
            cause for cause, keys in HEADER_KEYWORDS.items()
            if cause != expected and any(k in stripped for k in keys)
        ]
        if other:
            raise SchemaError(
                f"{year}: column {position} is labelled {other[0]} in the PDF but "
                f"the schema maps it to {expected}. Header text: {label!r}. "
                f"Fix YEAR_SCHEMAS[{year}] before trusting this year's output."
            )
        warnings.append(
            f"{year}: column {position} ({expected}) header text was unreadable "
            f"({label!r}); order not confirmed for this column"
        )
    return warnings


def extract_year(pdf_path: str, year: int, verify: bool = True) -> pd.DataFrame:
    """Extract all county death counts from one IDPH PDF."""
    schema = get_schema(year)

    if verify:
        for warning in verify_header_order(pdf_path, year, schema):
            print(f'  Note: {warning}')

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
                row = _build_row('Suburban Cook', _parse_nums(combined), schema, year)
                if row:
                    rows.append(row)
                i += 2
            else:
                i += 1
            continue

        county = _match_county(line)
        if county:
            values = _parse_nums(line)
            if len(values) < len(schema) and i + 1 < len(all_lines):
                nxt = all_lines[i + 1].strip()
                if nxt and not _match_county(nxt) and nxt != 'Suburban':
                    values = values + _parse_nums(nxt)
                    i += 1
            row = _build_row(county, values, schema, year)
            if row:
                rows.append(row)
        i += 1

    if not rows:
        raise SchemaError(f'No rows extracted from {pdf_path}')

    df = pd.DataFrame(rows)
    df.insert(df.columns.get_loc(TOTAL) + 1 if TOTAL in df.columns else 1, 'Year', year)
    found = (df['County'] == 'ILLINOIS').sum() > 0
    print(f"  {year}: {len(df)} rows ({'ILLINOIS found' if found else 'ILLINOIS MISSING'})")
    return df


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print('Usage: python extract_pdf_data.py <pdf_path> <year>')
        sys.exit(1)
    path, yr = sys.argv[1], int(sys.argv[2])
    frame = extract_year(path, yr)
    out_dir = os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        '..', '..', 'data', 'extracted', 'death_counts_by_year',
    )
    os.makedirs(out_dir, exist_ok=True)
    out = os.path.join(out_dir, f'death_data_{yr}.csv')
    frame.to_csv(out, index=False)
    print(f'Saved to {out}')
