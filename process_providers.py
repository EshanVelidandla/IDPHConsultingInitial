"""
process_providers.py
====================
Converts illinois_respiratory_providers.csv into a county-by-year table of
respiratory specialist density (providers per 100,000 residents).

OUTPUT: processin/backend/static/provider_counts_by_county_year.csv
FORMAT: County,2009,2010,...,2022   (matches the death_rate_tables format)

HOW TO RUN:
    python3 process_providers.py
"""

import csv
import os
from datetime import date

# ── Config ────────────────────────────────────────────────────

INPUT_FILE  = "illinois_respiratory_providers.csv"
OUTPUT_FILE = os.path.join(
    os.path.dirname(__file__),
    "processin", "backend", "static", "provider_counts_by_county_year.csv"
)
YEARS = list(range(2009, 2023))   # 2009–2022 to match mortality data

# ── County populations (2020 Census, matching death-rate table spellings) ─

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

# ── City → County mapping (Illinois only) ─────────────────────
# Multi-county cities are assigned to their primary (most-populated) county.

CITY_TO_COUNTY = {
    "ABBOTT PARK":         "Lake",
    "ALGONQUIN":           "McHenry",
    "ALTON":               "Madison",
    "ANNA":                "Union",
    "ARLINGTON HEIGHTS":   "Cook",
    "ARLINGTON HGTS":      "Cook",
    "ARLINGTON HTS":       "Cook",
    "AURORA":              "Kane",
    "BANNOCKBURN":         "Lake",
    "BARRINGTON":          "Lake",
    "BELLEVEILLE":         "St. Clair",  # typo in source data
    "BELLEVILLE":          "St. Clair",
    "BELLWOOD":            "Cook",
    "BELVIDERE":           "Boone",
    "BENTON":              "Franklin",
    "BERWYN":              "Cook",
    "BLOOMINGDALE":        "DuPage",
    "BLOOMINGTON":         "McLean",
    "BLUE ISLAND":         "Cook",
    "BOLINGBROOK":         "Will",
    "BOURBONNAIS":         "Kankakee",
    "BREESE":              "Clinton",
    "BROADVIEW":           "Cook",
    "BUFFALO GROVE":       "Lake",
    "BURBANK":             "Cook",
    "BURR EVANSTON":       "Cook",
    "BURR RIDGE":          "DuPage",
    "CAHOKIA":             "St. Clair",
    "CAHOKIA HEIGHTS":     "St. Clair",
    "CAIRO":               "Alexander",
    "CALUMET CITY":        "Cook",
    "CANTON":              "Fulton",
    "CARBONDALE":          "Jackson",
    "CARMI":               "White",
    "CAROL STREAM":        "DuPage",
    "CARTERVILLE":         "Williamson",
    "CENTRALIA":           "Marion",
    "CENTREVILLE":         "St. Clair",
    "CHAMPAIGN":           "Champaign",
    "CHANNAHON":           "Will",
    "CHARLESTON":          "Coles",
    "CHESTER":             "Randolph",
    "CHICAGO":             "Cook",
    "CHICAGO HEIGHTS":     "Cook",
    "CHICAGO RIDGE":       "Cook",
    "CICERO":              "Cook",
    "COAL CITY":           "Grundy",
    "COLONA":              "Henry",
    "COLUMBIA":            "Monroe",
    "COUNTRYSIDE":         "Cook",
    "CREST HILL":          "Will",
    "CRESTWOOD":           "Cook",
    "CRETE":               "Will",
    "CRYSTAL LAKE":        "McHenry",
    "DANVILLE":            "Vermilion",
    "DARIEN":              "DuPage",
    "DECATUR":             "Macon",
    "DEERFIELD":           "Lake",
    "DEKALB":              "DeKalb",
    "DES PLAINES":         "Cook",
    "DIXON":               "Lee",
    "DOLTON":              "Cook",
    "DOWNERS GROVE":       "DuPage",
    "DOWNS":               "McLean",
    "EAST ALTON":          "Madison",
    "EAST SAINT LOUIS":    "St. Clair",
    "EDWARDSVILLE":        "Madison",
    "EFFINGHAM":           "Effingham",
    "ELDORADO":            "Saline",
    "ELGIN":               "Kane",
    "ELK GROVE":           "Cook",
    "ELK GROVE VILLAGE":   "Cook",
    "ELK GROVE VILLIAGE":  "Cook",
    "ELMHURST":            "DuPage",
    "EVANSTON":            "Cook",
    "EVERGREEN PARK":      "Cook",
    "FAIRFIELD":           "Wayne",
    "FAIRVIEW HEIGHTS":    "St. Clair",
    "FLOSSMOOR":           "Cook",
    "FORD HEIGHTS":        "Cook",
    "FOREST PARK":         "Cook",
    "FORREST PARK":        "Cook",
    "FOX RIVER GROVE":     "McHenry",
    "FRANKFORT":           "Will",
    "FREEPORT":            "Stephenson",
    "GALESBURG":           "Knox",
    "GENEVA":              "Kane",
    "GIBSON CITY":         "Ford",
    "GLEN CARBON":         "Madison",
    "GLEN ELLYN":          "DuPage",
    "GLENDALE HEIGHTS":    "DuPage",
    "GLENDALE HTS":        "DuPage",
    "GLENVIEW":            "Cook",
    "GODFREY":             "Madison",
    "GRANITE CITY":        "Madison",
    "GRAYSLAKE":           "Lake",
    "GREENVILLE":          "Bond",
    "GURNEE":              "Lake",
    "HARRISBURG":          "Saline",
    "HARVARD":             "McHenry",
    "HARVEY":              "Cook",
    "HARWOOD HEIGHTS":     "Cook",
    "HAZEL CREST":         "Cook",
    "HERRIN":              "Williamson",
    "HICKORY HILLS":       "Cook",
    "HIGHLAND PARK":       "Lake",
    "HINES":               "Cook",
    "HINSDALE":            "DuPage",
    "HOFFMAN ESTATES":     "Cook",
    "HOMER GLEN":          "Will",
    "HOMEWOOD":            "Cook",
    "HOOPESTON":           "Vermilion",
    "HUNTLEY":             "McHenry",
    "INGLESIDE":           "Lake",
    "INVERNESS":           "Cook",
    "JACKSONVILLE":        "Morgan",
    "JERSEYVILLE":         "Jersey",
    "JOLIET":              "Will",
    "KANKAKEE":            "Kankakee",
    "KENILWORTH":          "Cook",
    "LA GRANGE":           "Cook",
    "LA GRANGE HIGHLANDS": "Cook",
    "LAKE BARRINGTON":     "Lake",
    "LAKE BLUFF":          "Lake",
    "LAKE FOREST":         "Lake",
    "LAKE ZURICH":         "Lake",
    "LANSING":             "Cook",
    "LEMONT":              "Cook",
    "LIBERTYVILLE":        "Lake",
    "LINCOLNSHIRE":        "Lake",
    "LINCOLNWOOD":         "Cook",
    "LISLE":               "DuPage",
    "LOMBARD":             "DuPage",
    "LYONS":               "Cook",
    "MACOMB":              "McDonough",
    "MANHATTAN":           "Will",
    "MANTENO":             "Kankakee",
    "MARION":              "Williamson",
    "MARSEILLES":          "LaSalle",
    "MARTINSVILLE":        "Clark",
    "MARYVILLE":           "Madison",
    "MATTESON":            "Cook",
    "MATTOON":             "Coles",
    "MAYWOOD":             "Cook",
    "MC LEANSBORO":        "Hamilton",
    "MCHENRY":             "McHenry",
    "MELROSE PARK":        "Cook",
    "MERRIONETTE PARK":    "Cook",
    "MOKENA":              "Will",
    "MOLINE":              "Rock Island",
    "MORRIS":              "Grundy",
    "MORTON":              "Tazewell",
    "MORTON GROVE":        "Cook",
    "MOUNT CARMEL":        "Wabash",
    "MOUNT PROSPECT":      "Cook",
    "MOUNT VERNON":        "Jefferson",
    "MT PROSPECT":         "Cook",
    "MT. VERNON":          "Jefferson",
    "MURPHYSBORO":         "Jackson",
    "NAPERVILLE":          "DuPage",
    "NASHVILLE":           "Washington",
    "NEW LENOX":           "Will",
    "NILES":               "Cook",
    "NORMAL":              "McLean",
    "NORTH AURORA":        "Kane",
    "NORTH CHICAGO":       "Lake",
    "NORTHBROOK":          "Cook",
    "NORTHFIELD":          "Cook",
    "NORTHLAKE":           "Cook",
    "O FALLON":            "St. Clair",
    "O'FALLON":            "St. Clair",
    "OAK BROOK":           "DuPage",
    "OAK BROOK TERRACE":   "DuPage",
    "OAK FOREST":          "Cook",
    "OAK LAWN":            "Cook",
    "OAK PARK":            "Cook",
    "OAKBROOK TERRACE":    "DuPage",
    "OLNEY":               "Richland",
    "OLYMPIA FIELDS":      "Cook",
    "ORLAND PARK":         "Cook",
    "OTTAWA":              "LaSalle",
    "PALOS HEIGHTS":       "Cook",
    "PALOS HILLS":         "Cook",
    "PALOS PARK":          "Cook",
    "PARIS":               "Edgar",
    "PARK RIDGE":          "Cook",
    "PEKIN":               "Tazewell",
    "PEORIA":              "Peoria",
    "PEORIA HEIGHTS":      "Peoria",
    "PLAINFIELD":          "Will",
    "PLANO":               "Kendall",
    "QUINCY":              "Adams",
    "RIVER FOREST":        "Cook",
    "RIVERSIDE":           "Cook",
    "ROBINSON":            "Crawford",
    "ROCHELLE":            "Ogle",
    "ROCK ISLAND":         "Rock Island",
    "ROCKFORD":            "Winnebago",
    "ROSCOE":              "Winnebago",
    "ROSEMONT":            "Cook",
    "SAINT CHARLES":       "Kane",
    "SANDWICH":            "DeKalb",
    "SAUGET":              "St. Clair",
    "SCHAUMBURG":          "Cook",
    "SCHILLER PARK":       "Cook",
    "SCOTT AFB":           "St. Clair",
    "SHELDON":             "Iroquois",
    "SHILOH":              "St. Clair",
    "SILVIS":              "Rock Island",
    "SKOKIE":              "Cook",
    "SMITHTON":            "St. Clair",
    "SOUTH BARRINGTON":    "Cook",
    "SOUTH ELGIN":         "Kane",
    "SOUTH HOLLAND":       "Cook",
    "SPRING VALLEY":       "Bureau",
    "SPRINGFIELD":         "Sangamon",
    "ST CHARLES":          "Kane",
    "STAUNTON":            "Macoupin",
    "STERLING":            "Whiteside",
    "STREAMWOOD":          "Cook",
    "STREATOR":            "LaSalle",
    "SWANSEA":             "St. Clair",
    "SYCAMORE":            "DeKalb",
    "TINLEY PARK":         "Cook",
    "URBANA":              "Champaign",
    "VERNON HILLS":        "Lake",
    "WARRENVILLE":         "DuPage",
    "WARSAW":              "Hancock",
    "WASHINGTON":          "Tazewell",
    "WAUKEGAN":            "Lake",
    "WEST CHICAGO":        "DuPage",
    "WEST DUNDEE":         "Kane",
    "WEST FRANKFORT":      "Franklin",
    "WESTCHESTER":         "Cook",
    "WESTERN SPRINGS":     "Cook",
    "WESTMONT":            "DuPage",
    "WILLOW BROOK":        "DuPage",
    "WILLOWBROOK":         "DuPage",
    "WILMETTE":            "Cook",
    "WINFIELD":            "DuPage",
    "WINNETKA":            "Cook",
    "WOOD DALE":           "DuPage",
    "WOODRIDGE":           "DuPage",
    "WOODSTOCK":           "McHenry",
    "YORKVILLE":           "Kendall",
    "ZION":                "Lake",
}


