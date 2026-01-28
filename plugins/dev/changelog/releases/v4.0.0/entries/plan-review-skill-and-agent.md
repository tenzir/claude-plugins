---
title: Plan review skill and agent
type: change
authors:
  - mavam
  - claude
created: 2026-01-23T08:47:57.05624Z
---

Plan review functionality has been refactored from hook-based scripts into a structured skill and agent. The new `reviewing-plans` skill provides a formal methodology for evaluating implementation plans across five weighted dimensions (completeness, correctness, feasibility, risk, and clarity) with consistent severity levels for findings. The `plan-reviewer` agent exposes this capability as a reusable workflow that integrates with plan mode. Hook-based review triggers have been removed in favor of this more robust, composable approach.
