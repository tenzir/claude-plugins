#!/usr/bin/env bash
set -uo pipefail

# Parse YAML frontmatter using sed (returns empty string on no match)
frontmatter=$(awk '/^---$/{if(++n==2)exit}n==1' "$ENTRY_FILE")
title=$(echo "$frontmatter" | sed -n 's/^title: *//p')
type=$(echo "$frontmatter" | sed -n 's/^type: *//p')
pr=$(echo "$frontmatter" | sed -n 's/^pr: *//p')
created=$(echo "$frontmatter" | sed -n 's/^created: *//p')
authors=$(echo "$frontmatter" | awk '/^authors:/,/^[^ ]/' | sed -n 's/^  - //p' | paste -sd, -)

# Extract body (everything after second ---)
body=$(awk '/^---$/{if(++n==2){getline;found=1}}found' "$ENTRY_FILE")

# Build comment
cat >/tmp/pr-comment.md <<EOF
@${PR_AUTHOR} A changelog entry has been added to this PR.

## Metadata

| Field | Value |
|-------|-------|
| Title | ${title} |
| Type | \`${type}\` |
| PR | #${pr:-$PR_NUMBER} |
| Authors | ${authors} |
| Created | ${created} |

## Entry

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
