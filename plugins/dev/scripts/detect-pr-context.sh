#!/usr/bin/env bash

# Detect whether we're in PR mode or batch mode.
# Runs once at startup via PreToolUse hook.
#
# Output format (JSON for reliable parsing):
#   {"mode": "PR", "pr": "123"}
# or:
#   {"mode": "Batch"}

set -euo pipefail

# Check if current branch has an associated pull request
if pr_number=$(gh pr view --json number --jq '.number' 2>/dev/null); then
  jq -n --arg mode "PR" --arg pr "$pr_number" \
    '{mode: $mode, pr: $pr}'
else
  jq -n --arg mode "Batch" \
    '{mode: $mode}'
fi
