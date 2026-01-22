---
title: Autonomous documentation workflow with write and review
type: feature
authors:
  - mavam
  - claude
created: 2025-12-19T07:17:54.678258Z
---

The `docs:writer` subagent autonomously handles the documentation workflow by
executing `/docs:write` followed by `/docs:review`. It halts after the review
phase to let users inspect the results before deciding to create a PR. The
subagent makes autonomous decisions about section selection, style fixes, and
completeness gaps.
