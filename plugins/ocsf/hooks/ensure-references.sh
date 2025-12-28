#!/usr/bin/env bash
# Ensures OCSF reference documentation is generated.
# Runs on session start; skips if references already exist.

set -euo pipefail

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
REFERENCES_DIR="$PLUGIN_ROOT/skills/understanding-ocsf/references"
GENERATOR="$PLUGIN_ROOT/scripts/generate-references.py"

# Check if references exist (look for index.md as indicator)
if [[ -f "$REFERENCES_DIR/index.md" ]]; then
  exit 0
fi

# Find a Python runner (prefer uv, fall back to python3/python)
if command -v uv &>/dev/null; then
  PYTHON_CMD="uv run"
elif command -v python3 &>/dev/null; then
  PYTHON_CMD="python3"
elif command -v python &>/dev/null; then
  PYTHON_CMD="python"
else
  echo "Warning: No Python interpreter found, cannot generate OCSF references." >&2
  exit 0
fi

echo "Generating OCSF reference documentation..." >&2
$PYTHON_CMD "$GENERATOR" --all >&2
echo "OCSF references generated successfully." >&2
