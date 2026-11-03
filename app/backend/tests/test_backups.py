"""
Dataset backup regression tests (NCSA #23).

Backup names had one-second resolution and were opened with "wb", so two writes
in the same second kept one file holding the first upload, and the version from
before it was gone. Nothing removed old backups either, so every upload of up to
100 MB stayed on disk for good.

These call _backup_dataset directly, against temp directories, so they never
touch the real tables or var/.

Run: python -m pytest app/backend/tests -q
"""

import os
import sys
from datetime import datetime as real_datetime, timedelta, timezone

import pytest

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import main  # noqa: E402

TABLE = "Accidents_death_rates_by_county_year"
OTHER = "Septicemia_death_rates_by_county_year"


class _Clock:
    """Stands in for main.datetime so a test decides what time it is."""

    def __init__(self, start):
        self.current = start
        self.step = timedelta(0)

    def now(self, tz=None):
        moment = self.current
        self.current += self.step
        return moment

    def __getattr__(self, name):
        return getattr(real_datetime, name)


@pytest.fixture
def clock(monkeypatch):
    fake = _Clock(real_datetime(2026, 11, 2, 17, 55, 15, tzinfo=timezone.utc))
    monkeypatch.setattr(main, "datetime", fake)
    return fake


@pytest.fixture
def backups(tmp_path, monkeypatch):
    target = tmp_path / "dataset_backups"
    monkeypatch.setattr(main, "DATASET_BACKUP_DIR", str(target))
    return target


def _table(tmp_path, name, content):
    path = tmp_path / f"{name}.csv"
    path.write_text(content)
    return str(path)


def _stored(backups, table=TABLE):
    return sorted(p for p in backups.iterdir() if p.name.startswith(f"{table}."))


def test_two_writes_in_the_same_instant_make_two_backups(tmp_path, backups, clock):
    """The NCSA repro: same second, and now even the same microsecond."""
    path = _table(tmp_path, TABLE, "original")
    first = main._backup_dataset(path)
    with open(path, "w") as f:
        f.write("first upload")
    second = main._backup_dataset(path)

    assert first != second
    assert (backups / first).read_text() == "original"
    assert (backups / second).read_text() == "first upload"


def test_a_backup_never_replaces_an_existing_file(tmp_path, backups, clock, monkeypatch):
    """Even if the name repeats, the existing backup survives and the write stops."""
    path = _table(tmp_path, TABLE, "new")

    class _SameId:
        hex = "abcdef0123456789"

    monkeypatch.setattr(main.uuid, "uuid4", lambda: _SameId)
    name = main._backup_dataset(path)
    (backups / name).write_text("original")
    with pytest.raises(FileExistsError):
        main._backup_dataset(path)
    assert (backups / name).read_text() == "original"


def test_fifteen_writes_leave_the_original_and_the_newest_ten(tmp_path, backups, clock):
    clock.step = timedelta(seconds=1)
    path = _table(tmp_path, TABLE, "original")
    names = []
    for i in range(15):
        names.append(main._backup_dataset(path))
        with open(path, "w") as f:
            f.write(f"upload {i}")

    kept = {p.name for p in _stored(backups)}
    assert len(kept) == main.DATASET_BACKUP_KEEP + 1 == 11
    assert kept == {names[0], *names[-10:]}
    assert (backups / names[0]).read_text() == "original"


def test_retention_counts_each_cause_on_its_own(tmp_path, backups, clock):
    clock.step = timedelta(seconds=1)
    accidents = _table(tmp_path, TABLE, "a")
    septicemia = _table(tmp_path, OTHER, "s")
    other = [main._backup_dataset(septicemia) for _ in range(3)]
    for _ in range(15):
        main._backup_dataset(accidents)

    assert len(_stored(backups, TABLE)) == 11
    assert {p.name for p in _stored(backups, OTHER)} == set(other)


def test_order_comes_from_the_name_not_the_file_time(tmp_path, backups, clock):
    """A restored volume can reset every mtime, which must not change what is kept."""
    clock.step = timedelta(seconds=1)
    path = _table(tmp_path, TABLE, "x")
    names = [main._backup_dataset(path) for _ in range(11)]
    for i, name in enumerate(names):
        stamp = 2_000_000_000 - i * 1000  # newest name has the oldest mtime
        os.utime(backups / name, (stamp, stamp))

    main._backup_dataset(path)
    assert not (backups / names[1]).exists()
    assert (backups / names[0]).exists()
    assert (backups / names[2]).exists()


def test_older_second_resolution_names_still_count_as_oldest(tmp_path, backups, clock):
    backups.mkdir()
    legacy = f"{TABLE}.20240101T000000Z.csv"
    same_second = f"{TABLE}.20261102T175515Z.csv"  # same second as the first new name
    (backups / legacy).write_text("original")
    (backups / same_second).write_text("old format")
    clock.step = timedelta(seconds=1)
    path = _table(tmp_path, TABLE, "x")
    names = [main._backup_dataset(path) for _ in range(10)]

    kept = {p.name for p in _stored(backups)}
    assert legacy in kept
    assert same_second not in kept  # the eleventh newest, once ten new ones exist
    assert kept == {legacy, *names}


def test_a_file_with_an_unknown_name_is_left_alone(tmp_path, backups, clock):
    backups.mkdir()
    stray = backups / f"{TABLE}.keep-me.csv"
    stray.write_text("hand placed")
    clock.step = timedelta(seconds=1)
    path = _table(tmp_path, TABLE, "x")
    for _ in range(15):
        main._backup_dataset(path)

    assert stray.read_text() == "hand placed"
    assert len(_stored(backups)) == 12


def test_a_failed_prune_does_not_fail_the_backup(tmp_path, backups, clock, monkeypatch):
    clock.step = timedelta(seconds=1)
    path = _table(tmp_path, TABLE, "x")
    for _ in range(11):
        main._backup_dataset(path)

    def _locked(_path):
        raise PermissionError("in use")

    monkeypatch.setattr(main.os, "remove", _locked)
    assert main._backup_dataset(path) is not None
    assert len(_stored(backups)) == 12


def test_missing_table_makes_no_backup(tmp_path, backups):
    assert main._backup_dataset(str(tmp_path / "absent.csv")) is None
    assert not backups.exists()
