#!/usr/bin/env bash
set -uo pipefail

MARKER="<!-- changelog-adder-bot -->"

# Check for existing comment to update instead of duplicate
comment_url=$(gh pr view "$PR_NUMBER" --json comments --jq ".comments[] | select(.body | contains(\"$MARKER\")) | .url" 2>/dev/null | head -1)
comment_id=${comment_url##*-} # Extract numeric ID from URL (e.g., #issuecomment-123 -> 123)

# Parse YAML frontmatter using sed (returns empty string on no match)
frontmatter=$(awk '/^---$/{if(++n==2)exit}n==1' "$ENTRY_FILE")
title=$(echo "$frontmatter" | sed -n 's/^title: *//p')
type=$(echo "$frontmatter" | sed -n 's/^type: *//p')
pr=$(echo "$frontmatter" | sed -n 's/^pr: *//p')
created=$(echo "$frontmatter" | sed -n 's/^created: *//p')
authors=$(echo "$frontmatter" | awk '/^authors:/{f=1;next} f&&/^[^ ]/{exit} f' | sed -n 's/^  - /@/p' | paste -sd', ' -)

# Extract body (everything after second ---)
body=$(awk '/^---$/{if(++n==2){getline;found=1}}found' "$ENTRY_FILE")

# Map type to badge color
case "$type" in
  feature) badge_color="238636" ;;
  bugfix) badge_color="d97706" ;;
  breaking) badge_color="dc2626" ;;
  change) badge_color="6366f1" ;;
  *) badge_color="6b7280" ;;
esac

# Build status badge based on mode
if [ "$MODE" = "existing" ]; then
  status_badge="<kbd>✓ exists</kbd>"
else
  status_badge="<kbd>✓ added</kbd>"
fi

# Extract just the date part from ISO timestamp
created_date=${created%%T*}

cat >/tmp/pr-comment.md <<EOF
${MARKER}

## 📋 Changelog Entry &nbsp;${status_badge}

**${title}**

<img src="https://img.shields.io/badge/${type}-${badge_color}?style=flat-square" alt="${type}" align="absmiddle"> · #${pr:-$PR_NUMBER} · ${authors} · ${created_date}

---

${body}

---

<details>
<summary>Sync your local branch</summary>

**Git:**
\`\`\`bash
git fetch origin && git reset --hard origin/${BRANCH}
\`\`\`

**Jujutsu:**
\`\`\`bash
jj git fetch && jj bookmark set ${BRANCH} -B
\`\`\`
</details>
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
