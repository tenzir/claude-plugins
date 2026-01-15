#!/usr/bin/env bash
set -euo pipefail

echo "Accepting changelog entry for PR #$PR_NUMBER"

# Verify we have the required data
if [ -z "${ENTRY_CONTENT:-}" ]; then
  echo "Error: No entry content found" >&2
  exit 1
fi

if [ -z "${ENTRY_FILE:-}" ]; then
  echo "Error: No entry file path found" >&2
  exit 1
fi

echo "Entry file: $ENTRY_FILE"

# Create the directory if needed
mkdir -p "$(dirname "$ENTRY_FILE")"

# Write the entry content to the file
echo "$ENTRY_CONTENT" > "$ENTRY_FILE"

echo "Created entry file"

# Configure git
git config user.name "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"

# Extract title from entry for commit message
title=$(echo "$ENTRY_CONTENT" | grep -oP '^title:\s*\K.*' | head -1 || echo "changelog entry")

# Commit the entry
git add "$ENTRY_FILE"
git commit -m "$(cat <<EOF
Add changelog entry for PR #$PR_NUMBER

$title

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"

# Push to the PR branch
git push

# Update the comment to show accepted status
MARKER="<!-- changelog-adder-bot -->"

# Get current comment body
comment_body=$(gh api "repos/{owner}/{repo}/issues/comments/$COMMENT_ID" -q .body)

# Update status to accepted and add notice
new_body=$(echo "$comment_body" | sed 's/<!-- status:pending -->/<!-- status:accepted -->/')
new_body=$(echo "$new_body" | sed 's/^\*\*React to this comment:\*\*.*//')
new_body=$(echo "$new_body" | sed 's/👍 Accept.*😄 Cynical//')

# Append acceptance notice
new_body="${new_body}

✅ **Accepted** by @$REACTOR and committed to this PR."

# Update the comment
gh api "repos/{owner}/{repo}/issues/comments/$COMMENT_ID" -X PATCH -f body="$new_body"

echo "Changelog entry accepted and committed"
