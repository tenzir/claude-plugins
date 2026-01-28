This release introduces a unified code review and fix workflow that consolidates the review, triage, planning, and execution phases into a single `/dev:review` command. The workflow spawns specialized reviewers in parallel, filters findings by confidence, plans fixes with proper dependencies, and executes them with automatic GitHub thread resolution.

Other highlights include hunk-based C++ formatting that only applies `clang-format` to changed lines, Python formatting support via `ruff`, and a `go run` fallback for `shfmt` when the binary isn't installed.

**Breaking change**: The `addressing-pr-comments` skill has been replaced by the `@dev:reviewers:github` agent. Use the GitHub reviewer agent instead, or run `/review` on a branch with an open PR.

## 💥 Breaking changes

### Refactor code review to integrate GitHub PR feedback

The `addressing-pr-comments` skill has been replaced by the `@dev:reviewers:github` agent. This agent is now spawned automatically by `/review` when a PR exists, extracting unresolved GitHub comments as findings alongside the other code reviewers.

If you previously used the skill directly, use the GitHub reviewer agent instead or run `/review` on a branch with an open PR.

Other changes:

- The `reviewing-changes` skill now auto-creates the review directory via hook
- Added `GIT` prefix for GitHub findings in the issue ID table

*By @mavam and @claude.*

## 🚀 Features

### Enhance format hook with Python support and helper function

The format hook now supports Python formatting via `ruff`, running both `ruff format` for code formatting and `ruff check --fix` for auto-fixable lint issues.

*By @mavam and @claude.*

### Go run fallback for shfmt in format hook

The format hook now falls back to `go run` for `shfmt` when the binary is not installed directly. This ensures shell scripts get formatted even when `shfmt` is not on your system, as long as Go is available. The Go module version is pinned to `mvdan.cc/sh/v3/cmd/shfmt@v3.10.0` for reproducibility.

*By @mavam and @claude.*

### Hunk-based formatting for C++ files in format hook

The format hook now applies `clang-format` to only the changed hunks in staged C++ files rather than the entire file. This keeps your git history cleaner by preventing unrelated formatting changes from appearing in commits when only a few lines have been modified.

When you stage C++ file changes, the hook detects the modified line ranges using `git diff --cached` and passes them to `clang-format` via the `--lines` option. If no staged changes exist, the hook falls back to formatting the entire file. The implementation uses cross-platform compatible sed and bash features to work reliably on macOS and Linux.

*By @mavam and @claude.*

### Iterative workflow for addressing review findings

New `/fix` command orchestrates an iterative workflow for addressing review findings one by one. Each fix runs in a dedicated `@dev:fixer` agent (Opus) that commits the change, pushes to the remote, and resolves GitHub threads automatically for GitHub findings (GIT-\* IDs).

This restores the iterative "fix, commit, reply, resolve" workflow that was lost when `/address-pr-comments` was converted to a reviewer agent. The new design generalizes to all reviewer findings—not just GitHub comments—and gives Opus fresh context for each fix without accumulated distractions.

The `/review` command now offers both `/fix` and plan mode options in its workflow. Both paths handle automatic resolution of GitHub threads after fixes are pushed.

*By @mavam and @claude.*

### Unified code review and fix workflow

The code review workflow now consolidates review and fix operations into a unified four-phase process. The `/dev:review` command serves as the primary entry point, orchestrating a complete workflow that reviews, triages, plans, and executes fixes.

The workflow consists of four phases:

1. **Review phase**: Spawns seven specialized reviewers in parallel to analyze code changes and generate confidence-scored findings.

1. **Triage phase**: The `@dev:triager` agent filters low-confidence findings (below 70%), groups related findings by root cause, and deduplicates cross-reviewer overlap for higher-quality findings.

1. **Planning phase**: The `@dev:planner` agent creates a task list from triaged findings with proper dependencies and ordering by severity and file location.

1. **Execution phase**: The `@dev:fixer` agent processes fix tasks with mode-specific behavior. In PR mode, each fix spawns an individual prompt to commit, push, and resolve GitHub threads. In batch mode, all fixes are applied autonomously with a single summary commit at the end.

The workflow supports session resumption—if interrupted during the execution phase, running `/dev:review` again offers to continue from where you left off.

The `/dev:fix` command is removed; its functionality is now integrated into the unified review workflow. A new `addressing-reviews` skill provides GitHub PR communication best practices for handling review comments.

*By @mavam and @claude in #12.*

## 🔧 Changes

### Improved opencode CLI invocation in plan-reviewer agent

The plan-reviewer agent now uses a heredoc for the opencode CLI prompt, improving readability and making the review criteria visible directly in the agent definition. The `--variant` flag is conditionally included only when a variant is specified, avoiding empty argument errors.

*By @mavam and @claude.*

### Plan review skill and agent

Plan review functionality has been refactored from hook-based scripts into a structured skill and agent. The new `reviewing-plans` skill provides a formal methodology for evaluating implementation plans across five weighted dimensions (completeness, correctness, feasibility, risk, and clarity) with consistent severity levels for findings. The `plan-reviewer` agent exposes this capability as a reusable workflow that integrates with plan mode. Hook-based review triggers have been removed in favor of this more robust, composable approach.

*By @mavam and @claude.*

## 🐞 Bug fixes

### Improve branch naming instructions in pr-maker agent

The pr-maker agent now provides more explicit branch naming instructions to prevent misinterpretation by the Haiku model. The instructions now clearly state that `topic/` is a literal prefix, specify the placeholder as `<kebab-case-description>` for clarity, and include concrete examples (`topic/add-user-auth`, `topic/fix-login-bug`, `topic/refactor-api`) so the agent consistently creates branches with the correct naming pattern.

*By @mavam and @claude.*
