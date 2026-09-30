"""
Run the IDPH data pipeline end-to-end.

Usage:
  python run_pipeline.py            # everything
  python run_pipeline.py --deaths   # population + deaths only
  python run_pipeline.py --hrsa     # population + provider metrics only

Stages:
  1. build_population     data/source/census/  -> data/reference/population_by_county_year.csv
  2. deaths_pipeline      data/source/idph_death_reports/ -> death_rate_tables/
  3. validate_death_rates death_rate_tables/ (read-only checks)
  4. process_hrsa         data/source/ahrf/ -> provider_tables/

Stage 1 runs first for both paths because stages 2 and 4 both divide by those
populations. Every stage is a pure function of committed inputs: nothing reads
its own previous output, so two runs from a clean checkout give the same
numbers.
"""

import sys
import time
import traceback


def run_stage(label: str, fn) -> float:
    print(f"\n{'=' * 60}")
    print(f"  {label}")
    print(f"{'=' * 60}")
    start = time.time()
    try:
        fn()
    except SystemExit as e:
        if e.code:
            print(f"\nPIPELINE ABORTED at '{label}': {e}")
            sys.exit(1)
    except Exception:
        print(f"\nPIPELINE ABORTED at '{label}' (unexpected error):")
        traceback.print_exc()
        sys.exit(1)
    elapsed = time.time() - start
    print(f"\n  Completed in {elapsed:.1f}s")
    return elapsed


def main() -> None:
    args = sys.argv[1:]
    run_deaths = "--hrsa" not in args
    run_hrsa = "--deaths" not in args

    import build_population
    import deaths_pipeline
    import validate_death_rates
    import process_hrsa

    stages = [("build_population   Census -> population_by_county_year.csv", build_population.main)]
    if run_deaths:
        stages += [
            ("deaths_pipeline    IDPH PDFs -> death rate tables", deaths_pipeline.main),
            ("validate_death_rates  checks (read-only)", validate_death_rates.main),
        ]
    if run_hrsa:
        stages.append(("process_hrsa       AHRF -> provider tables", process_hrsa.main))

    total = sum(run_stage(label, fn) for label, fn in stages)

    print(f"\n{'=' * 60}")
    print(f"  Pipeline complete in {total:.1f}s")
    print(f"{'=' * 60}")


if __name__ == "__main__":
    main()
