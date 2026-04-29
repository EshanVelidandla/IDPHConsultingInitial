"""
process_all_providers.py
========================
Reads illinois_all_providers.csv (output of filter_all_il_providers.py)
and produces one county-by-year provider density CSV per cause of death.

OUTPUT: processin/backend/static/provider_tables/{cause}_provider_counts.csv
FORMAT: County,2009,2010,...,2022   (matches death_rate_tables format)

HOW TO RUN (after filter_all_il_providers.py):
    python3 process_all_providers.py
"""

import csv
import os
from datetime import date

# ── Paths ────────────────────────────────────────────────────────────────────

INPUT_FILE  = os.path.join(os.path.dirname(__file__), "illinois_all_providers.csv")
OUTPUT_DIR  = os.path.join(os.path.dirname(__file__),
                           "processin", "backend", "static", "provider_tables")

YEARS = list(range(2009, 2023))

# ── County populations (2020 Census) ─────────────────────────────────────────

COUNTY_POP = {
    "Adams": 65737, "Alexander": 5240, "Bond": 16725, "Boone": 53448,
    "Brown": 6244, "Bureau": 33244, "Calhoun": 4437, "Carroll": 15702,
    "Cass": 13042, "Champaign": 205865, "Christian": 34032, "Clark": 15455,
    "Clay": 13288, "Clinton": 36899, "Coles": 46863, "Cook": 5275541,
    "Crawford": 18679, "Cumberland": 10450, "DeKalb": 100420, "DeWitt": 15516,
    "Douglas": 19740, "DuPage": 932877, "Edgar": 16866, "Edwards": 6245,
    "Effingham": 34668, "Fayette": 21488, "Ford": 13534, "Franklin": 37804,
    "Fulton": 33609, "Gallatin": 4946, "Greene": 11985, "Grundy": 52533,
    "Hamilton": 7993, "Hancock": 17620, "Hardin": 3649, "Henderson": 6387,
    "Henry": 49284, "Iroquois": 27077, "Jackson": 52974, "Jasper": 9287,
    "Jefferson": 37113, "Jersey": 21512, "Jo Daviess": 22035, "Johnson": 13308,
    "Kane": 516522, "Kankakee": 107502, "Kendall": 131869, "Knox": 49967,
    "Lake": 714342, "LaSalle": 109658, "Lawrence": 15280, "Lee": 34145,
    "Livingston": 35815, "Logan": 27987, "McDonough": 27238, "McHenry": 310229,
    "McLean": 170954, "Macon": 103998, "Macoupin": 44967, "Madison": 265859,
    "Marion": 37729, "Marshall": 11742, "Mason": 13086, "Massac": 14169,
    "Menard": 12297, "Mercer": 15699, "Monroe": 34962, "Montgomery": 28288,
    "Morgan": 32915, "Moultrie": 14526, "Ogle": 51788, "Peoria": 181830,
    "Perry": 20945, "Piatt": 16673, "Pike": 14739, "Pope": 3763,
    "Pulaski": 5193, "Putnam": 5637, "Randolph": 30163, "Richland": 15813,
    "Rock Island": 144672, "St. Clair": 257400, "Saline": 23768, "Sangamon": 196343,
    "Schuyler": 6902, "Scott": 4949, "Shelby": 20990, "Stark": 5400,
    "Stephenson": 44630, "Tazewell": 131343, "Union": 17244, "Vermilion": 74188,
    "Wabash": 11361, "Warren": 16835, "Washington": 13761, "Wayne": 16179,
    "White": 13877, "Whiteside": 55691, "Will": 696355, "Williamson": 67153,
    "Winnebago": 285350, "Woodford": 38467,
}

# ── Cause → taxonomy codes ────────────────────────────────────────────────────
# "Total_Deaths" and "All_Other_Causes" share the Primary_Care set.
# Primary care uses a stricter filter (primary taxonomy switch must be Y)
# so that general internists aren't double-counted as specialists.

PRIMARY_CARE_CODES = {
    "207Q00000X",   # Family Medicine
    "207R00000X",   # Internal Medicine (general)
    "208D00000X",   # General Practice
}

