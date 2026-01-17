#!/usr/bin/env bash
#
# Build a changelog suggestion comment body.
#
# Required environment variables:
#   ENTRY_FILE    - Path to the changelog entry file
#   ENTRY_CONTENT - Raw content of the entry (for base64 embedding)
#
# Optional environment variables:
#   STATUS            - Comment status (default: pending)
#   PROCESSED         - Processed reactions list
#   FOOTER            - Custom footer (default: reaction guide)
#
# Outputs the complete comment body to stdout.

set -euo pipefail

MARKER="<!-- changelog-adder-bot -->"

# Validate required inputs
if [ -z "${ENTRY_FILE:-}" ]; then
  echo "Error: ENTRY_FILE is required" >&2
  exit 1
fi

if [ -z "${ENTRY_CONTENT:-}" ]; then
  echo "Error: ENTRY_CONTENT is required" >&2
  exit 1
fi

# Defaults
STATUS="${STATUS:-pending}"
PROCESSED="${PROCESSED:-}"
FOOTER="${FOOTER:-<sub>👍 Accept · 👎 Reject · 😕 Regenerate · 🚀 Technical · 👀 Simpler · 😄 Cynical</sub>}"

# Encode content and file path as base64
entry_content_b64=$(echo "$ENTRY_CONTENT" | base64 -w0 2>/dev/null || echo "$ENTRY_CONTENT" | base64)
entry_file_b64=$(echo "$ENTRY_FILE" | base64 -w0 2>/dev/null || echo "$ENTRY_FILE" | base64)

# Render the entry using tenzir-ship
module_root="${ENTRY_FILE%/changelog/*}"
entry_id=$(basename "$ENTRY_FILE" .md)
rendered=$(uvx tenzir-ship --root "$module_root" show "$entry_id" --markdown --explicit-links)

if [ -z "$rendered" ]; then
  echo "Error: Failed to render entry with tenzir-ship" >&2
  exit 1
fi

# Output the comment
cat << EOF
${MARKER}
<!-- entry-content:base64:${entry_content_b64} -->
<!-- entry-file:base64:${entry_file_b64} -->
<!-- status:${STATUS} -->
<!-- processed-reactions:${PROCESSED} -->

${rendered}

---

${FOOTER}
EOF
