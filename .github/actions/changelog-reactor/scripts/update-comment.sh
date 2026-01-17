#!/usr/bin/env bash
#
# Update a changelog suggestion comment after a reaction action.
#
# Required environment variables:
#   PR_NUMBER  - The PR number
#   COMMENT_ID - The comment ID to update
#   ACTION     - The action that was performed (regenerate, more-technical, etc.)
#   REACTOR    - The user who reacted
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Updating changelog comment for PR #$PR_NUMBER after $ACTION"

# Detect the new entry file created by /ship:add
find . -path "*/changelog/unreleased/*.md" -type f 2>/dev/null | sort > /tmp/changelog-after.txt
new_file=$(comm -13 /tmp/changelog-before.txt /tmp/changelog-after.txt | head -1)

if [ -z "$new_file" ]; then
  echo "Error: No new changelog entry created" >&2
  exit 1
fi

echo "New entry file: $new_file"

# Read the new entry content
entry_content=$(cat "$new_file")

# Get current comment to extract processed reactions
current_comment=$(gh api "repos/{owner}/{repo}/issues/comments/$COMMENT_ID" -q .body)
processed_match=$(echo "$current_comment" | grep -oP '<!-- processed-reactions:\K[^-]*' || true)

# Add current reactor to processed list
if [ -n "$processed_match" ]; then
  processed="${processed_match},$ACTION:$REACTOR"
else
  processed="$ACTION:$REACTOR"
fi

# Determine action label for footer
case "$ACTION" in
  regenerate) action_label="Regenerated" ;;
  more-technical) action_label="Made more technical" ;;
  less-technical) action_label="Simplified" ;;
  more-cynical) action_label="Added wit" ;;
  *) action_label="Updated" ;;
esac

# Build the comment using shared script
export ENTRY_FILE="$new_file"
export ENTRY_CONTENT="$entry_content"
export STATUS="pending"
export PROCESSED="$processed"
export FOOTER="<sub>👍 Accept · 👎 Reject · 😕 Regenerate · 🚀 Technical · 👀 Simpler · 😄 Cynical · ${action_label} by @${REACTOR}</sub>"

"$SCRIPT_DIR/../../../scripts/build-changelog-comment.sh" > /tmp/pr-comment.md

# Update the comment
gh api "repos/{owner}/{repo}/issues/comments/$COMMENT_ID" -X PATCH -F body=@/tmp/pr-comment.md

# Clean up the generated file (don't commit it yet)
rm -f "$new_file"
git checkout -- . 2>/dev/null || true

echo "Comment updated after $ACTION"
