# NCSA review: resolution record

This is the record of how each issue from the NCSA review was handled. It covers
the issues filed on this repository by Matt Berry across three review passes.

All fixes described here are in commit `ade0ce8`, merged to `main` as `36d3107`
through [PR #38](https://github.com/EshanVelidandla/IDPHConsultingInitial/pull/38).
No issue has been closed by us: closing is left to the reviewer.

## Where to find what

| You want | Look in |
| --- | --- |
| Status of every issue | The tables below |
| Analysis of one issue: findings, files changed, checks run, what was not verified | `issue-reports/<number>.md` |
| Every provider table cell that changed, before and after | `provider-table-diff.csv` (1,243 cells) |
| Earlier fixes, passes 1 and 2 | `CHANGES-issue-remediation.md` at the repository root |

`issue-reports/` holds the working notes written while each fix was built, in its
own isolated worktree and before the fixes were merged together. Local file paths
are masked and nothing else was edited. Words such as "orchestrator", "owner" and
"plan row" refer to that working process. The test counts in them are from that
isolated run. Where a report and this page disagree, this page is current. Known
example: `issue-reports/18.md` records `npm audit` at 0 advisories, but that
lockfile update was left out of the merge.

## Status

**Fixed** means changed at `ade0ce8` and checked by us, awaiting your confirmation.
**Partial** means the code work is done and a named remainder is still open.
**Open** means no fix is in `main`.

### Fixed

| # | Issue | Resolution | Regression check |
| --- | --- | --- | --- |
| 5 | Missing data shown as 0 | Null and real zero stay distinct in every view through `toRate` and `rateMapOf`. The `2008` skips and the hard-coded `2019`, `2022` and `2009 - 2022` are gone | `tests/logic.test.mjs`, `tests/map-band.test.mjs` |
| 10 | Annotations | The annotation PUT now validates cause. `ILLINOIS` stays a target on purpose, labeled "Illinois (statewide)" | `test_annotations.py` |
| 11 | Frontend flows | Failed loads show a message, including all admin loads and deletes. The dead `.catch` after `allSettled` is gone. Baseline text is placed on the first year of the series | `tests/failed-loads.test.mjs` |
| 12 | Analytics | Priority legend now states the 1.2x split it actually uses, via `QUADRANT_DESC`. Local `pearsonR` and `TIP_STYLE` removed. The Pulse claim about the sharpest rise was checked: 2020 is the largest rise in the series (+177.8 per 100k) | `tests/priority-consistency.test.mjs` |
| 13 | Runtime state | Reads create no files, including `GET /admin/users`. Uploads go to an overlay in `var/` and never rewrite tracked tables. **Needs from NCSA:** a mounted volume for `app/backend/var/` | `test_runtime_state.py` |
| 20 | JSON stores | Writes go through a temp file and `os.replace` under a sidecar lock. First-time seeding happens under the lock. A corrupt file raises instead of reading as empty | `test_storage.py` |
| 21 | Scorecard loop | Provider load is tracked by a status field, not by the data object, so a failure cannot retrigger it | `tests/scorecard-provider.test.mjs` |
| 22 | Map focus | `bringToFront` is skipped for the focused path, and the layer is long-lived so a year change keeps focus | `map-focus.mjs` |
| 23 | Backups | Names carry microseconds and a short uuid. Retention keeps the newest 10 per cause plus the oldest | `test_backups.py` |
| 24 | Data cache | An axios response interceptor clears the cache after every non-GET. Eviction on failure only removes that request's own entry | `tests/dataCache.test.mjs` |
| 25 | Loading overlay | Cleared on cleanup and on every early return. Scorecard and the county profile keep no stale flag because they are mount-only requests with fixed URLs, so no newer request can be overwritten | `overlay-regression.mjs` |
| 26 | Missing county | A missing county-year, a missing population or state-versus-county drift now fails the run. The message reports cells actually checked | `test_deaths_guards.py` |
| 28 | Upload validation | Exact reporting areas, pinned year columns, numeric or empty cells, plausible ranges, atomic swap. `/meta` year range no longer comes from any table | `test_upload_validation.py` |
| 29 | Map border | Fill and border classify from the same value. Real zeros get the low band and missing cells get the no-data style | `tests/map-band.test.mjs` |
| 30 | Smoke test | Asserts data-dependent content, fails on network errors, and treats crashes as failures. With no backend it exits non-zero | `tests/smoke.test.mjs` |
| 31 | Pipeline hygiene | LF output. Provider state rows weight by AHRF population, the same denominator as county rates. Header check extended past page 1, for contradictions only. Bare `.` keeps its column | `test_pipeline.py`, `test_regeneration.py` |
| 32 | Minor UI and routing | Route-aware strip label, selected-year `aria-valuetext`, encoded export URL, 404 for unknown non-GET paths, `*` route, startup survives a missing `ui/assets`, stray `thresholds.json` removed | `test_routing.py`, `smoke.mjs` |
| 33 | Empty county profile | County names resolve at event time, and `/county/:name` matches case-insensitively | `tests/map-county-links.smoke.mjs` |
| 34 | Thresholds | Relabeled "Reference thresholds (not monitored)", and `notify_email` removed from the API and form | `test_thresholds.py` |
| 35 | Export | Each view registers what it shows, and the button names it. No `alert()`. Presets still do not set the Access or Pulse cause, by decision: those views keep their own cause, and the preset menu says so | `export-check.mjs` |

### Partial

| # | Issue | Done | Still open | Waiting on |
| --- | --- | --- | --- | --- |
| 7 | Provider data | Interpolated years replaced by measured AHRF values: beds 2008, 2009, 2011-2014, 2016, 2017, 2019; psychiatry 2008, 2011-2014, 2016, 2017, 2019; HPSA 2013. HPSA removed from correlations. Zero counties kept in every view. Bivariate map uses only legend colors. Insights and Access now agree. Imputed years labeled in every view | Beds 2018, 2021, 2022, psychiatry 2009, 2018, 2021, 2022 and HPSA 2014 stay imputed and labeled, since no layout on disk defines them. See `issue-reports/7.md` | None, unless you know a source |
| 8 | Secrets in history | Ignore rules for `.env.*`, `users.json` and audit logs. `.gitleaks.toml` and a pre-commit example, neither ever run by gitleaks. Migration runbook in `issue-reports/8.md` | History untouched, nothing rotated, scanner not active. The statement you asked for is not made yet because it is not yet true. The literal seed passwords in `auth.py` are still in the tree | Decision with NCSA |
| 9 | Pipeline rerun | Python pinned by `.python-version`, `pdfminer.six` and `pytest` pinned, regeneration test diffs against committed tables, clear LFS hint | The provider stage still needs git-lfs, by design | Nothing |
| 14 | Accessibility | Old gray removed, `--ink-4` passes AA on all three backgrounds, `--ink-5` has no text uses, CSV label fixed, no-data counties carry a dashed outline | Chart dots remain mouse-only, with the same data in tables. Formal WCAG conformance has not been assessed | IDPH sign-off |
| 16 | Cleanup | `/meta` goes through the shared client, tables are cached by mtime, duplicates removed | `/admin/audit` still reads and sorts the whole log on each call. Raw files remain in history | History: same as #8 |
| 18 | Unverified items | Dev proxy fixed earlier. Provider table provenance now checked by the regeneration test with LFS files present | **Advisories:** see "Verification". **pip-audit:** not run. **District list:** the groupings appear to match IDOT highway districts, not IDPH regions. The evidence is in `issue-reports/18.md`, but the neutral UI label and GeoJSON provenance note were not added | IDPH, and us |
| 27 | Population seam | Measured and documented in `data/source/census/README.md`. `/meta` carries `population_note`. Map, Insights and Priority show a caveat on trends crossing 2020 | Denominators unchanged. The intercensal series has not been downloaded or checked. Adopting it changes 2010-2019 rates | Our approval |
| 36 | Chicago and Suburban Cook | Linked from the Cook profile, headings fixed, provider panel explains itself | No Scorecard rows or toggle, by decision unless IDPH asks | IDPH, if wanted |
| 37 | Small items | Population label, README setup, LFS hint, unused file deleted, Pulse text, preset validation | No license or data terms. AMA redistribution question unanswered. History bloat, with #8 | Our decision |

### Open

| # | Issue | State |
| --- | --- | --- |
| 1 | Authentication | Bypass still in `main`, and the README says this build is local-only. An SSO proxy design is drafted, not merged and not pushed. Its design and what it needs from NCSA are in `issue-reports/1.md`. It has only been tested with simulated headers |

### Leftovers on closed issues

| # | Leftover | State |
| --- | --- | --- |
| 4 | `/meta` `rate_label` and `rate_note` unused by the frontend | **Still open.** Declared in the `Meta` type and fallback, but no view reads them |
| 6 | Dead `.` suppression branch | Fixed, under #31 |
| 17 | 2008 Nephritis and Septicemia header check | Fixed by an explicit override, under #31 |
| 17 | 2011 PDF title reads "2010" and its values are not rank-ordered | **Not investigated.** Still needs checking with IDPH |

## Corrections to the findings

Recomputed from committed data. Please check these.

| # | Filed | Found |
| --- | --- | --- |
| 7 | Priority drops zero-provider counties | It does not drop them. The defect was mixing up null and 0 |
| 27 | 31 counties move more than 3% at 2019-2020 | 25 (18 down, 7 up), from `data/reference/population_by_county_year.csv` |
| 34 | "state rate (977) and 88 counties exceed" 900 | 90 counties exceed 900, and 88 exceed the state rate of 977.36 |

## Published numbers

Provider tables only. See `provider-table-diff.csv`. Death rate tables and the
population file did not change in this pass.

## Verification

Run on 2026-11-03 against `ade0ce8`, on Windows with Python 3.13 and with the LFS
`.asc` files present.

| Check | Result |
| --- | --- |
| `PIPELINE_REGEN=1 pytest app/backend/tests app/pipeline/tests` | 330 passed, 1 skipped. The regeneration test rebuilds the tables and compares them with the committed ones |
| `npm run typecheck` | Clean |
| `npm test` | 63 of 63 pass |
| `npm run build` | Succeeds, chunk size warning only |
| `npm audit` | **3 high: follow-redirects, undici, vite.** All have `npm audit fix` available, which has not been applied. `follow-redirects` and `undici` do not appear in the built assets, and vite is the build tool |

Checked in a real browser on the built app, with a temporary `var/`:

| # | Observed |
| --- | --- |
| 33 | Choose a cause, click Sangamon: `/county/Sangamon` with data, no "n/a" |
| 22 | Focus holds on a county that is not last in the DOM. Real Tab moves Boone to Ogle, real Enter opens `/county/Ogle` with data |
| 25 | Cause chosen then cleared in flight: no overlay after 800 ms |
| 21 | Provider requests forced to fail: 3 requests in 2.5 s, one per metric, and the error message shows |
| 29 | Alzheimer's 2022: Pulaski and Schuyler at rate 0 use the same fill and border as Cass (15.8) |
| 28 | `County` / `bar` and `County,1999,2030` both refused with 400. `/meta` stays 2008-2022 and Accidents keeps 105 rows |
| 10 | `dupage` is stored as DuPage. PUT with a script string as cause returns 400 |
| 37 | Empty preset name, year 2099, district 42: 422 |
| 13 | `GET /admin/users` created no `users.json` |
| 32 | POST to an unknown path and GET `/api/nope` both return 404 |

The other views were browser-checked once before the merge commit, not again here:
#5, #14, #35, #36.

**Not verified:** nothing has run on Linux, so your environment is the first check
there, especially for the file locking in #20. `pip-audit` has not been run. An
actual export file save has not been exercised. `.gitleaks.toml` has never been
loaded by gitleaks. The #1 draft has not run behind a real proxy.