def parse_date(s: str):
    """Parse MM/DD/YYYY → date, or return None."""
    s = s.strip()
    if not s:
        return None
    try:
        m, d, y = s.split("/")
        return date(int(y), int(m), int(d))
    except Exception:
        return None


def main():
    # Raw counts per county per year
    raw: dict[str, dict[int, int]] = {county: {y: 0 for y in YEARS} for county in COUNTY_POP}

    skipped_city = 0
    total = 0

    with open(INPUT_FILE, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            total += 1
            city = row["Provider Business Practice Location Address City Name"].strip().upper()
            county = CITY_TO_COUNTY.get(city)

            if county is None:
                skipped_city += 1
                continue

            enum_date   = parse_date(row["Provider Enumeration Date"])
            deact_date  = parse_date(row["NPI Deactivation Date"])
            react_date  = parse_date(row["NPI Reactivation Date"])

            if enum_date is None:
                continue

            for year in YEARS:
                jan1 = date(year, 1, 1)
                dec31 = date(year, 12, 31)

                # Must have been enrolled by end of year
                if enum_date > dec31:
                    continue

                # If deactivated before this year started AND not reactivated, skip
                if deact_date and deact_date < jan1:
                    if react_date is None or react_date > dec31:
                        continue

                raw[county][year] += 1

    print(f"Total rows: {total}")
    print(f"Skipped (city not in IL mapping): {skipped_city}")

    # Normalize to per 100k and write
    os.makedirs(os.path.dirname(OUTPUT_FILE), exist_ok=True)

    with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["County"] + [str(y) for y in YEARS])

        # Statewide total row
        state_raw = {y: sum(raw[c][y] for c in raw) for y in YEARS}
        state_pop  = sum(COUNTY_POP.values())
        state_norm = {y: round(state_raw[y] / state_pop * 100_000, 2) for y in YEARS}
        writer.writerow(["ILLINOIS"] + [state_norm[y] for y in YEARS])

        for county in sorted(COUNTY_POP.keys()):
            pop = COUNTY_POP[county]
            row_out = [county]
            for y in YEARS:
                count = raw[county][y]
                per100k = round(count / pop * 100_000, 2) if pop else 0.0
                row_out.append(per100k)
            writer.writerow(row_out)

    print(f"Written to: {OUTPUT_FILE}")

    # Quick sanity check
    sample = {c: raw[c][2022] for c in ["Cook", "Peoria", "Champaign", "Alexander"]}
    print("Raw 2022 counts (sample):", sample)


if __name__ == "__main__":
    main()
