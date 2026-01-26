---
description: Run parallel code review on changes. Use when reviewing a PR, checking code quality, or auditing changes.
context: fork
model: sonnet
hooks:
  PreToolUse:
    - matcher: "*"
      hooks:
        - type: command
          command: "$CLAUDE_PLUGIN_ROOT/scripts/detect-review-scope.sh"
          once: true
        - type: command
          command: "$CLAUDE_PLUGIN_ROOT/scripts/detect-pr-context.sh"
          once: true
---

# Review Changes

Run parallel code review with triage, planning, and execution phases.

## Session Resumption

Check if there are pending fix tasks from a previous session. If found, offer to
resume or start fresh.

## Phase 1: Review

### Gather Context

Launch an Explore agent to briefly describe the project for reviewers (what it
does, key characteristics relevant to review).

### Select and Launch Reviewers

Run the diff to see actual changes. Select relevant reviewers based on the
changes—skip those with nothing to review, but when uncertain include them.

Available reviewers:

- `@dev:reviewers:ux` - User experience, clarity, discoverability
- `@dev:reviewers:docs` - Documentation quality, accuracy
- `@dev:reviewers:tests` - Test coverage, edge cases
- `@dev:reviewers:arch` - API design, modularity, complexity
- `@dev:reviewers:security` - Input validation, injection, secrets
- `@dev:reviewers:readability` - Naming quality, idiomatic patterns, clarity
- `@dev:reviewers:performance` - Performance, complexity, resource efficiency
- `@dev:reviewers:github` - GitHub PR comments (only in PR mode)

Launch reviewers in parallel. Pass each the project context, file list, diff
command, and review directory path.

## Phase 2: Triage

Spawn `@dev:triager` with the review directory. The triager filters low-confidence
findings, groups related issues, and deduplicates cross-reviewer overlap.

Present the triage summary to the user. Ask whether to continue to planning or
abort (keeping findings for manual review).

### Triage Error Recovery

If the triager fails or returns incomplete results:

1. Check `.claude/reviews/<session>/` for partial output
2. Raw findings remain in reviewer files (security.md, arch.md, etc.)
3. Options:
   - Re-run `@dev:triager` with the review directory
   - Manually move findings to `triaged/` subdirectory
   - Skip triage and proceed directly to manual planning

## Phase 3: Plan

Spawn `@dev:planner` with the triaged directory and mode (PR or Batch). The
planner creates fix tasks with appropriate dependencies.

Present the plan to the user. Ask whether to execute, modify, or abort.

If modifying: let user skip tasks, reorder, or switch modes.

## Phase 4: Execute

Process fix tasks in dependency order.

| Mode  | Behavior                                                |
| ----- | ------------------------------------------------------- |
| PR    | Per-task prompts, individual commits, thread resolution |
| Batch | Fully autonomous, single commit at end                  |

### PR Mode

For each task:

1. Display the finding details
2. Ask: Apply suggestion / Modify / Skip / Stop
3. If fixing, spawn `@dev:fixer` with finding details and `Mode: PR`

### Batch Mode

Process all tasks automatically. Spawn `@dev:fixer` for each with `Mode: Batch`.
On failure, log and continue.

### Fixer Input

Pass to `@dev:fixer`:

- Finding ID(s) and details (file, issue, suggestion)
- Thread IDs for GitHub findings
- Mode (PR or Batch)
- Instructions (apply suggestion or custom approach)

### Summary

After execution, show what was fixed, skipped, and failed.

In batch mode, offer to create a single commit for all fixes.
