#!/usr/bin/env bash
set -uo pipefail

MARKER="<!-- changelog-adder-bot -->"

# Check for existing comment to update instead of duplicate
comment_url=$(gh pr view "$PR_NUMBER" --json comments --jq ".comments[] | select(.body | contains(\"$MARKER\")) | .url" 2>/dev/null | head -1)
comment_id=${comment_url##*-}

# Build status badge based on mode
if [ "$MODE" = "existing" ]; then
  status_badge="<kbd>✓ exists</kbd>"
else
  status_badge="<kbd>✓ added</kbd>"
fi

# Count entries
entry_count=$(echo "$ENTRY_FILES" | grep -c .)
if [ "$entry_count" -eq 1 ]; then
  entry_word="Entry"
else
  entry_word="Entries"
fi

# Start building comment
cat >/tmp/pr-comment.md <<EOF
${MARKER}

## 📋 Changelog ${entry_word} &nbsp;${status_badge}

EOF

# Process each entry file
echo "$ENTRY_FILES" | while read -r entry_file; do
  [ -z "$entry_file" ] && continue

  # Derive module root and entry ID from file path
  module_root="${entry_file%/changelog/*}"
  entry_id="$(basename "$entry_file" .md)"

  # Get rendered markdown from tenzir-ship
  entry_md=$(uvx tenzir-ship --root "$module_root" show "$entry_id" --markdown --explicit-links 2>/dev/null)

  if [ -n "$entry_md" ]; then
    # Remove the "## 🔧 Changes" header and following blank line
    entry_md=$(echo "$entry_md" | sed '1{/^## /d;}' | sed '1{/^$/d;}')
    echo "$entry_md" >> /tmp/pr-comment.md
    echo "" >> /tmp/pr-comment.md
  else
    # Fallback: just show the entry file path if tenzir-ship fails
    echo "- \`$entry_file\`" >> /tmp/pr-comment.md
  fi
done

# Update existing comment or create new one
if [ -n "$comment_id" ]; then
  echo "Updating existing comment $comment_id"
  if ! gh api "repos/{owner}/{repo}/issues/comments/$comment_id" -X PATCH -F body=@/tmp/pr-comment.md; then
    echo "Failed to update PR comment" >&2
    exit 1
  fi
else
  echo "Creating new comment"
  if ! gh pr comment "$PR_NUMBER" --body-file /tmp/pr-comment.md; then
    echo "Failed to post PR comment" >&2
    exit 1
  fi
fi
