"""
HRSA AHRF processing script.
Produces Illinois county x year CSVs for 5 provider metrics (2008-2022).
Output format matches death_rate_tables/ (County rows, year columns).

Run: python process_hrsa.py
"""

import re, os, csv
from collections import defaultdict

BASE     = os.path.dirname(os.path.abspath(__file__))
RAW      = os.path.join(BASE, "hrsa_raw")
OUT_DIR  = os.path.join(BASE, "provider_tables")
os.makedirs(OUT_DIR, exist_ok=True)

YEARS = list(range(2008, 2023))
IL_FIPS = "17"

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

# Total Active MDs Non-Federal (21-22 file: 2010-2020; 09-10 file: 2008)
MD_VARS = {
    2008: ("old", "f0885708"), 2010: ("new", "f0885710"), 2011: ("new", "f0885711"),
    2012: ("new", "f0885712"), 2013: ("new", "f0885713"), 2014: ("new", "f0885714"),
    2015: ("new", "f0885715"), 2016: ("new", "f0885716"), 2017: ("new", "f0885717"),
    2018: ("new", "f0885718"), 2019: ("new", "f0885719"), 2020: ("new", "f0885720"),
}

# Primary Care Phys Non-Fed Excl Hosp Res (21-22 file: 2010-2020 only)
PC_VARS = {
    2010: ("new", "f1467510"), 2011: ("new", "f1467511"), 2012: ("new", "f1467512"),
    2013: ("new", "f1467513"), 2014: ("new", "f1467514"), 2015: ("new", "f1467515"),
    2016: ("new", "f1467516"), 2017: ("new", "f1467517"), 2018: ("new", "f1467518"),
    2019: ("new", "f1467519"), 2020: ("new", "f1467520"),
}

# Total Hospital Beds (AHA survey: 2010, 2015, 2020 only — interpolated for others)
BEDS_VARS = {
    2010: ("new", "f0892110"), 2015: ("new", "f0892115"), 2020: ("new", "f0892120"),
}

# Population Estimate (21-22 file covers all; 2010 uses census f0453010)
POP_VARS = {
    2008: ("new", "f1198408"), 2009: ("new", "f1198409"), 2010: ("new", "f0453010"),
    2011: ("new", "f1198411"), 2012: ("new", "f1198412"), 2013: ("new", "f1198413"),
    2014: ("new", "f1198414"), 2015: ("new", "f1198415"), 2016: ("new", "f1198416"),
    2017: ("new", "f1198417"), 2018: ("new", "f1198418"), 2019: ("new", "f1198419"),
    2020: ("new", "f1198420"), 2021: ("new", "f1198421"),
}

# HPSA Primary Care Designation: 0=none, 1=whole-county, 2=partial
# (09-10 file: 2008-2009; 21-22 file: 2010, 2015-2022; 2011-2014 forward-filled from 2010)
HPSA_VARS = {
    2008: ("old", "f0978708"), 2009: ("old", "f0978709"), 2010: ("new", "f0978710"),
    2015: ("new", "f0978715"), 2016: ("new", "f0978716"), 2017: ("new", "f0978717"),
    2018: ("new", "f0978718"), 2019: ("new", "f0978719"), 2020: ("new", "f0978720"),
    2021: ("new", "f0978721"), 2022: ("new", "f0978722"),
}

# Psychiatry MDs Total Non-Fed (AHA survey: 2010, 2015, 2020 — interpolated)
PSYCH_VARS = {
    2010: ("new", "f0477310"), 2015: ("new", "f0477315"), 2020: ("new", "f0477320"),
}

# ── SAS layout parser ─────────────────────────────────────────────────────────

def parse_sas(path):
    with open(path, encoding="latin-1") as f:
        sas = f.read()
    pattern = r'@(\d+)\s+(\w+)\s+\$?\s*(\d+)[.]\s+/[*](.+?)[*]/'
    return {var: (int(pos) - 1, int(w)) for pos, var, w, _ in re.findall(pattern, sas)}

# ── Fixed-width ASC reader ────────────────────────────────────────────────────

def read_il_records(asc_path, layout, needed_vars):
    """Return list of dicts for Illinois counties, extracting needed_vars."""
    st_pos, st_w   = layout["f00011"]
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

# ── Helpers ───────────────────────────────────────────────────────────────────

def interpolate(table, anchor_years, all_years):
    """Linear interpolation/extrapolation between anchor_years for each county."""
    for county in list(table.keys()):
        known = {y: table[county].get(y) for y in anchor_years if table[county].get(y) is not None}
        sorted_known = sorted(known.items())
        for y in all_years:
            if y in known:
                continue
            prev = [(ky, kv) for ky, kv in sorted_known if ky <= y]
            nxt  = [(ky, kv) for ky, kv in sorted_known if ky >= y]
            if prev and nxt:
                p_y, p_v = prev[-1]
                n_y, n_v = nxt[0]
                if p_y == n_y:
                    table[county][y] = p_v
                else:
                    frac = (y - p_y) / (n_y - p_y)
                    table[county][y] = round(p_v + frac * (n_v - p_v), 2)
            elif prev:
                table[county][y] = prev[-1][1]
            elif nxt:
                table[county][y] = nxt[0][1]
            else:
                table[county][y] = None


def forward_fill(table, anchor_years, all_years):
    """Carry last known value forward (for categorical data like HPSA)."""
    for county in list(table.keys()):
        last = None
        for y in all_years:
            if table[county].get(y) is not None:
                last = table[county][y]
            elif last is not None:
                table[county][y] = last


