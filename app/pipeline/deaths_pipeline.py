"""
End-to-end deaths pipeline: IDPH PDFs -> crude death rate tables.

Steps:
  1. Extract raw counts from the PDFs (year-specific schemas, header-verified)
  2. Load committed county populations
  3. Compute crude death rates per 100,000 population
  4. Write per-cause pivot CSVs to backend/static/death_rate_tables/
  5. Audit: report missing/duplicate counties and out-of-range rates

Input:   data/source/idph_death_reports/*.pdf
         data/reference/population_by_county_year.csv
Output:  app/backend/static/death_rate_tables/{cause}_death_rates_by_county_year.csv

The rates produced here are CRUDE rates (deaths / population x 100,000), not
age-adjusted. The IDPH county reports publish totals only, with no age
breakdown, so age standardisation is not possible from this source.

Run: python deaths_pipeline.py
"""

import os
import re

import pandas as pd

from extract_pdf_data import extract_year, VALID_COUNTIES, SchemaError

BASE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.join(BASE, "..", "..")
PDF_DIR = os.path.join(REPO, "data", "source", "idph_death_reports")
COUNTS_DIR = os.path.join(REPO, "data", "extracted", "death_counts_by_year")
TABLES_DIR = os.path.join(BASE, "..", "backend", "static", "death_rate_tables")
POP_FILE = os.path.join(REPO, "data", "reference", "population_by_county_year.csv")

YEARS = list(range(2008, 2023))

ALL_CAUSES = [
    'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 'Accidents',
    'COVID_19', 'Cerebrovascular_Diseases', 'Chronic_Lower_Respiratory_Diseases',
    'Alzheimers_Disease', 'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
    'Influenza_and_Pneumonia', 'Septicemia', 'Intentional_Self_Harm',
    'Chronic_Liver_Disease_Cirrhosis', 'All_Other_Causes',
]

# Cook is reported three ways by IDPH: the whole county, Chicago, and the
# suburban remainder. Summing all three would count Cook's deaths twice, so the
# statewide figures use the 102 real counties only.
COOK_SUBDIVISIONS = ['Chicago', 'Suburban Cook']

# An all-cause crude death rate outside this band is not physically plausible
# for a US county and means the denominator is wrong.
ALL_CAUSE_RATE_MIN = 100.0
ALL_CAUSE_RATE_MAX = 3_000.0


def _pdf_for_year(year: int) -> str | None:
    if not os.path.isdir(PDF_DIR):
        return None
    for fname in sorted(os.listdir(PDF_DIR)):
        if not fname.lower().endswith('.pdf'):
            continue
        m = re.search(r'20\d{2}', fname)
        if m and int(m.group()) == year:
            return os.path.join(PDF_DIR, fname)
    return None


def extract_all_years() -> dict[int, pd.DataFrame]:
    os.makedirs(COUNTS_DIR, exist_ok=True)
    all_dfs: dict[int, pd.DataFrame] = {}
    for year in YEARS:
        pdf = _pdf_for_year(year)
        if not pdf:
            raise FileNotFoundError(
                f'No PDF for {year} in {PDF_DIR}. The pipeline covers '
                f'{YEARS[0]}-{YEARS[-1]} and every year must be present.'
            )
        print(f'Extracting {year} from {os.path.basename(pdf)} ...')
        df = extract_year(pdf, year)
        df = df[df['County'].isin(VALID_COUNTIES)].copy()

        # Report duplicates before removing them. The old code dropped first and
        # then looked for duplicates, so this check could never fire.
        dupes = sorted(df.loc[df['County'].duplicated(), 'County'].unique())
        if dupes:
            print(f'  WARNING {year}: duplicate county rows, keeping first: {dupes}')
        df = df.drop_duplicates(subset='County', keep='first')

        all_dfs[year] = df
        df.to_csv(os.path.join(COUNTS_DIR, f'death_data_{year}.csv'), index=False)
    return all_dfs


def load_population() -> pd.DataFrame:
    """
    Load the committed county-by-year denominators.

    There is deliberately no fallback. The previous version back-derived
    populations from the rate table it was about to overwrite, which made every
    run depend on the one before it and gave Suburban Cook the mean county
    population instead of its own.
    """
    if not os.path.exists(POP_FILE):
        raise FileNotFoundError(
            f'Missing {POP_FILE}. Run build_population.py first. The pipeline '
            'will not guess denominators.'
        )
    pop = pd.read_csv(POP_FILE)
    pop.columns = [str(c).strip() for c in pop.columns]
    pop = pop.set_index('County')
    pop.columns = [int(c) for c in pop.columns]

    missing_years = [y for y in YEARS if y not in pop.columns]
    if missing_years:
        raise ValueError(f'{POP_FILE} is missing years: {missing_years}')
    print(f'  {len(pop)} population rows, {YEARS[0]}-{YEARS[-1]}')
    return pop