CAUSE_TAXONOMY: dict[str, set[str]] = {

    "Chronic_Lower_Respiratory_Diseases": {
        "207RP1001X",   # Internal Medicine: Pulmonary Disease
        "207RC0000X",   # Internal Medicine: Critical Care Medicine
        "207RP0001X",   # Internal Medicine: Pulmonary Disease & Critical Care Medicine
        "2080P0207X",   # Pediatrics: Pediatric Pulmonology
        "208G00000X",   # Thoracic Surgery: Cardiothoracic Vascular Surgery
        "208GP0001X",   # Thoracic Surgery: General
    },
    "Diseases_of_Heart": {
        "207RC0200X",   # Internal Medicine: Cardiovascular Disease
        "207RI0011X",   # Internal Medicine: Clinical Cardiac Electrophysiology
        "207RA0001X",   # Internal Medicine: Advanced Heart Failure & Transplant Cardiology
        "207RA0401X",   # Internal Medicine: Interventional Cardiology
        "208G00000X",   # Thoracic Surgery: Cardiothoracic Vascular Surgery
    },
    "Malignant_Neoplasms": {
        "207RX0202X",   # Internal Medicine: Medical Oncology
        "207RH0003X",   # Internal Medicine: Hematology & Oncology
        "2085R0202X",   # Radiology: Radiation Oncology
        "2086X0206X",   # Surgery: Surgical Oncology
        "2080P0203X",   # Pediatrics: Pediatric Hematology-Oncology
    },
    "Cerebrovascular_Diseases": {
        "2084N0400X",   # Neurology
        "2084V0301X",   # Neurology: Vascular Neurology
        "2086S0129X",   # Surgery: Vascular Surgery
        "208VP0014X",   # Radiology: Vascular & Interventional Radiology
    },
    "Alzheimers_Disease": {
        "2084N0400X",   # Neurology
        "2084P0800X",   # Psychiatry & Neurology: Psychiatry (Geriatric)
        "207RG0300X",   # Internal Medicine: Geriatric Medicine
        "207QG0300X",   # Family Medicine: Geriatric Medicine
    },
    "Diabetes_Mellitus": {
        "207RE0101X",   # Internal Medicine: Endocrinology, Diabetes & Metabolism
        "2080E0001X",   # Pediatrics: Pediatric Endocrinology
    },
    "Nephritis_Nephrotic_Syndrome_Nephrosis": {
        "207RN0300X",   # Internal Medicine: Nephrology
        "2080N0001X",   # Pediatrics: Pediatric Nephrology
    },
    "Influenza_and_Pneumonia": {
        "207RI0200X",   # Internal Medicine: Infectious Disease
        "207RP1001X",   # Internal Medicine: Pulmonary Disease
        "207RP0001X",   # Internal Medicine: Pulmonary Disease & Critical Care Medicine
    },
    "Septicemia": {
        "207RI0200X",   # Internal Medicine: Infectious Disease
        "207RC0000X",   # Internal Medicine: Critical Care Medicine
        "207RP0001X",   # Internal Medicine: Pulmonary Disease & Critical Care Medicine
    },
    "COVID_19": {
        "207RI0200X",   # Internal Medicine: Infectious Disease
        "207RC0000X",   # Internal Medicine: Critical Care Medicine
        "207RP1001X",   # Internal Medicine: Pulmonary Disease
    },
    "Chronic_Liver_Disease_Cirrhosis": {
        "207RG0100X",   # Internal Medicine: Gastroenterology
        "2086S0105X",   # Surgery: Transplant Surgery
        "2080G0307X",   # Pediatrics: Pediatric Gastroenterology
    },
    "Intentional_Self_Harm": {
        "2084P0800X",   # Psychiatry & Neurology: Psychiatry
        "2084P0015X",   # Psychiatry & Neurology: Psychosomatic Medicine
        "103T00000X",   # Behavioral Health: Psychologist
        "101Y00000X",   # Behavioral Health: Counselor
    },
    "Accidents": {
        "207P00000X",   # Emergency Medicine
        "207PE0004X",   # Emergency Medicine: Emergency Medical Services
        "2086S0122X",   # Surgery: Surgical Critical Care
        "207XX0004X",   # Orthopedic Surgery: Orthopedic Trauma
    },
    # Primary care proxy — Total Deaths and All Other Causes
    "Total_Deaths":     PRIMARY_CARE_CODES,
    "All_Other_Causes": PRIMARY_CARE_CODES,
}

# ── City → County mapping ─────────────────────────────────────────────────────

