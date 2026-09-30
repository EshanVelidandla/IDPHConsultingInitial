"""
Build the county-by-year population denominators used by the deaths pipeline.

Input:  data/source/census/*.csv  (US Census Population Estimates, committed)
Output: data/reference/population_by_county_year.csv

Why this exists
---------------
The deaths pipeline used to back-derive populations from the rate table it was
about to overwrite, so denominators depended on run history and Suburban Cook
ended up with the mean county population (152,386 instead of ~2.5M). This
script replaces that with a real, committed, offline source.

Sources (Census Population Estimates Program, downloaded once and committed):
  2008-2009  co-est00int-tot.csv      2000-2010 intercensal county estimates
  2010-2019  co-est2019-alldata.csv   Vintage 2019 county estimates
  2020-2022  co-est2023-alldata.csv   Vintage 2023 county estimates
  Chicago    sub-est00int.csv / sub-est2019_17.csv / sub-est2023_17.csv
             (subcounty "place" estimates, SUMLEV 162 = incorporated place)

The vintage changes at 2010 and again at 2020 because Census rebases its
estimates after each decennial count. That is standard practice for a
2008-2022 series and is why the 2020 values step up slightly.

Run: python build_population.py
"""

import csv
import os
import sys

BASE = os.path.dirname(os.path.abspath(__file__))
CENSUS_DIR = os.path.join(BASE, "..", "..", "data", "source", "census")
OUT_FILE = os.path.join(BASE, "..", "..", "data", "reference", "population_by_county_year.csv")
# The backend serves only from app/backend/static/, so a deployment that ships
# app/ alone still has the denominators. data/reference/ stays the canonical
# copy for the pipeline and for anyone reading the repo.
SERVED_COPY = os.path.join(BASE, "..", "backend", "static", "population_by_county_year.csv")

YEARS = list(range(2008, 2023))

# FIPS county code -> the county name used everywhere else in this project.
# Kept in sync with process_hrsa.IL_COUNTIES; imported rather than duplicated.
sys.path.insert(0, BASE)
from process_hrsa import IL_COUNTIES  # noqa: E402

IL_STATE_FIPS = "17"
PLACE_SUMLEV = "162"  # incorporated place, the level Chicago city is reported at


def _read(name: str) -> list[dict]:
    path = os.path.join(CENSUS_DIR, name)
    if not os.path.exists(path):
        sys.exit(
            f"Missing Census source file: {path}\n"
            "See the module docstring for the download URLs."
        )
    with open(path, encoding="latin-1", newline="") as f:
        return list(csv.DictReader(f))


def _county_name(row: dict) -> str | None:
    """Census county codes are sometimes unpadded ('1' not '001')."""
    return IL_COUNTIES.get(str(row["COUNTY"]).zfill(3))


def load_counties() -> dict[str, dict[int, int]]:
    pop: dict[str, dict[int, int]] = {}

    def absorb(rows: list[dict], years: range | tuple) -> None:
        for row in rows:
            if str(row["STATE"]).zfill(2) != IL_STATE_FIPS:
                continue
            if str(row["COUNTY"]).zfill(3) == "000":
                continue  # state total row
            name = _county_name(row)
            if not name:
                continue
            for year in years:
                pop.setdefault(name, {})[year] = int(row[f"POPESTIMATE{year}"])

    absorb(_read("co-est00int-tot.csv"), (2008, 2009))
    absorb(_read("co-est2019-alldata.csv"), range(2010, 2020))
    absorb(_read("co-est2023-alldata.csv"), range(2020, 2023))
    return pop


def load_chicago() -> dict[int, int]:
    chicago: dict[int, int] = {}

    def absorb(rows: list[dict], years: range | tuple, state_filter: bool) -> None:
        for row in rows:
            if state_filter and row.get("STNAME") != "Illinois":
                continue
            if row.get("SUMLEV") != PLACE_SUMLEV:
                continue
            if not row.get("NAME", "").startswith("Chicago city"):
                continue
            for year in years:
                chicago[year] = int(row[f"POPESTIMATE{year}"])

    absorb(_read("sub-est00int.csv"), (2008, 2009), state_filter=True)
    absorb(_read("sub-est2019_17.csv"), range(2010, 2020), state_filter=False)
    absorb(_read("sub-est2023_17.csv"), range(2020, 2023), state_filter=False)
    return chicago


