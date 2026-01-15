#!/usr/bin/env bash
set -uo pipefail

MARKER="<!-- changelog-adder-bot -->"

# Check if entry content exists
if [ -z "${ENTRY_CONTENT:-}" ]; then
  echo "No entry content provided"
  exit 0
fi

# Encode entry content as base64 for embedding (preserves exact format)
entry_data_b64=$(echo "$ENTRY_CONTENT" | base64 -w0 2>/dev/null || echo "$ENTRY_CONTENT" | base64)

# Also encode the target file path
entry_file_b64=$(echo "$ENTRY_FILE" | base64 -w0 2>/dev/null || echo "$ENTRY_FILE" | base64)

# Check for existing comment to update instead of duplicate
comment_url=$(gh pr view "$PR_NUMBER" --json comments --jq ".comments[] | select(.body | contains(\"$MARKER\")) | .url" 2>/dev/null | head -1)
comment_id=${comment_url##*-}

# Render the entry using tenzir-ship for nice display
module_root="${ENTRY_FILE%/changelog/*}"
entry_id=$(basename "$ENTRY_FILE" .md)
rendered=$(uvx tenzir-ship --root "$module_root" show "$entry_id" --markdown --explicit-links 2>/dev/null || echo "$ENTRY_CONTENT")

# Remove the "## 🔧 Changes" header if present
rendered=$(echo "$rendered" | sed '1{/^## /d;}' | sed '1{/^$/d;}')

# Build the comment
cat > /tmp/pr-comment.md << EOF
${MARKER}
<!-- entry-content:base64:${entry_data_b64} -->
<!-- entry-file:base64:${entry_file_b64} -->
<!-- status:pending -->
<!-- processed-reactions: -->

## 📋 Changelog Suggestion

${rendered}

---

**React to this comment:**
👍 Accept | 👎 Reject | 😕 Regenerate | 🚀 Technical | 👀 Simpler | 😄 Cynical
EOF

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
