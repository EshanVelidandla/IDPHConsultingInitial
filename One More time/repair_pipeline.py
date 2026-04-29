"""
End-to-end repair pipeline for IDPH county death rate tables.

Steps:
  1. Re-extract all years from PDFs using extract_pdf_data.py (fixes missing counties,
     fixes 2020-2022 COVID/Cerebrovascular/Accidents column scramble, fixes 2008 zeros).
  2. Derive per-county population estimates from the existing final rate tables
     (rate = count / population * 100000 → population = count / rate * 100000).
  3. Compute death rates for every county × year × cause cell.
  4. Write updated per-cause pivot CSVs to static/death_rate_tables/.

Run from the "One More time" directory:
    python repair_pipeline.py

Requires: pdfplumber, pandas, numpy  (pip install pdfplumber)
Population data: if you have an IDPH population CSV, place it at
    ../Counties/idph_population.csv
    with columns: County, <year1>, <year2>, ...
    and the script will use it directly instead of back-deriving.
"""

import os
import re
import warnings
import numpy as np
import pandas as pd

warnings.filterwarnings('ignore')

from extract_pdf_data import extract_year, VALID_COUNTIES

# ── Paths ──────────────────────────────────────────────────────────────────────

SCRIPT_DIR   = os.path.dirname(os.path.abspath(__file__))
PDF_DIR      = SCRIPT_DIR
CSV_DIR      = os.path.join(SCRIPT_DIR, 'csv_output')
TABLES_DIR   = os.path.join(SCRIPT_DIR, '..', 'processin', 'backend', 'static', 'death_rate_tables')
POP_FILE     = os.path.join(SCRIPT_DIR, '..', 'Counties', 'idph_population.csv')

os.makedirs(CSV_DIR, exist_ok=True)
os.makedirs(TABLES_DIR, exist_ok=True)

YEARS = list(range(2008, 2023))

# Causes that appear in the final rate table files
ALL_CAUSES = [
    'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Accidents',
    'COVID_19', 'Cerebrovascular_Diseases', 'Chronic_Lower_Respiratory_Diseases',
    'Alzheimers_Disease', 'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
    'Influenza_and_Pneumonia', 'Septicemia', 'Intentional_Self_Harm',
    'Chronic_Liver_Disease_Cirrhosis', 'All_Other_Causes',
]

# Counties to keep (excludes sub-county health districts present in 2022 PDF)
VALID_SET = VALID_COUNTIES


# ── Step 1: Extract raw counts from PDFs ──────────────────────────────────────

def _pdf_for_year(year: int) -> str | None:
    for fname in os.listdir(PDF_DIR):
        if not fname.endswith('.pdf'):
            continue
        m = re.search(r'20\d{2}', fname)
        if m and int(m.group()) == year:
            return os.path.join(PDF_DIR, fname)
    return None


def extract_all_years() -> dict[int, pd.DataFrame]:
    """Re-extract raw counts from every PDF. Returns {year: DataFrame}."""
    all_dfs: dict[int, pd.DataFrame] = {}
    for year in YEARS:
        pdf = _pdf_for_year(year)
        if not pdf:
            print(f'  SKIP {year}: no PDF found')
            continue
        print(f'Extracting {year} from {os.path.basename(pdf)}...')
        df = extract_year(pdf, year)
        if df.empty:
            print(f'  ERROR: empty result for {year}')
            continue
        # Keep only valid counties
        df = df[df['County'].isin(VALID_SET)].copy()
        # Drop duplicate county rows (keep first)
        df = df.drop_duplicates(subset='County', keep='first')
        all_dfs[year] = df
        # Save intermediate CSV
        csv_out = os.path.join(CSV_DIR, f'death_data_{year}.csv')
        df.to_csv(csv_out, index=False)
        print(f'  Saved {csv_out} ({len(df)} counties)')
    return all_dfs


# ── Step 2: Load or derive county populations ──────────────────────────────────

def load_population(all_dfs: dict[int, pd.DataFrame]) -> pd.DataFrame:
    """
    Returns a DataFrame with columns: County, 2008, 2009, ..., 2022
    Each cell is the estimated county population for that year.

    Preference order:
      a) idph_population.csv if present
      b) Back-derive from existing final rate tables + raw counts
    """
    if os.path.exists(POP_FILE):
        print(f'\nLoading population from {POP_FILE}')
        pop = pd.read_csv(POP_FILE)
        # Normalise county column name
        pop.columns = [str(c).strip() for c in pop.columns]
        if 'County' not in pop.columns:
            first = pop.columns[0]
            pop = pop.rename(columns={first: 'County'})
        return pop

    print('\nNo idph_population.csv found — back-deriving populations from existing rate tables.')
    return _derive_population(all_dfs)


