"""
Process HRSA AHRF fixed-width data into Illinois county x year CSVs.

Input:  backend/static/hrsa_raw/ (ahrf*.asc + *.sas layout files)
Output: backend/static/provider_tables/ (5 CSV files)

Run: python process_hrsa.py
"""

import csv
import os
import re
import sys
from collections import defaultdict

BASE    = os.path.dirname(os.path.abspath(__file__))
RAW     = os.path.join(BASE, "..", "backend", "static", "hrsa_raw")
OUT_DIR = os.path.join(BASE, "..", "backend", "static", "provider_tables")
os.makedirs(OUT_DIR, exist_ok=True)

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

BEDS_VARS = {
    2010: ("new", "f0892110"), 2015: ("new", "f0892115"), 2020: ("new", "f0892120"),
}

POP_VARS = {
    2008: ("new", "f1198408"), 2009: ("new", "f1198409"), 2010: ("new", "f0453010"),
    2011: ("new", "f1198411"), 2012: ("new", "f1198412"), 2013: ("new", "f1198413"),
    2014: ("new", "f1198414"), 2015: ("new", "f1198415"), 2016: ("new", "f1198416"),
    2017: ("new", "f1198417"), 2018: ("new", "f1198418"), 2019: ("new", "f1198419"),
    2020: ("new", "f1198420"), 2021: ("new", "f1198421"),
}

HPSA_VARS = {
    2008: ("old", "f0978708"), 2009: ("old", "f0978709"), 2010: ("new", "f0978710"),
    2015: ("new", "f0978715"), 2016: ("new", "f0978716"), 2017: ("new", "f0978717"),
    2018: ("new", "f0978718"), 2019: ("new", "f0978719"), 2020: ("new", "f0978720"),
    2021: ("new", "f0978721"), 2022: ("new", "f0978722"),
}

PSYCH_VARS = {
    2010: ("new", "f0477310"), 2015: ("new", "f0477315"), 2020: ("new", "f0477320"),
}

# ── SAS layout parser ──────────────────────────────────────────────────────────

def parse_sas(path: str) -> dict:
    with open(path, encoding="latin-1") as f:
        sas = f.read()
    pattern = r'@(\d+)\s+(\w+)\s+\$?\s*(\d+)[.]\s+/[*](.+?)[*]/'
    return {var: (int(pos) - 1, int(w)) for pos, var, w, _ in re.findall(pattern, sas)}


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


def write_csv(table: dict, years: list, path: str) -> None:
    state_vals = []
    for y in years:
        vals = [v for cv in table.values() if (v := cv.get(y)) is not None]
        state_vals.append(round(sum(vals) / len(vals), 2) if vals else "")
    with open(path, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["County"] + [str(y) for y in years])
        w.writerow(["ILLINOIS"] + state_vals)
        for county in sorted(table):
            w.writerow([county] + [("" if (v := table[county].get(y)) is None else v) for y in years])


def validate_metric(name: str, table: dict, path: str, is_rate: bool = True) -> None:
    county_count = len(table)
    if county_count != EXPECTED_COUNTY_COUNT:
        sys.exit(f"VALIDATION FAILED [{name}]: expected {EXPECTED_COUNTY_COUNT} counties, got {county_count}")

    df_rows = []
    with open(path) as f:
        reader = csv.reader(f)
        rows = list(reader)
    row_count = len(rows) - 1  # subtract header
    if row_count < EXPECTED_COUNTY_COUNT:
        sys.exit(f"VALIDATION FAILED [{name}]: CSV has {row_count} rows, expected {EXPECTED_COUNTY_COUNT}+")

    if is_rate:
        for county, year_vals in table.items():
            for y, v in year_vals.items():
                if v is not None and not (0 <= v <= 10_000):
                    sys.exit(f"VALIDATION FAILED [{name}]: {county} {y} = {v} is outside expected range [0, 10000]")

    observed = sum(1 for y_vals in table.values() for v in y_vals.values() if v is not None)
    interpolated = sum(1 for y_vals in table.values() for v in y_vals.values() if v is None)
    print(f"  {name}: {county_count} counties, {observed} observed, {interpolated} gaps — OK")

# ── Main ───────────────────────────────────────────────────────────────────────

