---
title: Improved opencode CLI invocation in plan-reviewer agent
type: change
authors:
  - mavam
  - claude
created: 2026-01-23T16:18:25.202046Z
---

The plan-reviewer agent now uses a heredoc for the opencode CLI prompt, improving readability and making the review criteria visible directly in the agent definition. The `--variant` flag is conditionally included only when a variant is specified, avoiding empty argument errors.
