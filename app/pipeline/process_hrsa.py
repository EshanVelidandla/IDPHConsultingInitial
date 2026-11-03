"""
Process HRSA AHRF fixed-width data into Illinois county x year CSVs.

Input:  data/source/ahrf/ (ahrf*.asc + *.sas layout files)
Output: app/backend/static/provider_tables/ (5 CSVs + provenance + HPSA summary)

Three things this stage is careful about, because the earlier version was not:

  1. The ILLINOIS row is a population-weighted rate, not a plain mean of county
     rates. Averaging 102 county rates gave Illinois 105.7 MDs per 100k while
     Cook alone had 447, because Cook counts the same as Pope. It weights by
     AHRF population, the same denominator as the county rates.
  2. HPSA designation is a category (0 none, 1 whole county, 2 part of county),
     so it is never averaged or ranked. Its ILLINOIS row is left blank and a
     separate summary counts counties in each category.
  3. Some years are in no AHRF release and are filled in. Which years are
     real is written to metric_provenance.json so the
     dashboard can say so instead of implying annual measurement.

Run: python process_hrsa.py
"""

import csv
import json
import os
import re
import sys
from collections import defaultdict

from pipeline_paths import output_path

BASE    = os.path.dirname(os.path.abspath(__file__))
RAW     = os.path.join(BASE, "..", "..", "data", "source", "ahrf")
OUT_DIR = output_path("app", "backend", "static", "provider_tables")

YEARS   = list(range(2008, 2023))
IL_FIPS = "17"
EXPECTED_COUNTY_COUNT = 102

IL_COUNTIES = {
    "001":"Adams","003":"Alexander","005":"Bond","007":"Boone","009":"Brown",
    "011":"Bureau","013":"Calhoun","015":"Carroll","017":"Cass","019":"Champaign",
    "021":"Christian","023":"Clark","025":"Clay","027":"Clinton","029":"Coles",
    "031":"Cook","033":"Crawford","035":"Cumberland","037":"DeKalb","039":"DeWitt",
    "041":"Douglas","043":"DuPage","045":"Edgar","047":"Edwards","049":"Effingham",
    "051":"Fayette","053":"Ford","055":"Franklin","057":"Fulton","059":"Gallatin",
    "061":"Greene","063":"Grundy","065":"Hamilton","067":"Hancock","069":"Hardin",
    "071":"Henderson","073":"Henry","075":"Iroquois","077":"Jackson","079":"Jasper",
    "081":"Jefferson","083":"Jersey","085":"Jo Daviess","087":"Johnson","089":"Kane",
    "091":"Kankakee","093":"Kendall","095":"Knox","097":"Lake","099":"LaSalle",
    "101":"Lawrence","103":"Lee","105":"Livingston","107":"Logan","109":"McDonough",
    "111":"McHenry","113":"McLean","115":"Macon","117":"Macoupin","119":"Madison",
    "121":"Marion","123":"Marshall","125":"Mason","127":"Massac","129":"Menard",
    "131":"Mercer","133":"Monroe","135":"Montgomery","137":"Morgan","139":"Moultrie",
    "141":"Ogle","143":"Peoria","145":"Perry","147":"Piatt","149":"Pike","151":"Pope",
    "153":"Pulaski","155":"Putnam","157":"Randolph","159":"Richland","161":"Rock Island",
    "163":"St. Clair","165":"Saline","167":"Sangamon","169":"Schuyler","171":"Scott",
    "173":"Shelby","175":"Stark","177":"Stephenson","179":"Tazewell","181":"Union",
    "183":"Vermilion","185":"Wabash","187":"Warren","189":"Washington","191":"Wayne",
    "193":"White","195":"Whiteside","197":"Will","199":"Williamson",
    "201":"Winnebago","203":"Woodford",
}

# ── Variable name maps (verified against SAS layouts) ─────────────────────────

MD_VARS = {
    2008: ("old", "f0885708"), 2010: ("new", "f0885710"), 2011: ("new", "f0885711"),
    2012: ("new", "f0885712"), 2013: ("new", "f0885713"), 2014: ("new", "f0885714"),
    2015: ("new", "f0885715"), 2016: ("new", "f0885716"), 2017: ("new", "f0885717"),
    2018: ("new", "f0885718"), 2019: ("new", "f0885719"), 2020: ("new", "f0885720"),
}

