"""
Run the IDPH data pipeline end-to-end.

Usage:
  python run_pipeline.py            # full pipeline (deaths + HRSA)
  python run_pipeline.py --deaths   # deaths only (stages 1-3)
  python run_pipeline.py --hrsa     # HRSA provider metrics only

Stages:
  1. deaths_pipeline   pdfs/ → death_rate_tables/  (extract, rate-compute, write)
  2. clean_death_rates death_rate_tables/ (in-place typo fix + validation)
  3. process_hrsa      hrsa_raw/ → provider_tables/
"""

import sys
import time
import traceback


def run_stage(label: str, fn) -> float:
    print(f"\n{'=' * 50}")
    print(f"  {label}")
    print(f"{'=' * 50}")
    start = time.time()
    try:
        fn()
    except SystemExit as e:
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
    run_hrsa   = "--deaths" not in args

    import deaths_pipeline
    import clean_death_rates
    import process_hrsa

    stages = []
    if run_deaths:
        stages += [
            ("deaths_pipeline   PDFs → rate tables", deaths_pipeline.main),
            ("clean_death_rates  rate tables (in-place)", clean_death_rates.main),
        ]
    if run_hrsa:
        stages.append(("process_hrsa       hrsa_raw → provider tables", process_hrsa.main))

    total = sum(run_stage(label, fn) for label, fn in stages)

    print(f"\n{'=' * 50}")
    print(f"  Pipeline complete in {total:.1f}s")
    print(f"{'=' * 50}")


if __name__ == "__main__":
    main()
