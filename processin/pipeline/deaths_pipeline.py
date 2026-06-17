"""
End-to-end deaths pipeline: PDFs → death rate tables.

Steps:
  1. Re-extract raw counts from PDFs (pdfplumber, year-specific schemas)
  2. Derive or load county populations
  3. Compute death rates (per 100,000 population)
  4. Write per-cause pivot CSVs to backend/static/death_rate_tables/
  5. Audit: report missing/duplicate counties per year

Input:   pipeline/pdfs/*.pdf
Output:  backend/static/death_rate_tables/{cause}_death_rates_by_county_year.csv

Optional: place idph_population.csv at Counties/idph_population.csv for
          more accurate population denominators.

Run: python deaths_pipeline.py
"""

import os
import re
import warnings

import numpy as np
import pandas as pd

warnings.filterwarnings('ignore')

from extract_pdf_data import extract_year, VALID_COUNTIES

BASE       = os.path.dirname(os.path.abspath(__file__))
PDF_DIR    = os.path.join(BASE, "pdfs")
CSV_DIR    = os.path.join(BASE, "csv_output")
TABLES_DIR = os.path.join(BASE, "..", "backend", "static", "death_rate_tables")
POP_FILE   = os.path.join(BASE, "..", "..", "Counties", "idph_population.csv")

os.makedirs(CSV_DIR, exist_ok=True)
os.makedirs(TABLES_DIR, exist_ok=True)

YEARS = list(range(2008, 2023))

ALL_CAUSES = [
    'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Accidents',
    'COVID_19', 'Cerebrovascular_Diseases', 'Chronic_Lower_Respiratory_Diseases',
    'Alzheimers_Disease', 'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
    'Influenza_and_Pneumonia', 'Septicemia', 'Intentional_Self_Harm',
    'Chronic_Liver_Disease_Cirrhosis', 'All_Other_Causes',
]


def _pdf_for_year(year: int) -> str | None:
    for fname in os.listdir(PDF_DIR):
        if not fname.endswith('.pdf'):
            continue
        m = re.search(r'20\d{2}', fname)
        if m and int(m.group()) == year:
            return os.path.join(PDF_DIR, fname)
    return None


def extract_all_years() -> dict[int, pd.DataFrame]:
    all_dfs: dict[int, pd.DataFrame] = {}
    for year in YEARS:
        pdf = _pdf_for_year(year)
        if not pdf:
            print(f'  SKIP {year}: no PDF in {PDF_DIR}')
            continue
        print(f'Extracting {year} from {os.path.basename(pdf)} ...')
        df = extract_year(pdf, year)
        if df.empty:
            print(f'  ERROR: empty result for {year}')
            continue
        df = df[df['County'].isin(VALID_COUNTIES)].copy()
        df = df.drop_duplicates(subset='County', keep='first')
        all_dfs[year] = df
        df.to_csv(os.path.join(CSV_DIR, f'death_data_{year}.csv'), index=False)
    return all_dfs


def load_population(all_dfs: dict[int, pd.DataFrame]) -> pd.DataFrame:
    if os.path.exists(POP_FILE):
        print(f'\nLoading population from {POP_FILE}')
        pop = pd.read_csv(POP_FILE)
        pop.columns = [str(c).strip() for c in pop.columns]
        if 'County' not in pop.columns:
            pop = pop.rename(columns={pop.columns[0]: 'County'})
        return pop
    print('\nNo idph_population.csv — back-deriving populations from existing rate tables.')
    return _derive_population(all_dfs)


def _derive_population(all_dfs: dict[int, pd.DataFrame]) -> pd.DataFrame:
    rate_file = os.path.join(TABLES_DIR, 'Total_Deaths_death_rates_by_county_year.csv')
    if not os.path.exists(rate_file):
        raise FileNotFoundError(
            f'Cannot find {rate_file}. Run the pipeline once first, '
            'or supply Counties/idph_population.csv.'
        )
    rate_df = pd.read_csv(rate_file).set_index('County')
    populations: dict[str, dict[int, float]] = {}
    for year, df in all_dfs.items():
        yr_col = str(year)
        if yr_col not in rate_df.columns:
            continue
        for _, row in df.iterrows():
            county = row['County']
            count = row.get('Total_Deaths', 0)
            if count <= 0:
                continue
            rate = rate_df.at[county, yr_col] if county in rate_df.index else 0
            if rate > 0:
                populations.setdefault(county, {})[year] = count / rate * 100_000

    all_counties = sorted(VALID_COUNTIES - {'ILLINOIS'})
    pop_rows = [{'County': c, **{yr: populations.get(c, {}).get(yr, np.nan) for yr in YEARS}} for c in all_counties]
    pop_df = pd.DataFrame(pop_rows).set_index('County')
    pop_df = pop_df.interpolate(axis=1, method='linear', limit_direction='both')
    pop_df = pop_df.fillna(pop_df.mean())
    pop_df = pop_df.reset_index()
    print(f'  Derived populations for {len(pop_df)} counties')
    return pop_df


