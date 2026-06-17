"""
Clean and validate death rate CSVs in-place.

Fixes known county name typos, removes invalid entries, removes duplicates,
and recalculates the ILLINOIS summary row at the top of each file.

Input/Output: backend/static/death_rate_tables/*_death_rates_by_county_year.csv

Run: python clean_death_rates.py
"""

import os
import sys

import numpy as np
import pandas as pd

BASE = os.path.dirname(os.path.abspath(__file__))
TABLES_DIR = os.path.join(BASE, "..", "backend", "static", "death_rate_tables")

VALID_COUNTIES = {
    "Adams", "Alexander", "Bond", "Boone", "Brown", "Bureau", "Calhoun", "Carroll",
    "Cass", "Champaign", "Chicago", "Christian", "Clark", "Clay", "Clinton", "Coles",
    "Cook", "Crawford", "Cumberland", "DeKalb", "DeWitt", "Douglas", "DuPage", "Edgar",
    "Edwards", "Effingham", "Fayette", "Ford", "Franklin", "Fulton", "Gallatin", "Greene",
    "Grundy", "Hamilton", "Hancock", "Hardin", "Henderson", "Henry", "ILLINOIS", "Iroquois",
    "Jackson", "Jasper", "Jefferson", "Jersey", "Jo Daviess", "Johnson", "Kane", "Kankakee",
    "Kendall", "Knox", "Lake", "LaSalle", "Lawrence", "Lee", "Livingston", "Logan", "Macon",
    "Macoupin", "Madison", "Marion", "Marshall", "Mason", "Massac", "McDonough", "McHenry",
    "McLean", "Menard", "Mercer", "Monroe", "Montgomery", "Morgan", "Moultrie", "Ogle",
    "Peoria", "Perry", "Piatt", "Pike", "Pope", "Pulaski", "Putnam", "Randolph", "Richland",
    "Rock Island", "Saline", "Sangamon", "Schuyler", "Scott", "Shelby", "St. Clair", "Stark",
    "Stephenson", "Suburban Cook", "Tazewell", "Union", "Vermilion", "Wabash", "Warren",
    "Washington", "Wayne", "White", "Whiteside", "Will", "Williamson", "Winnebago", "Woodford",
}

TYPO_MAP = {
    "Alexande r": "Alexander",
    "Suburban Coo k": "Suburban Cook",
    "Grund y": "Grundy",
}


def clean_file(path: str) -> tuple[int, int]:
    """Returns (rows_before, rows_after) for reporting."""
    df = pd.read_csv(path)
    rows_before = len(df)

    df["County"] = df["County"].str.strip().replace(TYPO_MAP)
    df = df[df["County"].isin(VALID_COUNTIES)]
    df = df.drop_duplicates(subset=["County"], keep="first")

    year_cols = [c for c in df.columns if c != "County"]
    for col in year_cols:
        df[col] = pd.to_numeric(df[col], errors="coerce").fillna(0)

    # Recalculate ILLINOIS row as mean of all county rows (excluding Cook sub-rows)
    county_rows = df[~df["County"].isin(["ILLINOIS", "Chicago", "Suburban Cook"])]
    illinois_vals = {y: round(county_rows[y].mean(), 2) for y in year_cols}
    illinois_row = pd.DataFrame([{"County": "ILLINOIS", **illinois_vals}])

    df = df[df["County"] != "ILLINOIS"]
    df = pd.concat([illinois_row, df.sort_values("County")], ignore_index=True)
    df.to_csv(path, index=False)
    return rows_before, len(df)


def validate_all(tables_dir: str) -> None:
    csv_files = [f for f in os.listdir(tables_dir) if f.endswith("_death_rates_by_county_year.csv")]
    if not csv_files:
        sys.exit(f"VALIDATION FAILED: no CSV files found in {tables_dir}")

    for fname in sorted(csv_files):
        df = pd.read_csv(os.path.join(tables_dir, fname))
        unexpected = set(df["County"]) - VALID_COUNTIES
        if unexpected:
            sys.exit(f"VALIDATION FAILED [{fname}]: unexpected counties: {unexpected}")
        dupes = df[df.duplicated(subset=["County"])]
        if not dupes.empty:
            sys.exit(f"VALIDATION FAILED [{fname}]: duplicate counties: {dupes['County'].tolist()}")
    print(f"  All {len(csv_files)} files passed county validation.")


def main() -> None:
    if not os.path.isdir(TABLES_DIR):
        sys.exit(f"death_rate_tables/ not found at {TABLES_DIR}. Run process_death_rates.py first.")

    csv_files = sorted(f for f in os.listdir(TABLES_DIR) if f.endswith("_death_rates_by_county_year.csv"))
    if not csv_files:
        sys.exit(f"No CSV files found in {TABLES_DIR}.")

    total_removed = 0
    for fname in csv_files:
        before, after = clean_file(os.path.join(TABLES_DIR, fname))
        removed = before - after
        total_removed += removed
        status = f"(-{removed})" if removed else "(no changes)"
        print(f"  {fname}: {after} rows {status}")

    print(f"\nCleaned {len(csv_files)} files, removed {total_removed} invalid rows total.")
    print("Running post-clean validation...")
    validate_all(TABLES_DIR)


if __name__ == "__main__":
    main()
