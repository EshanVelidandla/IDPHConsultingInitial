# IDPH annual county death reports, 2008-2022

The fifteen PDFs in this directory are the pipeline's primary input. They are
committed deliberately, against the repository-wide `*.pdf` ignore rule, with
an explicit exception in `.gitignore`. Without them the pipeline cannot be
rerun from a clean clone and the published numbers cannot be audited. Together
they are about 2 MB.

Source: Illinois Department of Public Health, "Causes of Death by Resident
County" / "Statewide Leading Causes of Death by Resident County", annual.

## Why the column order matters

IDPH reorders the cause columns between report years and the PDFs carry no
machine-readable header. `app/pipeline/extract_pdf_data.py` holds a verified
column order per year in `YEAR_SCHEMAS`, and `verify_header_order()` checks it
against each PDF's printed header before extracting, failing the run on a
mismatch.

Nine of the fifteen years had been mapped wrongly before this was checked in
September 2026, which filed one cause's deaths under another cause's name.
The volatile positions are 3 to 5 (stroke, chronic lower respiratory disease
and accidents, reordered almost every year) and 7 to 8 (diabetes and kidney
disease, swapped in 2010 and 2011). 2021 ends with chronic liver disease where
other years end with influenza.

## Adding a new year

1. Drop the PDF in this directory with the year in its filename.
2. Open page 1 and read the printed column order.
3. Add that year to `YEAR_SCHEMAS`. Do not copy a neighbouring year.
4. Add the year to `YEARS` in `deaths_pipeline.py` and extend the population
   table via `build_population.py`.
5. Run `python -m pytest app/pipeline/tests -q`, then `python run_pipeline.py`.

`get_schema` raises on an unknown year rather than guessing, so step 3 cannot
be skipped by accident.
