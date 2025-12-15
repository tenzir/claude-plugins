---
title: Improve releaser agent reliability with Sonnet model and process guardrails
type: change
authors:
- mavam
- claude
components:
- changelog
created: 2025-12-15T11:12:36.24166Z
---

Upgrade the releaser agent to use Claude Sonnet instead of Haiku for improved reliability and constraint adherence. Add a "Follow the Process" section that explicitly instructs the agent to use the `tenzir-changelog` CLI and `/changelog:release` command rather than bypassing the workflow with direct `gh` or `git tag` commands, ensuring consistent and safe release practices.
