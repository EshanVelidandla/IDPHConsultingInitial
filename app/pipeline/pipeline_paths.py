"""
Where the pipeline writes.

By default every stage writes to its published location in the repo. Setting
PIPELINE_OUTPUT_ROOT sends those files to the same relative paths under another
folder, and later stages read their inputs back from there, so a full rebuild
can be compared with the committed tables without overwriting them. Sources
under data/source/ are always read from the repo.
"""

import os

REPO = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", ".."))


def output_path(*parts: str) -> str:
    return os.path.join(os.environ.get("PIPELINE_OUTPUT_ROOT") or REPO, *parts)