PC_VARS = {
    2010: ("new", "f1467510"), 2011: ("new", "f1467511"), 2012: ("new", "f1467512"),
    2013: ("new", "f1467513"), 2014: ("new", "f1467514"), 2015: ("new", "f1467515"),
    2016: ("new", "f1467516"), 2017: ("new", "f1467517"), 2018: ("new", "f1467518"),
    2019: ("new", "f1467519"), 2020: ("new", "f1467520"),
}

# Beds and psychiatry drop out of each release after a few years, so most years
# come from an older file. The newest release carries only 2010, 2015 and 2020.
# No layout in the repo defines beds 2018 or psychiatry 2009 and 2018, so those
# stay interpolated, and 2021 and 2022 are carried forward.
BEDS_VARS = {
    2008: ("y2012", "f0892108"), 2009: ("y2012", "f0892109"), 2010: ("new", "f0892110"),
    2011: ("y2014", "f0892111"), 2012: ("y2015", "f0892112"), 2013: ("y2016", "f0892113"),
    2014: ("y2017", "f0892114"), 2015: ("new", "f0892115"), 2016: ("y2018", "f0892116"),
    2017: ("y2019", "f0892117"), 2019: ("y2021", "f0892119"), 2020: ("new", "f0892120"),
}

POP_VARS = {
    2008: ("new", "f1198408"), 2009: ("new", "f1198409"), 2010: ("new", "f0453010"),
    2011: ("new", "f1198411"), 2012: ("new", "f1198412"), 2013: ("new", "f1198413"),
    2014: ("new", "f1198414"), 2015: ("new", "f1198415"), 2016: ("new", "f1198416"),
    2017: ("new", "f1198417"), 2018: ("new", "f1198418"), 2019: ("new", "f1198419"),
    2020: ("new", "f1198420"), 2021: ("new", "f1198421"),
}

# 2011 and 2012 come from the 2012-2013 AHRF release. 2013 comes from y2014: the
# layout that defines f0978713 sits in 13-14/ and its data file in 14-15/, since
# the directories are offset by a year from there on. No release carries
# f0978714, so 2014 stays carried forward from 2013 and is reported as such in
# metric_provenance.json.
HPSA_VARS = {
    2008: ("old", "f0978708"), 2009: ("old", "f0978709"), 2010: ("new", "f0978710"),
    2011: ("y2012", "f0978711"), 2012: ("y2012", "f0978712"), 2013: ("y2014", "f0978713"),
    2015: ("new", "f0978715"), 2016: ("new", "f0978716"), 2017: ("new", "f0978717"),
    2018: ("new", "f0978718"), 2019: ("new", "f0978719"), 2020: ("new", "f0978720"),
    2021: ("new", "f0978721"), 2022: ("new", "f0978722"),
}

PSYCH_VARS = {
    2008: ("old", "f0477308"), 2010: ("new", "f0477310"), 2011: ("y2012", "f0477311"),
    2012: ("y2014", "f0477312"), 2013: ("y2015", "f0477313"), 2014: ("y2016", "f0477314"),
    2015: ("new", "f0477315"), 2016: ("y2018", "f0477316"), 2017: ("y2019", "f0477317"),
    2019: ("y2021", "f0477319"), 2020: ("new", "f0477320"),
}

# ── SAS layout parser ──────────────────────────────────────────────────────────

def parse_sas(path: str) -> dict:
    with open(path, encoding="latin-1") as f:
        sas = f.read()
    pattern = r'@(\d+)\s+(\w+)\s+\$?\s*(\d+)[.]\s+/[*](.+?)[*]/'
    return {var: (int(pos) - 1, int(w)) for pos, var, w, _ in re.findall(pattern, sas)}


LFS_POINTER_PREFIX = b"version https://git-lfs.github.com/spec/"
LFS_FIX = "Install Git LFS and fetch the data: git lfs install && git lfs pull"


def asc_problem(asc_path: str) -> str | None:
    """Why an AHRF data file cannot be read, or None if it looks real."""
    if not os.path.exists(asc_path):
        return f"{asc_path} is missing."
    with open(asc_path, "rb") as f:
        if f.read(len(LFS_POINTER_PREFIX)) == LFS_POINTER_PREFIX:
            return f"{asc_path} is a Git LFS pointer, not the data file."
    return None


def require_real_asc(asc_path: str) -> None:
    # A pointer file parses as zero records, which would otherwise surface as a
    # county count failure that says nothing about the cause.
    problem = asc_problem(asc_path)
    if problem:
        sys.exit(f"{problem}\n{LFS_FIX}")