def compute_rates(all_dfs: dict[int, pd.DataFrame], pop: pd.DataFrame) -> dict[str, pd.DataFrame]:
    """
    Crude rate per 100,000 for every county, cause and year.

    A cause the report did not publish that year stays empty rather than
    becoming 0. IDPH dropped suicide, chronic liver disease and "all other
    causes" from the county tables partway through the series, and writing
    those as 0 made the dashboard show deaths falling to nothing.
    """
    all_counties = sorted(VALID_COUNTIES - {'ILLINOIS'})
    real_counties = [c for c in all_counties if c not in COOK_SUBDIVISIONS]

    # county -> cause -> year -> rate
    rates: dict[str, dict[str, dict[str, float]]] = {c: {} for c in ALL_CAUSES}
    # cause -> year -> statewide deaths as IDPH published them
    state_counts: dict[str, dict[str, float]] = {c: {} for c in ALL_CAUSES}

    for year, df in all_dfs.items():
        yr = str(year)
        for _, row in df.iterrows():
            county = row['County']
            if county == 'ILLINOIS':
                for cause in ALL_CAUSES:
                    if cause in row.index and pd.notna(row[cause]):
                        state_counts[cause][yr] = float(row[cause])
                continue
            if county not in pop.index:
                print(f'  WARNING: no population for {county}, skipping')
                continue
            denom = pop.at[county, year]
            if not denom or denom <= 0:
                continue
            for cause in ALL_CAUSES:
                if cause not in row.index or pd.isna(row[cause]):
                    continue
                rates[cause].setdefault(county, {})[yr] = round(
                    float(row[cause]) / denom * 100_000, 2
                )

    year_cols = [str(y) for y in YEARS]
    pivots: dict[str, pd.DataFrame] = {}

    for cause in ALL_CAUSES:
        rows = [
            {'County': c, **{yr: rates[cause].get(c, {}).get(yr) for yr in year_cols}}
            for c in all_counties
        ]

        # Statewide rate uses IDPH's own published ILLINOIS count over the state
        # population. That is the most defensible figure to show IDPH, since it
        # is their number. _cross_check_state below compares it against summing
        # the 102 counties and warns if the two disagree.
        state_row = {'County': 'ILLINOIS'}
        for yr in year_cols:
            count = state_counts[cause].get(yr)
            denom = pop.at['ILLINOIS', int(yr)]
            state_row[yr] = round(count / denom * 100_000, 2) if count is not None and denom else None

        pivots[cause] = pd.concat([pd.DataFrame([state_row]), pd.DataFrame(rows)], ignore_index=True)

    _cross_check_state(all_dfs, pop, state_counts, real_counties)
    return pivots


def _cross_check_state(all_dfs, pop, state_counts, real_counties) -> None:
    """Compare IDPH's published statewide total against the sum of the counties."""
    print('\n-- Statewide cross-check (Total_Deaths) --')
    for year in YEARS:
        df = all_dfs[year].set_index('County')
        summed = df.loc[df.index.isin(real_counties), 'Total_Deaths'].sum()
        published = state_counts['Total_Deaths'].get(str(year))
        if not published:
            continue
        drift = (summed - published) / published * 100
        flag = '  <-- CHECK' if abs(drift) > 2 else ''
        print(f'  {year}: published {published:>10,.0f} | county sum {summed:>10,.0f} | {drift:+.2f}%{flag}')


def write_rate_tables(pivots: dict[str, pd.DataFrame]) -> None:
    os.makedirs(TABLES_DIR, exist_ok=True)
    for cause, df in pivots.items():
        out = os.path.join(TABLES_DIR, f'{cause}_death_rates_by_county_year.csv')
        df.to_csv(out, index=False)
        year_cols = [c for c in df.columns if c != 'County']
        filled = int(df[year_cols].notna().sum().sum())
        total = len(df) * len(year_cols)
        print(f'  {cause}: {filled}/{total} cells with data')


def audit(all_dfs: dict[int, pd.DataFrame], pivots: dict[str, pd.DataFrame]) -> None:
    expected = VALID_COUNTIES - {'ILLINOIS'}
    print('\n-- County audit --')
    for year in YEARS:
        present = set(all_dfs[year]['County']) - {'ILLINOIS'}
        missing = expected - present
        line = f'  {year}: {len(present)} counties'
        if missing:
            line += f' | MISSING: {sorted(missing)}'
        print(line)

    print('\n-- Plausibility check on all-cause rates --')
    total = pivots['Total_Deaths']
    year_cols = [c for c in total.columns if c != 'County']
    bad = []
    for _, row in total.iterrows():
        for yr in year_cols:
            v = row[yr]
            if pd.notna(v) and not (ALL_CAUSE_RATE_MIN <= v <= ALL_CAUSE_RATE_MAX):
                bad.append((row['County'], yr, v))
    if bad:
        for county, yr, v in bad[:20]:
            print(f'  OUT OF RANGE: {county} {yr} = {v:,.2f} per 100k')
        raise ValueError(
            f'{len(bad)} all-cause rates fall outside '
            f'{ALL_CAUSE_RATE_MIN}-{ALL_CAUSE_RATE_MAX} per 100k. '
            'That means a denominator is wrong; refusing to write bad tables.'
        )
    print(f'  All {len(total) * len(year_cols)} all-cause cells within '
          f'{ALL_CAUSE_RATE_MIN:.0f}-{ALL_CAUSE_RATE_MAX:.0f} per 100k.')


def main() -> None:
    print('STEP 1  Extract raw counts from PDFs')
    all_dfs = extract_all_years()

    print('\nSTEP 2  Load county populations')
    pop = load_population()

    print('\nSTEP 3  Compute crude death rates per 100,000')
    pivots = compute_rates(all_dfs, pop)

    print('\nSTEP 4  Audit')
    audit(all_dfs, pivots)

    print('\nSTEP 5  Write rate tables')
    write_rate_tables(pivots)

    print(f'\nDone. {len(pivots)} cause tables -> {os.path.normpath(TABLES_DIR)}')


if __name__ == '__main__':
    main()
