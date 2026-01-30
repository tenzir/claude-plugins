---
description: Run parallel code review on changes. Use when reviewing a PR, checking code quality, or auditing changes.
argument-hint: "[reviewers...]"
context: fork
model: sonnet
hooks:
  PreToolUse:
    - matcher: "*"
      hooks:
        - type: command
          command: "$CLAUDE_PLUGIN_ROOT/scripts/detect-change-scope.sh"
          once: true
        - type: command
          command: "$CLAUDE_PLUGIN_ROOT/scripts/detect-pr-context.sh"
          once: true
---

# Review Changes

Run parallel code review with triage, planning, and execution phases.

## Arguments

Optional reviewer filter: `/dev:review [reviewers...]`

| Example                     | Effect                                 |
| --------------------------- | -------------------------------------- |
| `/dev:review`               | Auto-select reviewers based on changes |
| `/dev:review github`        | Only GitHub PR comments                |
| `/dev:review security arch` | Only security and architecture         |
| `/dev:review tests docs`    | Only tests and documentation           |

Valid reviewer names: `ux`, `docs`, `tests`, `arch`, `security`, `readability`, `performance`, `github`

**Requested reviewers:** $ARGUMENTS

When arguments are provided, run only those reviewers. When empty, auto-select based on changes.

## Session Resumption

Check if there are pending fix tasks from a previous session. If found, offer to
resume or start fresh.

## Phase 1: Review

### Gather Context

Launch an Explore agent to briefly describe the project for reviewers (what it
does, key characteristics relevant to review).

### Select and Launch Reviewers

If `$ARGUMENTS` is non-empty, run only the specified reviewers. Otherwise, run
the diff to see actual changes and select relevant reviewers based on the
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

Present the triage summary to the user using the emoji display format below.

After displaying the findings summary, use the `AskUserQuestion` tool:

- Question: "How would you like to proceed with these findings?"
- Header: "Findings"
- Options:
  1. **Fix all findings (Recommended)** - Plan and execute fixes for all findings
  2. **Select which to fix** - Specify findings to skip before proceeding
  3. **Abort** - Keep findings for manual review

### Display Format

Transform triaged findings into an emoji-based summary table for display.

#### Severity Indicators

| Emoji | Level | Meaning           |
| ----- | ----- | ----------------- |
| 🔴    | P1    | Critical/Blocking |
| 🟠    | P2    | Important         |
| 🟡    | P3    | Should fix        |
| ⚪    | P4    | Nice to have      |

#### Category Icons

| Emoji | ID Prefix | Category    |
| ----- | --------- | ----------- |
| 🛡️    | SEC       | security    |
| 🏗️    | ARC       | arch        |
| 🧪    | TST       | tests       |
| 🎨    | UXD       | ux          |
| 👁️    | RDY       | readability |
| 📖    | DOC       | docs        |
| 🚀    | PRF       | performance |
| 💬    | GIT       | github      |
| 📦    | GRP       | group       |

#### Format

Each finding displays as:

```
{severity_emoji} {severity} · {category_emoji} {id} · {title} ({confidence}%) · {file}:{line}
```

Examples:

```
🔴 P1 · 🛡️ SEC-1 · SQL injection vulnerability (95%) · src/db.ts:45
🟠 P2 · 🏗️ ARC-1 · Circular dependency (88%) · src/modules/a.ts:12
🟡 P3 · 🧪 TST-2 · Missing edge case test (82%) · tests/api.test.ts:78
```

For GitHub findings, append the author:

```
🟠 P2 · 💬 GIT-1 · Consider using constants (90%) · src/config.ts:23 (@reviewer)
```

For grouped findings, use a rounded box header with children connected at the corner.
The group severity is the highest severity among its children:

```
╭──────────────────────────────────────────────────────────────────────────╮
│ 🟠 P2 · 📦 GRP-1 · Inconsistent error handling (3 findings)              │
╰┬─────────────────────────────────────────────────────────────────────────╯
 ├─ 🟠 P2 · 👁️ RDY-1 · Missing error check (85%) · src/api.ts:23
 ├─ 🟡 P3 · 👁️ RDY-2 · Silent failure (82%) · src/api.ts:45
 └─ 🟡 P3 · 👁️ RDY-3 · No error logging (80%) · src/api.ts:67
```

#### Sorting

1. By severity: P1 first, then P2, P3, P4
2. Within severity: by confidence (highest first)

#### Legend

Include legend rows at the bottom:

```
Severity: 🔴 P1 Critical · 🟠 P2 Important · 🟡 P3 Should fix · ⚪ P4 Nice to have
Category: 🛡️ Security · 🏗️ Arch · 🧪 Tests · 🎨 UX · 👁️ Readability · 📖 Docs · 🚀 Perf · 💬 GitHub · 📦 Group
```

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

Planning proceeds automatically after the user approves findings in Phase 2.

## Phase 4: Execute

Process fix tasks in dependency order.

| Mode  | Behavior                                      |
| ----- | --------------------------------------------- |
| PR    | Individual commits per fix, thread resolution |
| Batch | Fully autonomous, single commit at end        |

### Automated Findings

For findings from automated reviewers (`@dev:reviewers:*` except `github`),
execute fixes without per-task prompts. Spawn `@dev:fixer` for each finding.

### GitHub Review Comments

If the review includes GitHub PR comments (`@dev:reviewers:github` findings),
prompt separately after automated fixes complete using `AskUserQuestion`:

- Question: "How would you like to handle GitHub review comments?"
- Header: "GitHub"
- Options:
  1. **Address all & resolve threads (Recommended)** - Fix and resolve automatically
  2. **Review each comment** - Prompt before each GitHub finding
  3. **Skip GitHub comments** - Leave for manual handling

When user selects "Review each comment", for each GitHub finding:

1. Display the finding details and reviewer comment
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
