"""
Secret hygiene regression tests (review issue #8).

.gitignore listed .env but not .env.local or .env.production, and nothing
scanned commits, which is how a signing secret and a user store reached history
in the first place. These pin the ignore rules and the gitleaks rules. They do
not need the gitleaks binary, so they check the rule patterns only.

Fixture strings are split with + so a full-tree scan does not flag this file.

Run: python -m pytest app/backend/tests -q
"""

import re
import shutil
import subprocess
import tomllib
from pathlib import Path

import pytest

REPO_ROOT = Path(__file__).resolve().parents[3]

MUST_BE_IGNORED = [
    ".env",
    ".env.local",
    ".env.production",
    ".env.production.local",
    "app/frontend/.env.local",
    "app/frontend/.env.production",
    "app/frontend/.env.development.local",
    "app/backend/.env",
    "users.json",
    "app/backend/users.json",
    "app/backend/audit.json",
    "app/backend/audit.jsonl",
    "app/backend/var/users.json",
]

MUST_STAY_TRACKABLE = [
    "app/frontend/.env.development",
    "app/backend/.env.example",
    "app/frontend/.env.example",
    "app/backend/thresholds.json",
]

FORBIDDEN_TRACKED = re.compile(r"(^|/)(users\.json|audit\.jsonl?|\.env(\.local|\.production)?)$")


def _git(*args):
    return subprocess.run(
        ["git", *args], cwd=REPO_ROOT, capture_output=True, text=True, check=False
    )


@pytest.fixture(scope="module")
def require_git():
    if shutil.which("git") is None or _git("rev-parse", "--git-dir").returncode != 0:
        pytest.skip("needs a git checkout")


@pytest.fixture(scope="module")
def rules():
    config = tomllib.loads((REPO_ROOT / ".gitleaks.toml").read_text(encoding="utf-8"))
    assert config["extend"]["useDefault"] is True
    return {rule["id"]: rule for rule in config["rules"]}


@pytest.mark.parametrize("path", MUST_BE_IGNORED)
def test_sensitive_paths_are_ignored(require_git, path):
    # --no-index so a path that is already tracked cannot hide a missing rule.
    assert _git("check-ignore", "-q", "--no-index", path).returncode == 0


@pytest.mark.parametrize("path", MUST_STAY_TRACKABLE)
def test_safe_paths_stay_trackable(require_git, path):
    assert _git("check-ignore", "-q", "--no-index", path).returncode == 1


def test_no_sensitive_file_is_tracked(require_git):
    tracked = _git("ls-files").stdout.splitlines()
    assert [p for p in tracked if FORBIDDEN_TRACKED.search(p)] == []


@pytest.mark.parametrize(
    "rule_id, text",
    [
        ("idph-jwt-default-fallback", 'os.getenv("JWT_' + 'SECRET", "' + 'x")'),
        ("idph-jwt-default-fallback", "os.environ.get('JWT_" + "SECRET', '" + "x')"),
        ("idph-jwt-literal", 'JWT_' + 'SECRET = "' + 'x"'),
        ("idph-password-literal", '"password_' + 'hash": "' + 'x"'),
    ],
)
def test_content_rules_catch_the_historical_shapes(rules, rule_id, text):
    assert re.search(rules[rule_id]["regex"], text)


@pytest.mark.parametrize(
    "rule_id, text",
    [
        ("idph-jwt-default-fallback", 'os.environ["JWT_' + 'SECRET"]'),
        ("idph-jwt-default-fallback", 'os.getenv("JWT_' + 'SECRET")'),
        ("idph-jwt-literal", "JWT_" + "SECRET = os.environ['X']"),
        ("idph-password-literal", '"password_' + 'hash": ""'),
    ],
)
def test_content_rules_allow_the_safe_shapes(rules, rule_id, text):
    assert not re.search(rules[rule_id]["regex"], text)


@pytest.mark.parametrize(
    "rule_id, path, expected",
    [
        ("idph-user-store-file", "processin/backend/users.json", True),
        ("idph-user-store-file", "users.json", True),
        ("idph-user-store-file", "app/backend/superusers.json", False),
        ("idph-audit-log-file", "processin/backend/audit.json", True),
        ("idph-audit-log-file", "app/backend/var/audit.jsonl", True),
        ("idph-env-file", "app/frontend/.env.production", True),
        ("idph-env-file", ".env.local", True),
        ("idph-env-file", "app/frontend/.env.development.local", True),
        ("idph-env-file", "app/frontend/.env.development", False),
        ("idph-env-file", "app/backend/.env.example", False),
    ],
)
def test_path_rules(rules, rule_id, path, expected):
    assert bool(re.search(rules[rule_id]["path"], path)) is expected
