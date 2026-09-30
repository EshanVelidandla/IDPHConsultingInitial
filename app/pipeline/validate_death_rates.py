"""
Validate the generated death rate tables. Read-only.

This replaces the old clean_death_rates.py, which edited the tables in place
and recalculated the ILLINOIS row as an unweighted mean of county rates. That
override changed the statewide 2008 figure by about 25% and was the reason the
committed tables and a fresh pipeline run disagreed. Statewide rates are now
computed once, in deaths_pipeline.py, from IDPH's own published statewide
counts.

Input:  app/backend/static/death_rate_tables/*.csv  (never modified)
Run:    python validate_death_rates.py
"""

import os
import sys

import pandas as pd

BASE = os.path.dirname(os.path.abspath(__file__))
TABLES_DIR = os.path.join(BASE, "..", "backend", "static", "death_rate_tables")
POP_FILE = os.path.join(BASE, "..", "..", "data", "reference", "population_by_county_year.csv")

YEARS = [str(y) for y in range(2008, 2023)]
EXPECTED_ROWS = 105  # ILLINOIS + 102 counties + Chicago + Suburban Cook

ALL_CAUSE_RATE_MIN = 100.0
ALL_CAUSE_RATE_MAX = 3_000.0


def _fail(msg: str) -> None:
    sys.exit(f"VALIDATION FAILED: {msg}")


def main() -> None:
    if not os.path.isdir(TABLES_DIR):
        _fail(f"{TABLES_DIR} not found. Run deaths_pipeline.py first.")

    files = sorted(f for f in os.listdir(TABLES_DIR) if f.endswith("_death_rates_by_county_year.csv"))
    if not files:
        _fail(f"no rate tables in {TABLES_DIR}")

    expected_counties = set(pd.read_csv(POP_FILE)["County"])

    for fname in files:
        path = os.path.join(TABLES_DIR, fname)
        df = pd.read_csv(path)
        cause = fname.replace("_death_rates_by_county_year.csv", "")

        if list(df.columns) != ["County"] + YEARS:
            _fail(f"[{cause}] unexpected columns: {list(df.columns)}")
        if len(df) != EXPECTED_ROWS:
            _fail(f"[{cause}] has {len(df)} rows, expected {EXPECTED_ROWS}")
        if df.iloc[0]["County"] != "ILLINOIS":
            _fail(f"[{cause}] first row is {df.iloc[0]['County']!r}, expected ILLINOIS")

        dupes = df.loc[df["County"].duplicated(), "County"].tolist()
        if dupes:
            _fail(f"[{cause}] duplicate counties: {dupes}")

        unknown = set(df["County"]) - expected_counties
        if unknown:
            _fail(f"[{cause}] counties with no population row: {sorted(unknown)}")

        values = df[YEARS]
        if (values < 0).any().any():
            _fail(f"[{cause}] contains negative rates")

        # A genuine 0 is fine: small counties really do record no deaths from a
        # given cause in a given year. What is not fine is a whole column of
        # zeros, which is the signature of the old bug where a cause IDPH had
        # stopped publishing was written as 0 instead of left blank.
        all_zero = [y for y in YEARS if (values[y].fillna(-1) == 0).all()]
        if all_zero:
            _fail(
                f"[{cause}] years {all_zero} are zero for every county. "
                "A cause the report did not publish must be blank, not 0."
            )

        filled = int(values.notna().sum().sum())
        print(f"  {cause}: {len(df)} rows, {filled}/{values.size} cells with data")

    total = pd.read_csv(os.path.join(TABLES_DIR, "Total_Deaths_death_rates_by_county_year.csv"))
    band = total[YEARS]
    out_of_range = band[(band < ALL_CAUSE_RATE_MIN) | (band > ALL_CAUSE_RATE_MAX)].notna().sum().sum()
    if out_of_range:
        _fail(f"{out_of_range} all-cause rates outside {ALL_CAUSE_RATE_MIN}-{ALL_CAUSE_RATE_MAX} per 100k")

    print(f"\n  All {len(files)} tables passed validation.")


if __name__ == "__main__":
    main()
