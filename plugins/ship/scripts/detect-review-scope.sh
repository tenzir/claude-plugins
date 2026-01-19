#!/usr/bin/env bash

# Detect which files to review based on git state.
# Priority: staged > unstaged > branch changes
#
# Output format:
#   Scope: <description>
#   Diff: <git diff command base>
#   <file list, one per line>

set -euo pipefail

staged=$(git diff --cached --name-only)
if [[ -n "$staged" ]]; then
  echo "Scope: staged changes"
  echo "Diff: git diff --cached --"
  echo "$staged"
  exit 0
fi

unstaged=$(git diff --name-only)
untracked=$(git ls-files --others --exclude-standard)
if [[ -n "$unstaged" || -n "$untracked" ]]; then
  echo "Scope: unstaged changes"
  echo "Diff: git diff --"
  { echo "$unstaged"; echo "$untracked"; } | grep -v '^$' | sort -u
  exit 0
fi

# Fall back to branch changes since merge-base
base=$(git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null || echo "HEAD~10")
branch_changes=$(git diff --name-only "$base"...HEAD)
if [[ -n "$branch_changes" ]]; then
  echo "Scope: branch changes (since $base)"
  echo "Diff: git diff '${base}'...HEAD --"
  echo "$branch_changes"
  exit 0
fi

echo "Scope: no changes detected"
exit 1
