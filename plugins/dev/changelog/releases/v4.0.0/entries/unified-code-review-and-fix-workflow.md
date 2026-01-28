---
title: Unified code review and fix workflow
type: feature
authors:
  - mavam
  - claude
pr: 12
created: 2026-01-26T10:53:29.496992Z
---

The code review workflow now consolidates review and fix operations into a unified four-phase process. The `/dev:review` command serves as the primary entry point, orchestrating a complete workflow that reviews, triages, plans, and executes fixes.

The workflow consists of four phases:

1. **Review phase**: Spawns seven specialized reviewers in parallel to analyze code changes and generate confidence-scored findings.

2. **Triage phase**: The `@dev:triager` agent filters low-confidence findings (below 70%), groups related findings by root cause, and deduplicates cross-reviewer overlap for higher-quality findings.

3. **Planning phase**: The `@dev:planner` agent creates a task list from triaged findings with proper dependencies and ordering by severity and file location.

4. **Execution phase**: The `@dev:fixer` agent processes fix tasks with mode-specific behavior. In PR mode, each fix spawns an individual prompt to commit, push, and resolve GitHub threads. In batch mode, all fixes are applied autonomously with a single summary commit at the end.

The workflow supports session resumption—if interrupted during the execution phase, running `/dev:review` again offers to continue from where you left off.

The `/dev:fix` command is removed; its functionality is now integrated into the unified review workflow. A new `addressing-reviews` skill provides GitHub PR communication best practices for handling review comments.