CITY_TO_COUNTY = {
    "ABBOTT PARK": "Lake", "ALGONQUIN": "McHenry", "ALTON": "Madison",
    "ANNA": "Union", "ARLINGTON HEIGHTS": "Cook", "ARLINGTON HGTS": "Cook",
    "ARLINGTON HTS": "Cook", "AURORA": "Kane", "BANNOCKBURN": "Lake",
    "BARRINGTON": "Lake", "BELLEVEILLE": "St. Clair", "BELLEVILLE": "St. Clair",
    "BELLWOOD": "Cook", "BELVIDERE": "Boone", "BENTON": "Franklin",
    "BERWYN": "Cook", "BLOOMINGDALE": "DuPage", "BLOOMINGTON": "McLean",
    "BLUE ISLAND": "Cook", "BOLINGBROOK": "Will", "BOURBONNAIS": "Kankakee",
    "BREESE": "Clinton", "BROADVIEW": "Cook", "BUFFALO GROVE": "Lake",
    "BURBANK": "Cook", "BURR EVANSTON": "Cook", "BURR RIDGE": "DuPage",
    "CAHOKIA": "St. Clair", "CAHOKIA HEIGHTS": "St. Clair", "CAIRO": "Alexander",
    "CALUMET CITY": "Cook", "CANTON": "Fulton", "CARBONDALE": "Jackson",
    "CARMI": "White", "CAROL STREAM": "DuPage", "CARTERVILLE": "Williamson",
    "CENTRALIA": "Marion", "CENTREVILLE": "St. Clair", "CHAMPAIGN": "Champaign",
    "CHANNAHON": "Will", "CHARLESTON": "Coles", "CHESTER": "Randolph",
    "CHICAGO": "Cook", "CHICAGO HEIGHTS": "Cook", "CHICAGO RIDGE": "Cook",
    "CICERO": "Cook", "CLINTON": "DeWitt", "COAL CITY": "Grundy",
    "COLLINSVILLE": "Madison", "COLONA": "Henry", "COLUMBIA": "Monroe",
    "COUNTRYSIDE": "Cook", "CREST HILL": "Will", "CRESTWOOD": "Cook",
    "CRETE": "Will", "CRYSTAL LAKE": "McHenry", "DANVILLE": "Vermilion",
    "DARIEN": "DuPage", "DECATUR": "Macon", "DEERFIELD": "Lake",
    "DEKALB": "DeKalb", "DES PLAINES": "Cook", "DIXON": "Lee",
    "DOLTON": "Cook", "DOWNERS GROVE": "DuPage", "DOWNS": "McLean",
    "EAST ALTON": "Madison", "EAST SAINT LOUIS": "St. Clair",
    "EDWARDSVILLE": "Madison", "EFFINGHAM": "Effingham", "ELDORADO": "Saline",
    "ELGIN": "Kane", "ELK GROVE": "Cook", "ELK GROVE VILLAGE": "Cook",
    "ELK GROVE VILLIAGE": "Cook", "ELMHURST": "DuPage", "EVANSTON": "Cook",
    "EVERGREEN PARK": "Cook", "FAIRFIELD": "Wayne", "FAIRVIEW HEIGHTS": "St. Clair",
    "FLOSSMOOR": "Cook", "FORD HEIGHTS": "Cook", "FOREST PARK": "Cook",
    "FORREST PARK": "Cook", "FOX RIVER GROVE": "McHenry", "FRANKFORT": "Will",
    "FREEPORT": "Stephenson", "GALESBURG": "Knox", "GALVA": "Henry",
    "GENESEO": "Henry", "GENEVA": "Kane", "GIBSON CITY": "Ford",
    "GLEN CARBON": "Madison", "GLEN ELLYN": "DuPage", "GLENDALE HEIGHTS": "DuPage",
    "GLENDALE HTS": "DuPage", "GLENVIEW": "Cook", "GODFREY": "Madison",
    "GRANITE CITY": "Madison", "GRAYSLAKE": "Lake", "GREENVILLE": "Bond",
    "GURNEE": "Lake", "HARRISBURG": "Saline", "HARVARD": "McHenry",
    "HARVEY": "Cook", "HARWOOD HEIGHTS": "Cook", "HAZEL CREST": "Cook",
    "HERRIN": "Williamson", "HICKORY HILLS": "Cook", "HIGHLAND": "Madison",
    "HIGHLAND PARK": "Lake", "HINES": "Cook", "HINSDALE": "DuPage",
    "HOFFMAN ESTATES": "Cook", "HOMER GLEN": "Will", "HOMEWOOD": "Cook",
    "HOOPESTON": "Vermilion", "HUNTLEY": "McHenry", "INGLESIDE": "Lake",
    "INVERNESS": "Cook", "JACKSONVILLE": "Morgan", "JERSEYVILLE": "Jersey",
    "JOLIET": "Will", "KANKAKEE": "Kankakee", "KENILWORTH": "Cook",
    "LA GRANGE": "Cook", "LA GRANGE HIGHLANDS": "Cook", "LAKE BARRINGTON": "Lake",
    "LAKE BLUFF": "Lake", "LAKE FOREST": "Lake", "LAKE ZURICH": "Lake",
    "LANSING": "Cook", "LEMONT": "Cook", "LIBERTYVILLE": "Lake",
    "LINCOLN": "Logan", "LINCOLNSHIRE": "Lake", "LINCOLNWOOD": "Cook",
    "LISLE": "DuPage", "LOMBARD": "DuPage", "LYONS": "Cook",
    "MACOMB": "McDonough", "MANHATTAN": "Will", "MANTENO": "Kankakee",
    "MARION": "Williamson", "MARSEILLES": "LaSalle", "MARTINSVILLE": "Clark",
    "MARYVILLE": "Madison", "MATTESON": "Cook", "MATTOON": "Coles",
    "MAYWOOD": "Cook", "MC LEANSBORO": "Hamilton", "MCHENRY": "McHenry",
    "MELROSE PARK": "Cook", "MERRIONETTE PARK": "Cook", "MOKENA": "Will",
    "MOLINE": "Rock Island", "MONMOUTH": "Warren", "MORRIS": "Grundy",
    "MORTON": "Tazewell", "MORTON GROVE": "Cook", "MOUNT CARMEL": "Wabash",
    "MOUNT PROSPECT": "Cook", "MOUNT VERNON": "Jefferson", "MT PROSPECT": "Cook",
    "MT. VERNON": "Jefferson", "MURPHYSBORO": "Jackson", "NAPERVILLE": "DuPage",
    "NASHVILLE": "Washington", "NEW LENOX": "Will", "NILES": "Cook",
    "NORMAL": "McLean", "NORTH AURORA": "Kane", "NORTH CHICAGO": "Lake",
    "NORTHBROOK": "Cook", "NORTHFIELD": "Cook", "NORTHLAKE": "Cook",
    "O FALLON": "St. Clair", "O'FALLON": "St. Clair", "OAK BROOK": "DuPage",
    "OAK BROOK TERRACE": "DuPage", "OAK FOREST": "Cook", "OAK LAWN": "Cook",
    "OAK PARK": "Cook", "OAKBROOK TERRACE": "DuPage", "OLNEY": "Richland",
    "OLYMPIA FIELDS": "Cook", "ORLAND PARK": "Cook", "OTTAWA": "LaSalle",
    "PALOS HEIGHTS": "Cook", "PALOS HILLS": "Cook", "PALOS PARK": "Cook",
    "PARIS": "Edgar", "PARK RIDGE": "Cook", "PEKIN": "Tazewell",
    "PEORIA": "Peoria", "PEORIA HEIGHTS": "Peoria", "PLAINFIELD": "Will",
    "PLANO": "Kendall", "PONTIAC": "Livingston", "PRINCETON": "Bureau",
    "QUINCY": "Adams", "RANTOUL": "Champaign", "RIVER FOREST": "Cook",
    "RIVERSIDE": "Cook", "ROBINSON": "Crawford", "ROCHELLE": "Ogle",
    "ROCK ISLAND": "Rock Island", "ROCKFORD": "Winnebago", "ROSCOE": "Winnebago",
    "ROSEMONT": "Cook", "RUSHVILLE": "Schuyler", "SAINT CHARLES": "Kane",
    "SANDWICH": "DeKalb", "SAUGET": "St. Clair", "SCHAUMBURG": "Cook",
    "SCHILLER PARK": "Cook", "SCOTT AFB": "St. Clair", "SHELDON": "Iroquois",
    "SHILOH": "St. Clair", "SILVIS": "Rock Island", "SKOKIE": "Cook",
    "SMITHTON": "St. Clair", "SOUTH BARRINGTON": "Cook", "SOUTH ELGIN": "Kane",
    "SOUTH HOLLAND": "Cook", "SPARTA": "Randolph", "SPRING VALLEY": "Bureau",
    "SPRINGFIELD": "Sangamon", "ST CHARLES": "Kane", "STAUNTON": "Macoupin",
    "STERLING": "Whiteside", "STREAMWOOD": "Cook", "STREATOR": "LaSalle",
    "SWANSEA": "St. Clair", "SYCAMORE": "DeKalb", "TINLEY PARK": "Cook",
    "URBANA": "Champaign", "VANDALIA": "Fayette", "VERNON HILLS": "Lake",
    "WARRENVILLE": "DuPage", "WARSAW": "Hancock", "WASHINGTON": "Tazewell",
    "WAUKEGAN": "Lake", "WEST CHICAGO": "DuPage", "WEST DUNDEE": "Kane",
    "WEST FRANKFORT": "Franklin", "WESTCHESTER": "Cook",
    "WESTERN SPRINGS": "Cook", "WESTMONT": "DuPage", "WHEATON": "DuPage",
    "WHEELING": "Cook", "WILLOW BROOK": "DuPage", "WILLOWBROOK": "DuPage",
    "WILMETTE": "Cook", "WINFIELD": "DuPage", "WINNETKA": "Cook",
    "WOOD DALE": "DuPage", "WOODRIDGE": "DuPage", "WOODSTOCK": "McHenry",
    "WAUKEGAN": "Lake", "YORKVILLE": "Kendall", "ZION": "Lake",
}


