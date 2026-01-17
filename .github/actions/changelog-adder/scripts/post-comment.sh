#!/usr/bin/env bash
#
# Post or update a changelog suggestion comment on a PR.
#
# Required environment variables:
#   PR_NUMBER     - The PR number
#   ENTRY_FILE    - Path to the changelog entry file
#   ENTRY_CONTENT - Raw content of the entry
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MARKER="<!-- changelog-adder-bot -->"

# Check for existing comment to update
comment_url=$(gh pr view "$PR_NUMBER" --json comments --jq ".comments[] | select(.body | contains(\"$MARKER\")) | .url" 2>/dev/null | head -1)
comment_id=${comment_url##*-}

# Build the comment using shared script
"$SCRIPT_DIR/../../../scripts/build-changelog-comment.sh" > /tmp/pr-comment.md

# Post or update
if [ -n "$comment_id" ]; then
  echo "Updating existing comment $comment_id"
  gh api "repos/{owner}/{repo}/issues/comments/$comment_id" -X PATCH -F body=@/tmp/pr-comment.md
else
  echo "Creating new comment"
  gh pr comment "$PR_NUMBER" --body-file /tmp/pr-comment.md
fi
