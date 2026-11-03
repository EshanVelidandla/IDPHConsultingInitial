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
after each decennial count.

## The 2019-2020 seam

The two joins do not behave alike. Measured from
`data/reference/population_by_county_year.csv`, counting the 102 counties:

| Year pair | Counties moving more than 3% |
| --- | --- |
| 2009-2010 | 0 |
| 2019-2020 | 25 (18 down, 7 up) |
| Every other pair, 2010-2022 | 0 to 2 |

| Unit | 2019 (vintage 2019) | 2020 (vintage 2023) | Change |
| --- | --- | --- | --- |
| Alexander | 5,761 | 5,169 | -10.28% |
| Pope | 4,177 | 3,754 | -10.13% |
| McDonough | 29,682 | 27,100 | -8.70% |
| Greene | 12,969 | 11,936 | -7.97% |
| Carroll | 14,305 | 15,672 | +9.56% |
| Cook | 5,150,233 | 5,263,608 | +2.20% |
| Chicago | 2,693,976 | 2,743,329 | +1.83% |
| Suburban Cook | 2,456,257 | 2,520,279 | +2.61% |
| Illinois | 12,671,821 | 12,790,357 | +0.94% |

The effect on rates depends on the direction:

- **Counties that step down**, such as Alexander and Pope: the 2010s
  denominators read high against the 2020 base, so 2010s rates read low and
  the rise into 2020 is overstated.
- **Counties that step up**, including Cook, Chicago and Suburban Cook: the
  2010s denominators read low, so 2010s rates read high and the rise into 2020
  is understated.

Small counties move the most. Any comparison or trend across 2019-2020 is
partly a denominator effect, on top of the real change in deaths during 2020.
The app says so through `population_note` in `/meta` and a caveat on the Map,
Insights and Priority views.

These denominators are unchanged. The reviewer suggested Census 2010-2020
intercensal estimates (`co-est2020int`) for 2010-2019. That series has not been
downloaded or checked, and a matching file for Chicago is not confirmed.
Adopting it needs the owner's approval and would change every county's
2010-2019 rate.
