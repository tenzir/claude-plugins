---
title: Intelligent synthesis and structured tracking for review findings
type: change
authors:
  - mavam
  - claude
created: 2026-01-20T08:56:03.883163Z
---

The review workflow now synthesizes findings using the orchestrator's full context—all reviewer outputs, project information, and user intent—to distill actionable items. This replaces raw display with intelligent selection: deduplicating overlapping findings, correlating related issues, and filtering noise.

Reviewers assign structured issue IDs (SEC-1, ARC-1, TST-1, etc.) for tracking, and must provide concrete reasoning and evidence with each finding. The bar is raised at the source rather than adding post-hoc verification layers.

The orchestrator presents a focused summary sorted by urgency, then offers to enter plan mode where it re-reads full reviewer outputs for implementation planning.
