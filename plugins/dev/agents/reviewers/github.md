---
name: github
description: Extract GitHub PR review comments as findings. Use when processing feedback from human reviewers and bots on pull requests.
tools: Bash, Write
model: haiku
color: purple
skills: dev:reviewing-changes
---

# GitHub Review

Extract GitHub PR review comments and format as findings.

## Workflow

The review directory path is provided in your prompt context. Write all output
files to this directory.

### 1. Get PR Info

Get PR number and repo info:

```sh
gh pr view --json number --jq '.number'
gh repo view --json owner,name --jq '"\(.owner.login) \(.name)"'
```

If no PR exists for the current branch, write an empty `github.md` with a note and
stop.

### 2. Fetch Unresolved Comments

Get all unresolved review threads via GraphQL:

```sh
gh api graphql -f query='
{
  repository(owner: "OWNER", name: "REPO") {
    pullRequest(number: PR_NUMBER) {
      reviewThreads(first: 100) {
        nodes {
          id
          isResolved
          comments(first: 20) {
            nodes {
              author { login }
              body
              path
              line
              startLine
            }
          }
        }
      }
    }
  }
}'
```

Replace `OWNER`, `REPO`, and `PR_NUMBER` with actual values from step 1.

**Important:**

- `OWNER`, `REPO`, and `PR_NUMBER` must come from trusted sources (`gh repo
view`, `gh pr view`)
- Check exit code: if the query fails, write `github.md` with an error note and
  stop
- GraphQL errors appear in the response's `errors` field—check before processing

Note: Query fetches up to 100 threads with 20 comments each. For PRs exceeding
these limits, some comments may be missed—this is acceptable for typical PRs.

Filter to threads where `isResolved` is false. If all threads are resolved,
write `github.md` with "No unresolved comments" and stop.

### 3. Consolidate Comments

Group and consolidate related comments into single findings:

- **Same issue, multiple locations**: Comments about the same problem in
  different places become one finding listing all locations
- **Thread replies**: Follow-up comments in the same thread merge into the
  parent finding (add context, don't create separate findings)
- **References**: "Same here", "Ditto", "+1" comments link to the original
- **Different issues**: Separate concerns from the same author stay as separate
  findings

### 4. Write Findings

Write findings to `github.md` in the review directory.

Use the `GIT` prefix (GitHub) and add an `**Author**` field:

```markdown
# GitHub Review

## Summary

Brief summary of feedback themes (2-3 sentences).

## Findings

### GIT-1 · P3 · Missing error handling · 100%

- **Author**: @alice
- **File**: `src/api.ts:45`
- **Issue**: Function doesn't handle network errors
- **Reasoning**: Reviewer feedback on error handling gap
- **Evidence**:
  > The fetch call should be wrapped in try/catch to handle network failures.
- **Suggestion**: Add try/catch block around the fetch call

### GIT-2 · P3 · Unclear variable name · 100%

- **Author**: @bob
- **File**: `src/utils.ts:12`
- **Issue**: Variable `x` should have a descriptive name
- **Reasoning**: Reviewer feedback on naming
- **Evidence**:
  > What does `x` represent here? Consider renaming to something more descriptive.
- **Suggestion**: Rename to reflect the variable's purpose
```

## Finding Format Notes

See the `reviewing-changes` skill for the canonical finding format. Notes below
cover GitHub-specific variations only.

- **Severity**: Default to P3 (suggestions) unless the reviewer explicitly flags
  something as critical or blocking
- **Confidence**: Default to 100% for clear, actionable human feedback. Use
  90-95% for speculative comments ("This might..."), bot feedback, or when
  thread replies show disagreement.
- **Author**: GitHub username with `@` prefix
- **Evidence**: Quote the reviewer's comment directly using `>` blockquote
- **File**: Use `path:line` format; for ranges use `path:startLine-endLine`

When `startLine` is present in the API response, the comment applies to lines
`startLine` through `line` (inclusive).

**Privacy**: Do not quote comments that contain credentials, internal hostnames,
or sensitive data. Summarize such feedback without quoting verbatim.

## Output

Write findings to `github.md` in the review directory.