def main() -> None:
    layout_new = parse_sas(os.path.join(RAW, "21-22", "DOC", "AHRF2021-2022.sas"))
    layout_old = parse_sas(os.path.join(RAW, "09-10", "Technical Documentation", "arf2009.sas"))
    layouts = {"new": layout_new, "old": layout_old}

    asc_new = os.path.join(RAW, "21-22", "DATA", "ahrf2022.asc")
    asc_old = os.path.join(RAW, "09-10", "ahrf2009.asc")

    def needed(var_map):
        new_vars, old_vars = set(), set()
        for src, var in var_map.values():
            (new_vars if src == "new" else old_vars).add(var)
        return new_vars, old_vars

    all_var_maps = [MD_VARS, PC_VARS, BEDS_VARS, POP_VARS, HPSA_VARS, PSYCH_VARS]
    new_needed, old_needed = set(), set()
    for vm in all_var_maps:
        n, o = needed(vm)
        new_needed |= n
        old_needed |= o

    print("Reading 21-22 ASC ...")
    recs_new = read_il_records(asc_new, layout_new, new_needed)
    if len(recs_new) != EXPECTED_COUNTY_COUNT:
        sys.exit(f"VALIDATION FAILED: expected {EXPECTED_COUNTY_COUNT} IL counties from 21-22 file, got {len(recs_new)}")
    print(f"  {len(recs_new)} IL counties loaded")

    print("Reading 09-10 ASC ...")
    recs_old = read_il_records(asc_old, layout_old, old_needed)
    if len(recs_old) != EXPECTED_COUNTY_COUNT:
        sys.exit(f"VALIDATION FAILED: expected {EXPECTED_COUNTY_COUNT} IL counties from 09-10 file, got {len(recs_old)}")
    print(f"  {len(recs_old)} IL counties loaded")

    idx_new = {r["county"]: r for r in recs_new}
    idx_old = {r["county"]: r for r in recs_old}

    def get_val(county, src, var):
        idx = idx_new if src == "new" else idx_old
        rec = idx.get(county)
        return rec.get(var) if rec else None

    counties = sorted(IL_COUNTIES.values())

    print("\nBuilding metrics ...")

    # 1. Total Active MDs per 100k
    md_table = defaultdict(dict)
    for county in counties:
        for year, (src, var) in MD_VARS.items():
            md  = get_val(county, src, var)
            pop_src, pop_var = POP_VARS.get(year, (None, None))
            pop = get_val(county, pop_src, pop_var) if pop_src else None
            md_table[county][year] = round(md / pop * 100_000, 2) if (md is not None and pop and pop > 0) else None
    interpolate(md_table, list(MD_VARS.keys()), YEARS)
    path = os.path.join(OUT_DIR, "total_active_mds_per_100k_by_county_year.csv")
    write_csv(md_table, YEARS, path)
    validate_metric("total_active_mds_per_100k", md_table, path)

    # 2. Primary Care Physicians per 100k
    pc_table = defaultdict(dict)
    for county in counties:
        for year, (src, var) in PC_VARS.items():
            pc  = get_val(county, src, var)
            pop_src, pop_var = POP_VARS.get(year, (None, None))
            pop = get_val(county, pop_src, pop_var) if pop_src else None
            pc_table[county][year] = round(pc / pop * 100_000, 2) if (pc is not None and pop and pop > 0) else None
    interpolate(pc_table, list(PC_VARS.keys()), YEARS)
    path = os.path.join(OUT_DIR, "primary_care_physicians_per_100k_by_county_year.csv")
    write_csv(pc_table, YEARS, path)
    validate_metric("primary_care_physicians_per_100k", pc_table, path)

    # 3. Hospital Beds per 100k
    beds_table = defaultdict(dict)
    for county in counties:
        for year, (src, var) in BEDS_VARS.items():
            beds = get_val(county, src, var)
            pop_src, pop_var = POP_VARS.get(year, (None, None))
            pop  = get_val(county, pop_src, pop_var) if pop_src else None
            beds_table[county][year] = round(beds / pop * 100_000, 2) if (beds is not None and pop and pop > 0) else None
    interpolate(beds_table, list(BEDS_VARS.keys()), YEARS)
    path = os.path.join(OUT_DIR, "hospital_beds_per_100k_by_county_year.csv")
    write_csv(beds_table, YEARS, path)
    validate_metric("hospital_beds_per_100k", beds_table, path)

    # 4. HPSA Primary Care designation
    hpsa_table = defaultdict(dict)
    for county in counties:
        for year, (src, var) in HPSA_VARS.items():
            hpsa_table[county][year] = get_val(county, src, var)
    forward_fill(hpsa_table, list(HPSA_VARS.keys()), YEARS)
    path = os.path.join(OUT_DIR, "hpsa_primary_care_designation_by_county_year.csv")
    write_csv(hpsa_table, YEARS, path)
    validate_metric("hpsa_primary_care_designation", hpsa_table, path, is_rate=False)

    # 5. Psychiatry MDs per 100k
    psych_table = defaultdict(dict)
    for county in counties:
        for year, (src, var) in PSYCH_VARS.items():
            psych = get_val(county, src, var)
            pop_src, pop_var = POP_VARS.get(year, (None, None))
            pop   = get_val(county, pop_src, pop_var) if pop_src else None
            psych_table[county][year] = round(psych / pop * 100_000, 2) if (psych is not None and pop and pop > 0) else None
    interpolate(psych_table, list(PSYCH_VARS.keys()), YEARS)
    path = os.path.join(OUT_DIR, "psychiatry_mds_per_100k_by_county_year.csv")
    write_csv(psych_table, YEARS, path)
    validate_metric("psychiatry_mds_per_100k", psych_table, path)

    print(f"\n5 provider metric CSVs → {OUT_DIR}")


if __name__ == "__main__":
    main()
