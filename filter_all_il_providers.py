"""
filter_all_il_providers.py
==========================
Reads the full 4GB NPI file ONCE and extracts all Illinois providers
whose taxonomy codes match any condition in our analysis.

This script only needs to be re-run if the source NPI file is updated.

OUTPUT: illinois_all_providers.csv  (same directory as this script)
"""

import csv
import os
import time

# ── Input / output ──────────────────────────────────────────────────────────

INPUT_FILE  = "/Users/bjmensah/Desktop/Research/Big_files/ALLdata/npidata_pfile_20050523-20260208.csv"
OUTPUT_FILE = os.path.join(os.path.dirname(__file__), "illinois_all_providers.csv")

# ── All taxonomy codes across every condition ────────────────────────────────
# Organised by condition for readability — at runtime we flatten to one set.

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

    # Primary care — proxy for Total Deaths and All Other Causes.
    # Stored under a single key; both causes use the same provider set.
    "Primary_Care": {
        "207Q00000X",   # Family Medicine
        "207R00000X",   # Internal Medicine (general)
        "208D00000X",   # General Practice
    },
}

# Flat set of every code we care about across all conditions
ALL_CODES: set[str] = set()
for codes in CAUSE_TAXONOMY.values():
    ALL_CODES.update(codes)

# ── Columns to keep (same fields used by process_all_providers.py) ──────────

COLUMNS_TO_KEEP = [
    "NPI",
    "Entity Type Code",
    "Provider Last Name (Legal Name)",
    "Provider First Name",
    "Provider Credential Text",
    "Provider Organization Name (Legal Business Name)",
    "Provider Sex Code",
    "Provider First Line Business Practice Location Address",
    "Provider Business Practice Location Address City Name",
    "Provider Business Practice Location Address State Name",
    "Provider Business Practice Location Address Postal Code",
    "Provider Enumeration Date",
    "Last Update Date",
    "NPI Deactivation Date",
    "NPI Reactivation Date",
    *[f"Healthcare Provider Taxonomy Code_{i}"  for i in range(1, 16)],
    *[f"Healthcare Provider Primary Taxonomy Switch_{i}" for i in range(1, 16)],
]

# ── Main ─────────────────────────────────────────────────────────────────────

def main():
    print(f"Source : {INPUT_FILE}")
    print(f"Output : {OUTPUT_FILE}")
    print(f"Tracking {len(ALL_CODES)} unique taxonomy codes across {len(CAUSE_TAXONOMY)} conditions\n")

    rows_read = rows_written = 0
    start = time.time()

    with open(INPUT_FILE,  "rt", encoding="utf-8", newline="") as infile, \
         open(OUTPUT_FILE, "wt", encoding="utf-8", newline="") as outfile:

        reader  = csv.reader(infile)
        headers = next(reader)

        state_col  = headers.index("Provider Business Practice Location Address State Name")
        tax_cols   = [headers.index(f"Healthcare Provider Taxonomy Code_{i}")
                      for i in range(1, 16)
                      if f"Healthcare Provider Taxonomy Code_{i}" in headers]

        keep_indices  = [headers.index(c) for c in COLUMNS_TO_KEEP if c in headers]
        keep_headers  = [headers[i] for i in keep_indices]

        writer = csv.writer(outfile)
        writer.writerow(keep_headers)

        for row in reader:
            rows_read += 1
            if rows_read % 500_000 == 0:
                elapsed = time.time() - start
                print(f"  {rows_read:,} rows read  |  {rows_written:,} matched  |  {elapsed:.0f}s elapsed")

            # Illinois only
            if len(row) <= state_col or row[state_col] != "IL":
                continue

            # At least one taxonomy code must match our set
            if not any(row[i] in ALL_CODES for i in tax_cols if i < len(row)):
                continue

            writer.writerow([row[i] if i < len(row) else "" for i in keep_indices])
            rows_written += 1

    elapsed = time.time() - start
    print(f"\nDone in {elapsed:.0f}s")
    print(f"  Total rows read    : {rows_read:,}")
    print(f"  IL providers saved : {rows_written:,}")
    print(f"  Output             : {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
