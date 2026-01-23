---
description: Fix review findings with commits. Use when fixing issues from /review, working through PR feedback, or resolving findings.
context: fork
model: sonnet
---

# Fix Review Findings

Work through review findings one-by-one, creating a commit for each fix.

## 1. Locate Review Directory

Find the most recent review directory:

```sh
ls -td .reviews/*/* 2>/dev/null | head -1
```

If no review directory exists, inform the user to run `/review` first and stop.

## 2. Read Findings

Read all `*.md` files in the review directory. Parse findings from each file.

Collect for each finding:

- Finding ID (e.g., SEC-1, GIT-1)
- Severity (P1-P4)
- File and line numbers
- Issue description
- Reasoning and evidence
- Suggestion
- Thread ID (for GIT-* findings only)

If no findings exist, report "No findings to fix" and stop.

## 3. Prioritize

Sort findings:

1. By severity (P1 first, then P2, P3, P4)
2. Within same severity, group by file to reduce context switches

Present the prioritized list to the user before starting.

## 4. Fix Each Finding

Process findings in priority order. For each finding:

### 4.1 Show Finding

Display the finding with full context:

```
### SEC-1 · P1 · SQL injection vulnerability · 95%

File: src/db.ts:45-52
Issue: User input passed directly to SQL query
Reasoning: Unsanitized input allows SQL injection attacks
Evidence: `query("SELECT * FROM users WHERE id = " + userId)`
Suggestion: Use parameterized queries with prepared statements
```

### 4.2 Ask User

Use AskUserQuestion to ask how to proceed:

- **Apply suggestion** — Implement the suggested fix
- **Modify** — Let user describe a different approach
- **Skip** — Move to next finding
- **Stop** — End fixing session

### 4.3 Make the Fix

If user chose to fix (apply or modify), make the changes to the file(s).

### 4.4 Commit and Push

Spawn `@dev:committer` to stage and commit the fix. Then push:

```sh
git push
```

### 4.5 Resolve GitHub Threads

For findings with a GIT-* ID that have a thread ID, reply and resolve:

**Reply with commit SHA:**

```sh
gh api graphql -f query='
mutation {
  addPullRequestReviewThreadReply(input: {
    pullRequestReviewThreadId: "THREAD_ID"
    body: "Addressed in COMMIT_SHA."
  }) { comment { id } }
}'
```

**Resolve the thread:**

```sh
gh api graphql -f query='
mutation {
  resolveReviewThread(input: {
    threadId: "THREAD_ID"
  }) { thread { isResolved } }
}'
```

If the fix doesn't fully address the comment, ask the user whether to resolve.

### 4.6 Continue or Stop

After each finding, check if user wants to continue or stop early.

## 5. Report Summary

After all findings are processed (or user stops), display:

```
## Summary

Fixed: 5 findings
Skipped: 2 findings
Commits: 4 (some findings grouped)
Threads resolved: 3 (GitHub)
```
