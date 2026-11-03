"""
Keeps the backend tests off the real runtime state.

storage.py reads IDPH_VAR_DIR at import, so this has to run before any test
module imports main, auth or storage. Conftest files load first.
"""

import atexit
import os
import shutil
import tempfile

_VAR_DIR = tempfile.mkdtemp(prefix="idph-var-")
os.environ["IDPH_VAR_DIR"] = _VAR_DIR
atexit.register(shutil.rmtree, _VAR_DIR, ignore_errors=True)
