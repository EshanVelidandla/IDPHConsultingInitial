# HRSA Area Health Resources Files (AHRF)

Input to `app/pipeline/process_hrsa.py`, which builds the provider tables in
`app/backend/static/provider_tables/`.

## What the pipeline reads

| Source key | Data file (Git LFS) | SAS layout |
| --- | --- | --- |
| `new` | `21-22/DATA/ahrf2022.asc` | `21-22/DOC/AHRF2021-2022.sas` |
| `old` | `09-10/ahrf2009.asc` | `09-10/Technical Documentation/arf2009.sas` |
| `y2012` | `12-13/ahrf2012.asc` | `12-13/Technical Documentation/AHRF2012.sas` |
| `y2014` | `14-15/ahrf2014.asc` | `13-14/Technical Documentation/AHRF2014.sas` |
| `y2015` | `15-16/ahrf2015.asc` | `14-15/Technical Documentation/AHRF2015.sas` |
| `y2016` | `16-17/ahrf2016.asc` | `15-16/Technical Documentation/ahrf2015-16.sas` |
| `y2017` | `17-18/ahrf2017.asc` | `16-17/Technical Documentation/ahrf2016-17.sas` |
| `y2018` | `18-19/ahrf2018.asc` | `17-18/Technical Documentation/AHRF2017-18.sas` |
| `y2019` | `19-20/ahrf2019.asc` | `18-19/Technical Documentation/AHRF2018-19.sas` |
| `y2021` | `20-21/AHRF_2020-2021/DATA/ahrf2021.asc` | `20-21/AHRF_2020-2021/DOC/AHRF2020-2021.sas` |

The `.asc` files are fixed-width records; each SAS layout gives the column
positions for its release. From 13-14 onward a layout's directory is one year
behind its data file's, so pair them as listed above. Nothing else in this
folder is read.

## Years that stay filled in

Beds 2018, 2021, 2022; psychiatry 2009, 2018, 2021, 2022; HPSA 2014; total MDs
2009, 2021, 2022; primary care 2008, 2009, 2021, 2022. No layout here defines
them. HPSA 2014 (`f0978714`) is in no release at all.

## What is not committed

The `11-12` layout, the 2008 layout text, the rest of the 2020-21 documentation
folder and the 2022-23 CSV release (about 180 MB) were once committed but never
used. They are now gitignored. If a future change needs one, download that
release from
<https://data.hrsa.gov/topics/health-workforce/ahrf> and add an exception to
`.gitignore` alongside the code that reads it.

The `08-09` and `11-12` `.asc` data files are still tracked through Git LFS,
although nothing reads them today.
