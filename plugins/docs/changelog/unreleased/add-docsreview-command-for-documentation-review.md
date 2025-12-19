---
title: Add /docs:review command for documentation review
type: feature
authors:
  - mavam
  - claude
created: 2025-12-19T06:20:57.742309Z
---

Introduces the `/docs:review` command to review documentation changes for completeness and style. The command:

- Identifies changes in the `.docs/` directory
- Starts the local preview server for live verification
- Checks completeness using the `docs:writing` skill
- Reviews writing style using the `writing:technical-writing` skill
- Summarizes findings and offers to fix identified issues

This integrates seamlessly into the documentation workflow as the second step after `/docs:write`.
