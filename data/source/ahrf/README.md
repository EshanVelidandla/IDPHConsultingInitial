# HRSA Area Health Resources Files (AHRF)

Input to `app/pipeline/process_hrsa.py`, which builds the provider tables in
`app/backend/static/provider_tables/`.

## What the pipeline reads

| Source key | Data file (Git LFS) | SAS layout |
| --- | --- | --- |
| `new` | `21-22/DATA/ahrf2022.asc` | `21-22/DOC/AHRF2021-2022.sas` |
| `old` | `09-10/ahrf2009.asc` | `09-10/Technical Documentation/arf2009.sas` |
| `y2012` | `12-13/ahrf2012.asc` | `12-13/Technical Documentation/AHRF2012.sas` |

The `.asc` files are fixed-width records; each SAS layout gives the column
positions for its release. Nothing else in this folder is read.

## What is not committed

The other releases' SAS layouts, the 2008 layout text, the 2020-21
documentation folder and the 2022-23 CSV release (about 180 MB) were once
committed but never used. They are now gitignored. If a future change needs
one, download that release from
<https://data.hrsa.gov/topics/health-workforce/ahrf> and add an exception to
`.gitignore` alongside the code that reads it.

The `.asc` data files for the remaining releases are still tracked through
Git LFS. They are unused today but are the raw source for years the pipeline
currently interpolates, so they were left in place.
