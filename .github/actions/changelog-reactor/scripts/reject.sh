#!/usr/bin/env bash
set -euo pipefail

echo "Rejecting changelog entry for PR #$PR_NUMBER"

MARKER="<!-- changelog-adder-bot -->"

# Get current comment body
comment_body=$(gh api "repos/{owner}/{repo}/issues/comments/$COMMENT_ID" -q .body)

# Update status to rejected
new_body=$(echo "$comment_body" | sed 's/<!-- status:pending -->/<!-- status:rejected -->/')

# Replace the suggestion content with rejection notice
# Keep the marker and metadata, but replace the visible content
cat > /tmp/rejection-comment.md << EOF
${MARKER}
<!-- status:rejected -->
<!-- processed-reactions:$REACTOR -->

## 📋 Changelog Entry

❌ **No changelog needed** for this PR.

Rejected by @$REACTOR.
EOF

# Update the comment
gh api "repos/{owner}/{repo}/issues/comments/$COMMENT_ID" -X PATCH -F body=@/tmp/rejection-comment.md

echo "Changelog suggestion rejected"
