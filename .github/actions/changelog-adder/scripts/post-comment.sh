#!/usr/bin/env bash
set -uo pipefail

MARKER="<!-- changelog-adder-bot -->"

# Check for existing comment to avoid duplicates
existing=$(gh pr view "$PR_NUMBER" --json comments --jq ".comments[].body | select(contains(\"$MARKER\"))" 2>/dev/null)
if [ -n "$existing" ]; then
  echo "Comment already exists, skipping"
  exit 0
fi

# Parse YAML frontmatter using sed (returns empty string on no match)
frontmatter=$(awk '/^---$/{if(++n==2)exit}n==1' "$ENTRY_FILE")
title=$(echo "$frontmatter" | sed -n 's/^title: *//p')
type=$(echo "$frontmatter" | sed -n 's/^type: *//p')
pr=$(echo "$frontmatter" | sed -n 's/^pr: *//p')
created=$(echo "$frontmatter" | sed -n 's/^created: *//p')
authors=$(echo "$frontmatter" | awk '/^authors:/,/^[^ ]/' | sed -n 's/^  - //p' | paste -sd, -)

# Extract body (everything after second ---)
body=$(awk '/^---$/{if(++n==2){getline;found=1}}found' "$ENTRY_FILE")

# Build comment based on mode
if [ "$MODE" = "existing" ]; then
  callout_type="NOTE"
  callout_msg="Found an existing changelog entry for this PR."
else
  callout_type="TIP"
  callout_msg="@${PR_AUTHOR} Added a changelog entry for this PR."
fi

cat >/tmp/pr-comment.md <<EOF
${MARKER}
> [!${callout_type}]
> ${callout_msg}

| | |
|---|---|
| 📝 Title | ${title} |
| 🏷️ Type | \`${type}\` |
| 🔗 PR | #${pr:-$PR_NUMBER} |
| 👥 Authors | ${authors} |
| 📅 Created | ${created} |

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

if ! gh pr comment "$PR_NUMBER" --body-file /tmp/pr-comment.md; then
  echo "Failed to post PR comment" >&2
  exit 1
fi
