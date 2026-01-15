#!/usr/bin/env bash
set -euo pipefail

echo "Updating changelog comment for PR #$PR_NUMBER after $ACTION"

MARKER="<!-- changelog-adder-bot -->"

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

# Encode entry content and file path as base64
entry_content_b64=$(echo "$entry_content" | base64 -w0 2>/dev/null || echo "$entry_content" | base64)
entry_file_b64=$(echo "$new_file" | base64 -w0 2>/dev/null || echo "$new_file" | base64)

# Render the entry using tenzir-ship for nice display
module_root="${new_file%/changelog/*}"
entry_id=$(basename "$new_file" .md)
rendered=$(uvx tenzir-ship --root "$module_root" show "$entry_id" --markdown --explicit-links 2>/dev/null || echo "$entry_content")

# Remove the "## 🔧 Changes" header if present
rendered=$(echo "$rendered" | sed '1{/^## /d;}' | sed '1{/^$/d;}')

# Get current comment to extract processed reactions
current_comment=$(gh api "repos/{owner}/{repo}/issues/comments/$COMMENT_ID" -q .body)
processed_match=$(echo "$current_comment" | grep -oP '<!-- processed-reactions:\K[^-]*' || true)

# Add current reactor to processed list
if [ -n "$processed_match" ]; then
  processed="${processed_match},$ACTION:$REACTOR"
else
  processed="$ACTION:$REACTOR"
fi

# Determine action label for history
case "$ACTION" in
  regenerate) action_label="🔄 Regenerated" ;;
  more-technical) action_label="🚀 Made more technical" ;;
  less-technical) action_label="👀 Simplified" ;;
  more-cynical) action_label="😄 Added wit" ;;
  *) action_label="Updated" ;;
esac

# Build the updated comment
cat > /tmp/pr-comment.md << EOF
${MARKER}
<!-- entry-content:base64:${entry_content_b64} -->
<!-- entry-file:base64:${entry_file_b64} -->
<!-- status:pending -->
<!-- processed-reactions:${processed} -->

## 📋 Changelog Suggestion

${rendered}

---

**React to this comment:**
👍 Accept | 👎 Reject | 😕 Regenerate | 🚀 Technical | 👀 Simpler | 😄 Cynical

<sub>${action_label} by @${REACTOR}</sub>
EOF

# Update the comment
gh api "repos/{owner}/{repo}/issues/comments/$COMMENT_ID" -X PATCH -F body=@/tmp/pr-comment.md

# Clean up the generated file (don't commit it yet)
rm -f "$new_file"
git checkout -- . 2>/dev/null || true

echo "Comment updated after $ACTION"