def validate(pop: dict[str, dict[int, int]]) -> None:
    missing = [(c, y) for c in pop for y in YEARS if y not in pop[c]]
    if missing:
        sys.exit(f"VALIDATION FAILED: {len(missing)} missing county-years, e.g. {missing[:5]}")

    if len(pop) != 105:  # 102 counties + Chicago + Suburban Cook + ILLINOIS
        sys.exit(f"VALIDATION FAILED: expected 105 rows, got {len(pop)}")

    for year in YEARS:
        # Suburban Cook is Cook minus Chicago, so it must stay positive and
        # plausible. A negative or tiny value means the two series drifted apart.
        suburban = pop["Suburban Cook"][year]
        if not 1_500_000 < suburban < 3_500_000:
            sys.exit(
                f"VALIDATION FAILED: Suburban Cook {year} = {suburban:,}, "
                "outside the plausible 1.5M-3.5M range. Check the Census vintages."
            )
        share = pop["Chicago"][year] / pop["Cook"][year]
        if not 0.45 < share < 0.60:
            sys.exit(
                f"VALIDATION FAILED: Chicago is {share:.1%} of Cook in {year}; "
                "expected roughly half."
            )


def main() -> None:
    counties = load_counties()
    chicago = load_chicago()

    if len(counties) != 102:
        sys.exit(f"Expected 102 Illinois counties from Census, got {len(counties)}")
    if sorted(chicago) != YEARS:
        sys.exit(f"Chicago series is incomplete: have {sorted(chicago)}")

    # Chicago and Suburban Cook are IDPH reporting units, not Census geographies.
    # IDPH reports Cook County as three rows: Cook (the whole county), Chicago
    # (the city) and Suburban Cook (everything else). Census publishes the county
    # and the city but not the remainder, so Suburban Cook is derived here as
    # Cook minus Chicago. Both components come from the same Census vintage in
    # every year, so the subtraction stays internally consistent.
    counties["Chicago"] = dict(chicago)
    counties["Suburban Cook"] = {y: counties["Cook"][y] - chicago[y] for y in YEARS}

    # Statewide denominator is the sum of the 102 real counties. Chicago and
    # Suburban Cook are excluded because they are already inside Cook.
    real_counties = [c for c in counties if c not in ("Chicago", "Suburban Cook")]
    counties["ILLINOIS"] = {y: sum(counties[c][y] for c in real_counties) for y in YEARS}

    validate(counties)

    os.makedirs(os.path.dirname(OUT_FILE), exist_ok=True)
    with open(OUT_FILE, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["County"] + [str(y) for y in YEARS])
        writer.writerow(["ILLINOIS"] + [counties["ILLINOIS"][y] for y in YEARS])
        for name in sorted(c for c in counties if c != "ILLINOIS"):
            writer.writerow([name] + [counties[name][y] for y in YEARS])

    os.makedirs(os.path.dirname(SERVED_COPY), exist_ok=True)
    with open(OUT_FILE) as src, open(SERVED_COPY, "w", newline="") as dst:
        dst.write(src.read())

    print(f"  {len(counties)} rows x {len(YEARS)} years -> {os.path.relpath(OUT_FILE, BASE)}")
    print(f"  served copy -> {os.path.relpath(SERVED_COPY, BASE)}")
    print(f"  Illinois 2008 {counties['ILLINOIS'][2008]:,}  2022 {counties['ILLINOIS'][2022]:,}")
    print(f"  Suburban Cook 2008 {counties['Suburban Cook'][2008]:,}  "
          f"2022 {counties['Suburban Cook'][2022]:,}")


if __name__ == "__main__":
    main()