def read_il_records(asc_path: str, layout: dict, needed_vars: set) -> list[dict]:
    st_pos,  st_w  = layout["f00011"]
    cty_pos, cty_w = layout["f00012"]
    records = []
    with open(asc_path, encoding="latin-1") as f:
        for line in f:
            line = line.rstrip("\n")
            if line[st_pos: st_pos + st_w].strip() != IL_FIPS:
                continue
            cnty = line[cty_pos: cty_pos + cty_w].strip()
            if cnty not in IL_COUNTIES:
                continue
            row = {"county": IL_COUNTIES[cnty]}
            for var in needed_vars:
                if var not in layout:
                    row[var] = None
                    continue
                p, w = layout[var]
                raw = line[p: p + w].strip()
                try:
                    row[var] = float(raw) if raw else None
                except ValueError:
                    row[var] = None
            records.append(row)
    return records

# ── Gap-fill helpers ───────────────────────────────────────────────────────────

def interpolate(table: dict, anchor_years: list, all_years: list) -> None:
    for county in list(table):
        known = {y: table[county].get(y) for y in anchor_years if table[county].get(y) is not None}
        sorted_known = sorted(known.items())
        for y in all_years:
            if y in known:
                continue
            prev = [(ky, kv) for ky, kv in sorted_known if ky <= y]
            nxt  = [(ky, kv) for ky, kv in sorted_known if ky >= y]
            if prev and nxt:
                p_y, p_v = prev[-1]; n_y, n_v = nxt[0]
                table[county][y] = p_v if p_y == n_y else round(p_v + (y - p_y) / (n_y - p_y) * (n_v - p_v), 2)
            elif prev:
                table[county][y] = prev[-1][1]
            elif nxt:
                table[county][y] = nxt[0][1]
            else:
                table[county][y] = None


def forward_fill(table: dict, anchor_years: list, all_years: list) -> None:
    for county in list(table):
        last = None
        for y in all_years:
            if table[county].get(y) is not None:
                last = table[county][y]
            elif last is not None:
                table[county][y] = last


def write_csv(table: dict, years: list, path: str, pop: dict, categorical: bool = False) -> None:
    """
    Write a county x year table with a statewide row on top.

    The statewide row is the population-weighted rate: total providers across
    the state divided by total population. The previous plain mean of county
    rates let Pope County (4,000 people) pull as hard as Cook (5.2 million).

    pop must be the population the county rates were divided by (AHRF), so that
    rate x population recovers the provider count, within rounding of the rate.

    A categorical metric has no meaningful average, so its statewide cell is
    left blank and summarised separately.
    """
    state_vals: list = []
    for y in years:
        if categorical:
            state_vals.append("")
            continue
        num = den = 0.0
        for county, by_year in table.items():
            rate = by_year.get(y)
            people = pop.get(county, {}).get(y)
            if rate is None or not people:
                continue
            num += rate / 100_000 * people   # back out the provider count
            den += people
        state_vals.append(round(num / den * 100_000, 2) if den else "")

    with open(path, "w", newline="") as f:
        w = csv.writer(f, lineterminator="\n")
        w.writerow(["County"] + [str(y) for y in years])
        w.writerow(["ILLINOIS"] + state_vals)
        for county in sorted(table):
            w.writerow([county] + [("" if (v := table[county].get(y)) is None else v) for y in years])


def validate_metric(name: str, table: dict, path: str, source_years: list,
                    is_rate: bool = True) -> None:
    """
    Check shape and range, and report honestly how much of the table is real.

    The old version counted every non-null cell as "observed", which it ran
    after gap-filling, so a metric with three real survey years reported 1,530
    observations out of 1,530.
    """
    county_count = len(table)
    if county_count != EXPECTED_COUNTY_COUNT:
        sys.exit(f"VALIDATION FAILED [{name}]: expected {EXPECTED_COUNTY_COUNT} counties, got {county_count}")

    with open(path) as f:
        rows = list(csv.reader(f))
    if len(rows) - 1 < EXPECTED_COUNTY_COUNT:
        sys.exit(f"VALIDATION FAILED [{name}]: CSV has {len(rows) - 1} rows, expected {EXPECTED_COUNTY_COUNT}+")

    if is_rate:
        for county, year_vals in table.items():
            for y, v in year_vals.items():
                if v is not None and not (0 <= v <= 10_000):
                    sys.exit(f"VALIDATION FAILED [{name}]: {county} {y} = {v} is outside expected range [0, 10000]")

    measured = sum(
        1 for y_vals in table.values() for y, v in y_vals.items()
        if v is not None and y in source_years
    )
    filled = sum(
        1 for y_vals in table.values() for y, v in y_vals.items()
        if v is not None and y not in source_years
    )
    print(f"  {name}: {county_count} counties | {measured} measured "
          f"({len(source_years)} source years) | {filled} filled in")