def parse_date(s: str):
    s = s.strip()
    if not s:
        return None
    try:
        m, d, y = s.split("/")
        return date(int(y), int(m), int(d))
    except Exception:
        return None


def is_active(enum_date, deact_date, react_date, year: int) -> bool:
    jan1  = date(year, 1, 1)
    dec31 = date(year, 12, 31)
    if enum_date > dec31:
        return False
    if deact_date and deact_date < jan1:
        if react_date is None or react_date > dec31:
            return False
    return True


def write_cause_csv(cause: str, raw: dict[str, dict[int, int]]):
    fname = f"{cause}_provider_counts.csv"
    fpath = os.path.join(OUTPUT_DIR, fname)
    state_pop = sum(COUNTY_POP.values())

    with open(fpath, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["County"] + [str(y) for y in YEARS])

        state_raw  = {y: sum(raw[c][y] for c in raw) for y in YEARS}
        state_norm = {y: round(state_raw[y] / state_pop * 100_000, 2) for y in YEARS}
        writer.writerow(["ILLINOIS"] + [state_norm[y] for y in YEARS])

        for county in sorted(COUNTY_POP.keys()):
            pop = COUNTY_POP[county]
            row = [county] + [
                round(raw[county][y] / pop * 100_000, 2) if pop else 0.0
                for y in YEARS
            ]
            writer.writerow(row)

    return fpath


