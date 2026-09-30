# Census population estimates

Source files for `data/reference/population_by_county_year.csv`, compiled by
`app/pipeline/build_population.py`. Committed so the denominators are
reproducible offline.

| File | Covers | Downloaded from |
| --- | --- | --- |
| `co-est00int-tot.csv` | county, 2008-2009 | census.gov/programs-surveys/popest 2000-2010 intercensal |
| `co-est2019-alldata.csv` | county, 2010-2019 | vintage 2019 county estimates |
| `co-est2023-alldata.csv` | county, 2020-2022 | vintage 2023 county estimates |
| `sub-est00int.csv` | Chicago city, 2008-2009 | 2000-2010 intercensal subcounty |
| `sub-est2019_17.csv` | Chicago city, 2010-2019 | vintage 2019 subcounty, Illinois |
| `sub-est2023_17.csv` | Chicago city, 2020-2022 | vintage 2023 subcounty, Illinois |

The vintage changes at 2010 and 2020 because Census rebases its estimates
after each decennial count. That is standard for a 2008-2022 series and is why
the 2020 values step up slightly.