def check_county_count(src: str, asc_path: str, count: int) -> None:
    if count == EXPECTED_COUNTY_COUNT:
        return
    message = (f"VALIDATION FAILED: expected {EXPECTED_COUNTY_COUNT} IL counties "
               f"from the {src} release, got {count}")
    with open(asc_path, "rb") as f:
        if f.read(len(LFS_POINTER_PREFIX)) == LFS_POINTER_PREFIX:
            message += (f"\n{asc_path} is a Git LFS pointer, not the data. "
                        "Install git-lfs and run: git lfs pull")
    sys.exit(message)

# ── Main ───────────────────────────────────────────────────────────────────────

def main() -> None:
    # Each AHRF release carries a decade or so of history, so most variables come
    # from the newest file. Older releases are needed for what the 2022 release
    # dropped: 2008-2009 counts, HPSA designation for 2011-2013, and most years of
    # beds and psychiatry. From 13-14 onward a layout's directory is one year
    # behind its data file's, so each pair below is read as listed.
    releases = {
        "new":   (os.path.join(RAW, "21-22", "DOC", "AHRF2021-2022.sas"),
                  os.path.join(RAW, "21-22", "DATA", "ahrf2022.asc")),
        "old":   (os.path.join(RAW, "09-10", "Technical Documentation", "arf2009.sas"),
                  os.path.join(RAW, "09-10", "ahrf2009.asc")),
        "y2012": (os.path.join(RAW, "12-13", "Technical Documentation", "AHRF2012.sas"),
                  os.path.join(RAW, "12-13", "ahrf2012.asc")),
        "y2014": (os.path.join(RAW, "13-14", "Technical Documentation", "AHRF2014.sas"),
                  os.path.join(RAW, "14-15", "ahrf2014.asc")),
        "y2015": (os.path.join(RAW, "14-15", "Technical Documentation", "AHRF2015.sas"),
                  os.path.join(RAW, "15-16", "ahrf2015.asc")),
        "y2016": (os.path.join(RAW, "15-16", "Technical Documentation", "ahrf2015-16.sas"),
                  os.path.join(RAW, "16-17", "ahrf2016.asc")),
        "y2017": (os.path.join(RAW, "16-17", "Technical Documentation", "ahrf2016-17.sas"),
                  os.path.join(RAW, "17-18", "ahrf2017.asc")),
        "y2018": (os.path.join(RAW, "17-18", "Technical Documentation", "AHRF2017-18.sas"),
                  os.path.join(RAW, "18-19", "ahrf2018.asc")),
        "y2019": (os.path.join(RAW, "18-19", "Technical Documentation", "AHRF2018-19.sas"),
                  os.path.join(RAW, "19-20", "ahrf2019.asc")),
        "y2021": (os.path.join(RAW, "20-21", "AHRF_2020-2021", "DOC", "AHRF2020-2021.sas"),
                  os.path.join(RAW, "20-21", "AHRF_2020-2021", "DATA", "ahrf2021.asc")),
    }

    all_var_maps = [MD_VARS, PC_VARS, BEDS_VARS, POP_VARS, HPSA_VARS, PSYCH_VARS]
    needed: dict[str, set] = {k: set() for k in releases}
    for var_map in all_var_maps:
        for src, var in var_map.values():
            needed[src].add(var)

    index: dict[str, dict] = {}
    for src, (sas_path, asc_path) in releases.items():
        if not needed[src]:
            continue
        require_real_asc(asc_path)
        print(f"Reading {src} AHRF release ...")
        layout = parse_sas(sas_path)
        recs = read_il_records(asc_path, layout, needed[src])
        check_county_count(src, asc_path, len(recs))
        index[src] = {r["county"]: r for r in recs}
        print(f"  {len(recs)} IL counties loaded")

    def get_val(county, src, var):
        rec = index.get(src, {}).get(county)
        return rec.get(var) if rec else None

    counties = sorted(IL_COUNTIES.values())
    # Statewide rows weight by the same AHRF population as the county rates.
    # POP_VARS stops at 2021, so 2022 uses 2021, the nearest year.
    pop = {
        county: {
            year: get_val(county, *POP_VARS.get(year, POP_VARS[2021]))
            for year in YEARS
        }
        for county in counties
    }
    provenance: dict[str, dict] = {}

    os.makedirs(OUT_DIR, exist_ok=True)
    print("\nBuilding metrics ...")

    # ── Rate metrics ──────────────────────────────────────────────────────────
    # Each is: provider count / population x 100,000 for the years AHRF actually
    # publishes, then interpolated across the gaps. Which years are real is
    # recorded so the dashboard can label the rest as filled in.
    RATE_METRICS = [
        ("total_active_mds_per_100k",        MD_VARS,    "Total active MDs"),
        ("primary_care_physicians_per_100k", PC_VARS,    "Primary care physicians"),
        ("hospital_beds_per_100k",           BEDS_VARS,  "Hospital beds"),
        ("psychiatry_mds_per_100k",          PSYCH_VARS, "Psychiatry MDs"),
    ]

    for name, var_map, label in RATE_METRICS:
        table = defaultdict(dict)
        for county in counties:
            for year, (src, var) in var_map.items():
                count = get_val(county, src, var)
                pop_src, pop_var = POP_VARS.get(year, (None, None))
                people = get_val(county, pop_src, pop_var) if pop_src else None
                table[county][year] = (
                    round(count / people * 100_000, 2)
                    if (count is not None and people and people > 0) else None
                )
        source_years = sorted(var_map)
        interpolate(table, source_years, YEARS)
        path = os.path.join(OUT_DIR, f"{name}_by_county_year.csv")
        write_csv(table, YEARS, path, pop)
        validate_metric(name, table, path, source_years)
        provenance[name] = {
            "label": label,
            "kind": "rate",
            "source_years": source_years,
            "imputed_years": [y for y in YEARS if y not in source_years],
            "method": "linear interpolation between source years; "
                      "ends carried forward from the nearest source year",
        }

    # ── HPSA primary care designation (categorical) ───────────────────────────
    # 0 = not designated, 1 = whole county, 2 = part of the county. These are
    # category labels, not a scale: "part of county" is not worse than "whole
    # county". They are never averaged, ranked or correlated.
    hpsa_table = defaultdict(dict)
    for county in counties:
        for year, (src, var) in HPSA_VARS.items():
            hpsa_table[county][year] = get_val(county, src, var)
    hpsa_source_years = sorted(HPSA_VARS)
    forward_fill(hpsa_table, hpsa_source_years, YEARS)
    hpsa_path = os.path.join(OUT_DIR, "hpsa_primary_care_designation_by_county_year.csv")
    write_csv(hpsa_table, YEARS, hpsa_path, pop, categorical=True)
    validate_metric("hpsa_primary_care_designation", hpsa_table, hpsa_path,
                    hpsa_source_years, is_rate=False)
    provenance["hpsa_primary_care_designation"] = {
        "label": "HPSA primary care designation",
        "kind": "categorical",
        "categories": {"0": "Not designated", "1": "Whole county", "2": "Part of county"},
        "source_years": hpsa_source_years,
        "imputed_years": [y for y in YEARS if y not in hpsa_source_years],
        "method": "carried forward from the most recent source year",
    }

    # Statewide HPSA picture: how many counties sit in each category. This
    # replaces the old mean of the codes, which produced figures like 1.44 and
    # was then displayed as though it were a percentage.
    summary_path = os.path.join(OUT_DIR, "hpsa_primary_care_summary_by_year.csv")
    with open(summary_path, "w", newline="") as f:
        w = csv.writer(f, lineterminator="\n")
        w.writerow(["Year", "not_designated", "whole_county", "part_of_county",
                    "counties_designated", "pct_counties_designated"])
        for year in YEARS:
            codes = [hpsa_table[c].get(year) for c in counties]
            none_ = sum(1 for v in codes if v == 0)
            whole = sum(1 for v in codes if v == 1)
            part = sum(1 for v in codes if v == 2)
            designated = whole + part
            known = none_ + designated
            w.writerow([year, none_, whole, part, designated,
                        round(designated / known * 100, 1) if known else ""])
    print(f"  hpsa_primary_care_summary: {len(YEARS)} years")

    with open(os.path.join(OUT_DIR, "metric_provenance.json"), "w") as f:
        json.dump(provenance, f, indent=2)
    print(f"  metric_provenance.json: {len(provenance)} metrics")

    print(f"\nProvider tables -> {os.path.normpath(OUT_DIR)}")


if __name__ == "__main__":
    main()
