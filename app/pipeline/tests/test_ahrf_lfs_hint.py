"""
Without git-lfs the AHRF .asc files are small pointer files, which parse to zero
counties. The failure has to name LFS as the cause, not only the county count.

Run: python -m pytest app/pipeline/tests -q
"""

import os
import sys

import pytest

HERE = os.path.dirname(os.path.abspath(__file__))
PIPELINE = os.path.dirname(HERE)
REPO = os.path.dirname(os.path.dirname(PIPELINE))
sys.path.insert(0, PIPELINE)

import process_hrsa as hrsa  # noqa: E402

POINTER = (
    "version https://git-lfs.github.com/spec/v1\n"
    "oid sha256:7cf851d4f5323f7fa4d48a51aa18b0e964d4e636bbd7859c743254c4f31d1a4a\n"
    "size 103074225\n"
)
COMMITTED_ASC = os.path.join(REPO, "data", "source", "ahrf", "09-10", "ahrf2009.asc")


def test_pointer_file_gets_the_lfs_hint(tmp_path):
    asc = tmp_path / "ahrf2009.asc"
    asc.write_text(POINTER)
    with pytest.raises(SystemExit) as exc:
        hrsa.check_county_count("09-10", str(asc), 0)
    message = str(exc.value)
    assert "got 0" in message
    assert "git lfs pull" in message


def test_committed_pointer_gets_the_lfs_hint():
    with open(COMMITTED_ASC, "rb") as f:
        if not f.read(100).startswith(b"version https://git-lfs"):
            pytest.skip("real AHRF data is present in this checkout")
    with pytest.raises(SystemExit) as exc:
        hrsa.check_county_count("09-10", COMMITTED_ASC, 0)
    assert "git lfs pull" in str(exc.value)


def test_real_data_with_a_wrong_count_gets_no_lfs_hint(tmp_path):
    asc = tmp_path / "ahrf2009.asc"
    asc.write_text("17001 not a pointer file\n")
    with pytest.raises(SystemExit) as exc:
        hrsa.check_county_count("09-10", str(asc), 5)
    assert "got 5" in str(exc.value)
    assert "lfs" not in str(exc.value).lower()


def test_correct_count_passes(tmp_path):
    asc = tmp_path / "ahrf2009.asc"
    asc.write_text("17001 not a pointer file\n")
    hrsa.check_county_count("09-10", str(asc), hrsa.EXPECTED_COUNTY_COUNT)