def _derive_population(all_dfs: dict[int, pd.DataFrame]) -> pd.DataFrame:
    """
    For each (county, year) where:
      - the existing final rate table has a non-zero rate, AND
      - the newly extracted CSV has a non-zero Total_Deaths count,
    compute: population = count / rate * 100_000.

    For gaps, interpolate / extrapolate within the county series.
    """
    rate_file = os.path.join(TABLES_DIR, 'Total_Deaths_death_rates_by_county_year.csv')
    if not os.path.exists(rate_file):
        raise FileNotFoundError(
            f'Cannot find {rate_file}. Run the pipeline once to generate it, '
            'or supply idph_population.csv.'
        )

    rate_df = pd.read_csv(rate_file)
    rate_df = rate_df.set_index('County')

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
                pop = count / rate * 100_000
                populations.setdefault(county, {})[year] = pop

    # Build DataFrame, fill gaps by interpolation
    all_counties = sorted(VALID_SET - {'ILLINOIS'})
    pop_rows = []
    for county in all_counties:
        row = {'County': county}
        series = populations.get(county, {})
        # Fill known years
        for yr in YEARS:
            row[yr] = series.get(yr, np.nan)
        pop_rows.append(row)

    pop_df = pd.DataFrame(pop_rows).set_index('County')
    # Interpolate missing years within each county's series
    pop_df = pop_df.interpolate(axis=1, method='linear', limit_direction='both')
    # Fill any remaining NaN (no data at all for county) with statewide default
    statewide_avg = pop_df.mean()
    pop_df = pop_df.fillna(statewide_avg)

    pop_df = pop_df.reset_index()
    print(f'  Derived populations for {len(pop_df)} counties across {len(YEARS)} years')
    return pop_df


# ── Step 3: Compute rates ──────────────────────────────────────────────────────

def compute_rates(
    all_dfs: dict[int, pd.DataFrame],
    pop_df: pd.DataFrame,
) -> dict[str, pd.DataFrame]:
    """
    Returns {cause: pivot_DataFrame} where pivot has County as rows, years as columns,
    and values are deaths per 100,000 population (2 decimal places).
    """
    pop_indexed = pop_df.set_index('County')

    # Build a dict: cause → {county → {year → rate}}
    cause_data: dict[str, dict[str, dict[str, float]]] = {c: {} for c in ALL_CAUSES}

    for year, df in all_dfs.items():
        yr_str = str(year)
        for _, row in df.iterrows():
            county = row['County']
            if county == 'ILLINOIS':
                continue  # Illinois statewide rate is recalculated separately

            # Get population for this county/year
            if county in pop_indexed.index and year in pop_indexed.columns:
                pop = pop_indexed.at[county, year]
            else:
                pop = np.nan

            for cause in ALL_CAUSES:
                if cause not in row.index:
                    continue
                count = row[cause]
                if pd.isna(count) or count == 0 or pd.isna(pop) or pop <= 0:
                    continue
                rate = round(count / pop * 100_000, 2)
                cause_data[cause].setdefault(county, {})[yr_str] = rate

    # Build pivot tables
    all_counties = sorted(VALID_SET - {'ILLINOIS'})
    year_cols = [str(y) for y in YEARS]

    pivots: dict[str, pd.DataFrame] = {}
    for cause in ALL_CAUSES:
        rows = []
        for county in all_counties:
            r = {'County': county}
            for yr in year_cols:
                r[yr] = cause_data[cause].get(county, {}).get(yr, 0.0)
            rows.append(r)
        pivot = pd.DataFrame(rows)

        # Add weighted ILLINOIS row (population-weighted mean across all non-ILLINOIS counties)
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


# ── Step 4: Write rate tables ──────────────────────────────────────────────────

def write_rate_tables(pivots: dict[str, pd.DataFrame]) -> None:
    for cause, df in pivots.items():
        out = os.path.join(TABLES_DIR, f'{cause}_death_rates_by_county_year.csv')
        df.to_csv(out, index=False)
        non_zero = (df.iloc[:, 1:].values != 0).sum()
        print(f'  Wrote {out} ({non_zero} non-zero cells)')


# ── Step 5: Audit ─────────────────────────────────────────────────────────────

def audit(all_dfs: dict[int, pd.DataFrame]) -> None:
    """Print a summary of which counties are present/missing per year."""
    expected = VALID_SET - {'ILLINOIS'}
    print('\n-- County Audit --')
    for year in YEARS:
        if year not in all_dfs:
            print(f'{year}: NO DATA')
            continue
        df = all_dfs[year]
        present = set(df['County'].tolist()) - {'ILLINOIS'}
        missing = expected - present
        dupes = [c for c in df['County'] if list(df['County']).count(c) > 1]
        status = 'OK' if not missing and not dupes else 'ISSUES'
        print(f'{year}: {len(present)}/104 counties | {status}', end='')
        if missing:
            print(f' | MISSING: {sorted(missing)}', end='')
        if dupes:
            print(f' | DUPES: {sorted(set(dupes))}', end='')
        print()


# ── Main ───────────────────────────────────────────────────────────────────────

def main() -> None:
    os.chdir(SCRIPT_DIR)

    print('=' * 60)
    print('STEP 1  Extract raw counts from PDFs')
    print('=' * 60)
    all_dfs = extract_all_years()

    audit(all_dfs)

    print('\n' + '=' * 60)
    print('STEP 2  Load / derive county populations')
    print('=' * 60)
    pop_df = load_population(all_dfs)

    print('\n' + '=' * 60)
    print('STEP 3  Compute death rates per 100,000 population')
    print('=' * 60)
    pivots = compute_rates(all_dfs, pop_df)

    print('\n' + '=' * 60)
    print('STEP 4  Write final rate tables')
    print('=' * 60)
    write_rate_tables(pivots)

    print('\nPipeline complete.')
    print(f'  Intermediate CSVs -> {CSV_DIR}')
    print(f'  Rate tables       -> {TABLES_DIR}')
    print()
    print('Next step: if you have the IDPH population CSV, place it at')
    print(f'  {POP_FILE}')
    print('and re-run this script for more accurate rates.')


if __name__ == '__main__':
    main()
