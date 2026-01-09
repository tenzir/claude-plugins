---
title: Explicit skill declarations for subagents
type: feature
authors:
  - mavam
  - claude
created: 2026-01-05T07:35:47.267872Z
---

Subagents now explicitly declare required skills in their YAML frontmatter using
the `skills:` field. This change aligns with Claude Code's updated behavior
where subagents no longer inherit skills from the parent conversation.

The validation script now verifies that all skill references in agent
definitions point to existing skills, catching broken references before
deployment.