def write_csv(table, years, path):
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
    print(f"  -> {os.path.basename(path)}")

# ── Main ──────────────────────────────────────────────────────────────────────

def main():
    print("Parsing SAS layouts...")
    layout_new = parse_sas(os.path.join(RAW, "21-22", "DOC", "AHRF2021-2022.sas"))
    layout_old = parse_sas(os.path.join(RAW, "09-10", "Technical Documentation", "arf2009.sas"))
    layouts = {"new": layout_new, "old": layout_old}

    asc_new = os.path.join(RAW, "21-22", "DATA", "ahrf2022.asc")
    asc_old = os.path.join(RAW, "09-10", "ahrf2009.asc")

    # Collect all vars needed from each file
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

    print("Reading 21-22 ASC (Illinois counties)...")
    recs_new = read_il_records(asc_new, layout_new, new_needed)
    idx_new  = {r["county"]: r for r in recs_new}
    print(f"  {len(recs_new)} IL counties loaded")

    print("Reading 09-10 ASC (Illinois counties)...")
    recs_old = read_il_records(asc_old, layout_old, old_needed)
    idx_old  = {r["county"]: r for r in recs_old}
    print(f"  {len(recs_old)} IL counties loaded")

    def get_val(county, src, var):
        idx = idx_new if src == "new" else idx_old
        rec = idx.get(county)
        return rec.get(var) if rec else None

    counties = sorted(IL_COUNTIES.values())

    # ── 1. Total Active MDs per 100k ─────────────────────────────────────────
    print("\nBuilding: total_active_mds_per_100k")
    md_table = defaultdict(dict)
    for county in counties:
        for year, (src, var) in MD_VARS.items():
            md  = get_val(county, src, var)
            pop_src, pop_var = POP_VARS.get(year, (None, None))
            pop = get_val(county, pop_src, pop_var) if pop_src else None
            if md is not None and pop and pop > 0:
                md_table[county][year] = round(md / pop * 100_000, 2)
            else:
                md_table[county][year] = None
        # Gap-fill: 2009 interpolated, 2021-2022 forward-filled from 2020
    interpolate(md_table, list(MD_VARS.keys()), YEARS)
    write_csv(md_table, YEARS,
              os.path.join(OUT_DIR, "total_active_mds_per_100k_by_county_year.csv"))

    # ── 2. Primary Care Physicians per 100k ──────────────────────────────────
    print("Building: primary_care_physicians_per_100k")
    pc_table = defaultdict(dict)
    for county in counties:
        for year, (src, var) in PC_VARS.items():
            pc  = get_val(county, src, var)
            pop_src, pop_var = POP_VARS.get(year, (None, None))
            pop = get_val(county, pop_src, pop_var) if pop_src else None
            if pc is not None and pop and pop > 0:
                pc_table[county][year] = round(pc / pop * 100_000, 2)
            else:
                pc_table[county][year] = None
    interpolate(pc_table, list(PC_VARS.keys()), YEARS)
    write_csv(pc_table, YEARS,
              os.path.join(OUT_DIR, "primary_care_physicians_per_100k_by_county_year.csv"))

    # ── 3. Hospital Beds per 100k (interpolated between survey years) ─────────
    print("Building: hospital_beds_per_100k")
    beds_table = defaultdict(dict)
    for county in counties:
        for year, (src, var) in BEDS_VARS.items():
            beds = get_val(county, src, var)
            pop_src, pop_var = POP_VARS.get(year, (None, None))
            pop  = get_val(county, pop_src, pop_var) if pop_src else None
            if beds is not None and pop and pop > 0:
                beds_table[county][year] = round(beds / pop * 100_000, 2)
            else:
                beds_table[county][year] = None
    interpolate(beds_table, list(BEDS_VARS.keys()), YEARS)
    write_csv(beds_table, YEARS,
              os.path.join(OUT_DIR, "hospital_beds_per_100k_by_county_year.csv"))

    # ── 4. HPSA Primary Care designation (forward-filled for gap years) ───────
    print("Building: hpsa_primary_care_designation")
    hpsa_table = defaultdict(dict)
    for county in counties:
        for year, (src, var) in HPSA_VARS.items():
            hpsa_table[county][year] = get_val(county, src, var)
    forward_fill(hpsa_table, list(HPSA_VARS.keys()), YEARS)
    write_csv(hpsa_table, YEARS,
              os.path.join(OUT_DIR, "hpsa_primary_care_designation_by_county_year.csv"))

    # ── 5. Psychiatry MDs per 100k (interpolated between survey years) ────────
    print("Building: psychiatry_mds_per_100k")
    psych_table = defaultdict(dict)
    for county in counties:
        for year, (src, var) in PSYCH_VARS.items():
            psych = get_val(county, src, var)
            pop_src, pop_var = POP_VARS.get(year, (None, None))
            pop   = get_val(county, pop_src, pop_var) if pop_src else None
            if psych is not None and pop and pop > 0:
                psych_table[county][year] = round(psych / pop * 100_000, 2)
            else:
                psych_table[county][year] = None
    interpolate(psych_table, list(PSYCH_VARS.keys()), YEARS)
    write_csv(psych_table, YEARS,
              os.path.join(OUT_DIR, "psychiatry_mds_per_100k_by_county_year.csv"))

    print(f"\nDone. 5 files written to {OUT_DIR}")


if __name__ == "__main__":
    main()