def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    print(f"Reading: {INPUT_FILE}\n")

    # Load all rows into memory (filtered file is manageable — ~50–200k rows)
    all_rows: list[dict] = []
    with open(INPUT_FILE, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            all_rows.append(row)

    print(f"Loaded {len(all_rows):,} provider records\n")

    # Identify taxonomy and switch column names present in the file
    sample = all_rows[0] if all_rows else {}
    tax_cols    = [f"Healthcare Provider Taxonomy Code_{i}"          for i in range(1, 16) if f"Healthcare Provider Taxonomy Code_{i}" in sample]
    switch_cols = [f"Healthcare Provider Primary Taxonomy Switch_{i}" for i in range(1, 16) if f"Healthcare Provider Primary Taxonomy Switch_{i}" in sample]

    # Process each cause
    for cause, codes in CAUSE_TAXONOMY.items():
        is_primary_care = (codes is PRIMARY_CARE_CODES)
        raw: dict[str, dict[int, int]] = {c: {y: 0 for y in YEARS} for c in COUNTY_POP}
        matched = 0

        for row in all_rows:
            city   = row.get("Provider Business Practice Location Address City Name", "").strip().upper()
            county = CITY_TO_COUNTY.get(city)
            if county is None:
                continue

            # For primary care: only count if a primary care code is the PRIMARY taxonomy
            if is_primary_care:
                hit = any(
                    row.get(tc, "") in codes and row.get(sc, "") == "Y"
                    for tc, sc in zip(tax_cols, switch_cols)
                )
            else:
                hit = any(row.get(tc, "") in codes for tc in tax_cols)

            if not hit:
                continue

            enum_date  = parse_date(row.get("Provider Enumeration Date", ""))
            deact_date = parse_date(row.get("NPI Deactivation Date", ""))
            react_date = parse_date(row.get("NPI Reactivation Date", ""))
            if enum_date is None:
                continue

            for year in YEARS:
                if is_active(enum_date, deact_date, react_date, year):
                    raw[county][year] += 1
            matched += 1

        fpath = write_cause_csv(cause, raw)
        state_2022 = round(sum(raw[c][2022] for c in raw) / sum(COUNTY_POP.values()) * 100_000, 2)
        print(f"  {cause:<45} {matched:>6} providers  |  IL 2022 avg: {state_2022:.1f}/100k  →  {os.path.basename(fpath)}")

    print(f"\nAll files written to: {OUTPUT_DIR}")


if __name__ == "__main__":
    main()
