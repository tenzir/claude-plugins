---
description: Fix review findings with commits. Use when fixing issues from /review, working through PR feedback, or resolving findings.
context: fork
model: sonnet
---

# Fix Review Findings

Work through review findings, spawning `@dev:fixer` for each fix.

## 1. Locate Review Directory and Detect Scope

### Review Directory

Find the most recent review directory:

```sh
ls -td .reviews/*/* 2>/dev/null | head -1
```

If no review directory exists, inform the user to run `/review` first and stop.

### PR Scope Detection

Check if the current branch has an associated pull request:

```sh
gh pr view --json number --jq '.number' 2>/dev/null
```

This determines the **fix mode**:

- **PR mode** (PR exists): Commit and push each fix individually, resolve GitHub
  threads. Interactive per-finding confirmation.
- **Batch mode** (no PR): Apply all fixes without individual commits. Single
  commit offered at the end. Autonomous processing after initial confirmation.

Store the mode for use throughout the workflow.

## 1a. Check for Existing Session

Check for pending fix tasks from a previous session:

```
Call TaskList to retrieve all tasks. Filter results where subject starts with "Fix:"
```

**TaskList returns** an array of task objects with `id`, `subject`, `status` (`pending`, `in_progress`, or `completed`), and `metadata`.

If pending tasks with status `pending` or `in_progress` exist:

- Count remaining tasks (not `completed`)
- Use AskUserQuestion to ask: "Found N pending fixes from a previous session"
  - **Resume** — Continue from where you left off
  - **Start fresh** — Begin a new fixing session

If user chooses **Resume**:

- Re-read findings from review directory to restore context
- Present remaining tasks (not completed) with their status
- For `in_progress` tasks: ask user whether to retry or skip
- For `pending` tasks: process normally starting from section 4.1

If user chooses **Start fresh**:

- Mark all old fix tasks as `completed` with `metadata: {abandoned: true}`
- Continue to section 2

If no pending tasks exist, continue normally.

## 2. Read Findings

Read all `*.md` files in the review directory. Parse findings from each file.

Collect for each finding:

- Finding ID (e.g., SEC-1, GIT-1)
- Severity (P1-P4)
- File and line numbers
- Issue description
- Reasoning and evidence
- Suggestion
- Thread ID (for GIT-\* findings only)

## 3. Prioritize

Sort findings:

1. By severity (P1 first, then P2, P3, P4)
2. Within same severity, group by file to reduce context switches

Present the prioritized list to the user before starting.

## 3a. Create Finding Tasks

If no findings exist, report "No findings to fix" and stop.

Create a task for each finding using TaskCreate. Parameters:

- **subject** (string, required): Short title displayed in task list.
  Use: `Fix: {id} - {title_truncated}` (e.g., "Fix: SEC-1 - SQL injection")
- **description** (string, optional): Detailed context for the task.
  Use: `{severity} · {file}:{lines}\n\n{issue}\n\n{suggestion}`
- **activeForm** (string, optional): Text shown in status line while task is in progress.
  Use: `Fixing {id}`
- **addBlockedBy** (array of task IDs, optional): Tasks that must complete before this one.
- **metadata** (object, optional): Arbitrary key-value data attached to the task.
  Use:
  - `finding_id`: `{id}`
  - `severity`: `{severity}`
  - `file`: `{file}`

**TaskCreate returns** the created task object with its assigned `id`.

### Same-File Dependencies

Findings in the same file should be processed sequentially to prevent merge
conflicts. Use `addBlockedBy` to chain tasks for the same file:

```
SEC-1 (src/db.ts)  → task #1, no blockedBy
RDY-1 (src/db.ts)  → task #2, blockedBy: [#1]
ARC-1 (src/api.ts) → task #3, no blockedBy
TST-1 (src/db.ts)  → task #4, blockedBy: [#2]
```

Each file maintains its own dependency chain. Tasks for different files can
run independently (though in practice we process them one-by-one for user
interaction).

After creating all tasks, display a summary: "Created N tasks."

## 4. Process Each Finding

For each finding in priority order:

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

### 4.2 Ask User (PR mode only)

**In PR mode**, use AskUserQuestion to ask how to proceed for each finding:

- **Apply suggestion** — Implement the suggested fix
- **Modify** — Let user describe a different approach
- **Skip** — Move to next finding
- **Stop** — End fixing session

**In batch mode**, skip this step—apply the suggestion for all findings
automatically. The user already confirmed the prioritized list in section 3.

### 4.3 Update Task and Spawn Fixer

Use TaskUpdate to change task state. Parameters:

- **id** (string, required): The task ID returned by TaskCreate.
- **status** (string, optional): New status: `pending`, `in_progress`, or `completed`.
- **metadata** (object, optional): Additional key-value data to merge into existing metadata.

**If user chose Skip**:

- Mark task as `completed` with `metadata: {skipped: true}`
- Proceed to next finding

**If user chose Stop**:

- Leave current and remaining tasks as `pending`
- Jump to section 5 (Report Summary)
- Note: Pending tasks enable session resumption on next `/fix` run

**If user chose to fix (Apply or Modify)** (PR mode), or **for all findings** (batch mode):

- Call TaskUpdate to mark task as `in_progress`
- Spawn `@dev:fixer` with the finding and mode:

```markdown
## Finding

- **ID**: SEC-1
- **File**: src/db.ts:45-52
- **Issue**: User input passed directly to SQL query
- **Suggestion**: Use parameterized queries with prepared statements
- **Thread ID**: (include if GIT-\* finding)

## Mode

PR (or: Batch)

## Instructions

Apply the suggestion.
```

Or with custom instructions (PR mode only):

```markdown
## Instructions

User's custom approach here...
```

- Wait for the agent to complete
- **PR mode success**: Call TaskUpdate to mark as `completed` with `metadata: {commit: "sha"}`
- **Batch mode success**: Call TaskUpdate to mark as `completed` (no commit SHA)
- On failure:
  - Keep task as `in_progress`
  - Display the error from the fixer agent
  - Use AskUserQuestion with options:
    - **Retry** — Run fixer again with same instructions
    - **Skip** — Mark completed with `metadata: {skipped: true, error: "..."}`, move to next
    - **Stop** — Leave as `in_progress`, end session (enables retry on resume)

### 4.4 Continue

After each finding, proceed to the next. The user can choose "Stop" at any
finding to end early. Remaining tasks stay `pending` for future resumption.

## 5. Report Summary

After all findings are processed (or user stops), display:

### PR Mode Summary

```
## Summary

Fixed: 5 findings
Skipped: 2 findings
Commits: 5
Threads resolved: 3 (GitHub)
```

List the commits created:

```
- abc1234 Fix SQL injection vulnerability
- def5678 Add missing error handling
- ...
```

### Batch Mode Summary

```
## Summary

Fixed: 5 findings
Skipped: 0 findings
```

Then offer to create a single commit:

> Changes are ready. Create a commit?
>
> - **Yes** — Commit all fixes with a summary message
> - **No** — Leave changes uncommitted

If user chooses **Yes**:

1. Stage all modified files
2. Create a commit summarizing all fixes (use `dev:writing-commit-messages` skill)
3. Example message:

   ```
   Address review findings

   Fix 5 issues identified during code review:
   - SEC-1: SQL injection vulnerability
   - RDY-1: Unclear variable naming
   - ...

   Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
   ```

4. Do NOT push (user can push when ready)