def compute_rates(all_dfs: dict[int, pd.DataFrame], pop_df: pd.DataFrame) -> dict[str, pd.DataFrame]:
    pop_indexed = pop_df.set_index('County')
    cause_data: dict[str, dict[str, dict[str, float]]] = {c: {} for c in ALL_CAUSES}

    for year, df in all_dfs.items():
        yr_str = str(year)
        for _, row in df.iterrows():
            county = row['County']
            if county == 'ILLINOIS':
                continue
            pop = pop_indexed.at[county, year] if (county in pop_indexed.index and year in pop_indexed.columns) else np.nan
            for cause in ALL_CAUSES:
                if cause not in row.index:
                    continue
                count = row[cause]
                if pd.isna(count) or count == 0 or pd.isna(pop) or pop <= 0:
                    continue
                cause_data[cause].setdefault(county, {})[yr_str] = round(count / pop * 100_000, 2)

    all_counties = sorted(VALID_COUNTIES - {'ILLINOIS'})
    year_cols = [str(y) for y in YEARS]
    pivots: dict[str, pd.DataFrame] = {}

    for cause in ALL_CAUSES:
        rows = [{'County': c, **{yr: cause_data[cause].get(c, {}).get(yr, 0.0) for yr in year_cols}} for c in all_counties]
        pivot = pd.DataFrame(rows)

        ill_row = {'County': 'ILLINOIS'}
        for yr in year_cols:
            yr_int = int(yr)
            vals, pops = [], []
            for county in all_counties:
                rate = cause_data[cause].get(county, {}).get(yr, 0.0)
                if rate > 0 and county in pop_indexed.index and yr_int in pop_indexed.columns:
                    p = pop_indexed.at[county, yr_int]
                    if p > 0:
                        vals.append(rate * p)
                        pops.append(p)
            ill_row[yr] = round(sum(vals) / sum(pops), 2) if pops else 0.0

        pivot = pd.concat([pd.DataFrame([ill_row]), pivot], ignore_index=True)
        pivots[cause] = pivot
    return pivots


def write_rate_tables(pivots: dict[str, pd.DataFrame]) -> None:
    for cause, df in pivots.items():
        out = os.path.join(TABLES_DIR, f'{cause}_death_rates_by_county_year.csv')
        df.to_csv(out, index=False)
        non_zero = (df.iloc[:, 1:].values != 0).sum()
        print(f'  {cause}: {non_zero} non-zero cells')


def audit(all_dfs: dict[int, pd.DataFrame]) -> None:
    expected = VALID_COUNTIES - {'ILLINOIS'}
    print('\n-- County Audit --')
    for year in YEARS:
        if year not in all_dfs:
            print(f'  {year}: NO DATA')
            continue
        present = set(all_dfs[year]['County'].tolist()) - {'ILLINOIS'}
        missing = expected - present
        dupes = [c for c in all_dfs[year]['County'] if list(all_dfs[year]['County']).count(c) > 1]
        status = 'OK' if not missing and not dupes else 'ISSUES'
        line = f'  {year}: {len(present)} counties | {status}'
        if missing:
            line += f' | MISSING: {sorted(missing)}'
        if dupes:
            line += f' | DUPES: {sorted(set(dupes))}'
        print(line)


def main() -> None:
    if not os.path.isdir(PDF_DIR) or not any(f.endswith('.pdf') for f in os.listdir(PDF_DIR)):
        raise FileNotFoundError(f'No PDFs found in {PDF_DIR}. Place IDPH annual report PDFs there.')

    print('STEP 1  Extract raw counts from PDFs')
    all_dfs = extract_all_years()
    audit(all_dfs)

    if not all_dfs:
        raise RuntimeError('No data extracted from any PDF.')

    print('\nSTEP 2  Load / derive county populations')
    pop_df = load_population(all_dfs)

    print('\nSTEP 3  Compute death rates per 100,000 population')
    pivots = compute_rates(all_dfs, pop_df)

    print('\nSTEP 4  Write final rate tables')
    write_rate_tables(pivots)

    print(f'\nDone. {len(pivots)} cause tables → {TABLES_DIR}')


if __name__ == '__main__':
    main()
