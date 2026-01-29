---
title: Streamlined review workflow with structured decision points
type: change
authors:
  - mavam
  - claude
created: 2026-01-29T11:33:14.236842Z
---

The `/dev:review` command now streamlines the workflow by using Claude's structured `AskUserQuestion` tool to consolidate decision points into focused, meaningful interactions.

**Phase 2 (Triage)** now presents structured options after showing findings:

- Fix all findings (Recommended)
- Select which findings to skip
- Abort review

**Phase 3 (Plan)** proceeds automatically after the user approves findings in Phase 2, eliminating the intermediate plan review prompt.

**Phase 4 (Execute)** optimizes prompting based on finding type:

- Findings from automated reviewers (security, architecture, tests, and others) execute without per-task prompts
- GitHub PR comments only trigger an additional prompt if they exist, with options to address all, review each comment individually, or skip
- Per-finding prompts only appear when the user explicitly selects "Review each comment" for GitHub feedback

This reduction in prompts—from 2+ decisions down to 1 for automated reviewers, and conditionally 2 for workflows with GitHub comments—keeps the review workflow responsive while maintaining full control over important decisions.
