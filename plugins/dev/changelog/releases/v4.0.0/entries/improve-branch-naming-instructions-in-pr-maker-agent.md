---
title: Improve branch naming instructions in pr-maker agent
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-22T19:09:18.580353Z
---

The pr-maker agent now provides more explicit branch naming instructions to prevent misinterpretation by the Haiku model. The instructions now clearly state that `topic/` is a literal prefix, specify the placeholder as `<kebab-case-description>` for clarity, and include concrete examples (`topic/add-user-auth`, `topic/fix-login-bug`, `topic/refactor-api`) so the agent consistently creates branches with the correct naming pattern.
