---
title: Correct PR creation syntax in finalize command
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-19T14:46:20.552375Z
---

The finalize command documentation now correctly instructs users to invoke `/git:pr` as a command rather than spawning `@git:pr` as a subagent. This fixes incorrect guidance that would have caused the command to fail when attempting to create a pull request.

Additionally, agent references `@ship:adder` and `@git:committer` no longer use code formatting for consistency with agent reference style elsewhere in the documentation.
