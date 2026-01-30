---
title: Automated scope detection and improved changelog guidance in changelog-adder
  agent
type: change
authors:
  - mavam
  - claude
created: 2026-01-30T10:30:15.169744Z
---

The changelog-adder agent now automatically injects context about changed files through a `PreToolUse` hook, eliminating manual scope detection. The hook runs an improved scope detection script that prioritizes staged changes, then unstaged changes, then branch history.

The agent's instructions have been refined to provide clearer guidance for writing user-facing changelog entries. New sections explicitly distinguish what to exclude (internal implementation details), what to preserve (user-facing terms), and what to include (outcomes and examples). A self-review checklist helps ensure changelog entries are clear and helpful.

These improvements streamline the changelog creation workflow by automatically providing essential context while guiding the agent toward writing changelogs that focus on user benefits rather than implementation details.
