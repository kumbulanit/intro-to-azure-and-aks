#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

PYTHON_BIN=""
if command -v python3 >/dev/null 2>&1; then
  PYTHON_BIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYTHON_BIN="python"
fi

if [[ -n "$PYTHON_BIN" ]]; then
  "$PYTHON_BIN" - <<'PY'
from pathlib import Path
import re, subprocess, tempfile, sys

files = [Path('README.md')] + sorted(Path('resource groups, services and configuring them using the portal, CloudShell and Azure CLI').glob('*.md'))
failures = 0

for f in files:
    text = f.read_text(encoding='utf-8')
    blocks = re.findall(r'```bash\n(.*?)```', text, re.S)
    for i, block in enumerate(blocks, 1):
        with tempfile.NamedTemporaryFile('w', suffix='.sh', delete=False) as tf:
            tf.write(block + '\n')
            name = tf.name
        p = subprocess.run(['bash', '-n', name], capture_output=True, text=True)
        Path(name).unlink(missing_ok=True)
        if p.returncode != 0:
            failures += 1
            print(f'[FAIL] {f} block {i}')
            print(p.stderr.strip())

if failures:
    print(f'[RESULT] Validation failed with {failures} syntax error(s).')
    sys.exit(1)

print('[RESULT] Markdown bash snippets are syntactically valid.')
PY
else
  echo "[WARN] Python 3 not found. Skipping Markdown snippet syntax validation."
fi

if command -v az >/dev/null 2>&1; then
  echo "[INFO] Azure CLI found."
  if az account show >/dev/null 2>&1; then
    sub="$(az account show --query name -o tsv 2>/dev/null || true)"
    echo "[INFO] Azure login detected (subscription: ${sub:-unknown})"
  else
    echo "[WARN] Azure CLI installed, but no active login. Run: az login"
  fi
else
  echo "[WARN] Azure CLI not found on this machine. Install before running lab commands."
fi
