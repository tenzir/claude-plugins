#!/usr/bin/env bash

# Detect whether we're in PR mode or batch mode.
# Runs once at startup via PreToolUse hook.
#
# Output format:
#   Mode: PR
#   PR: #123
# or:
#   Mode: Batch

set -euo pipefail

# Check if current branch has an associated pull request
if pr_number=$(gh pr view --json number --jq '.number' 2>/dev/null); then
  echo "Mode: PR"
  echo "PR: #$pr_number"
else
  echo "Mode: Batch"
fi
