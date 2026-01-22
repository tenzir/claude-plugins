---
title: Structured hook outputs for review workflow clarity
type: change
authors:
  - mavam
  - claude
created: 2026-01-19T21:05:34.366428Z
---

The review command's hook scripts now output structured control signals that make the workflow more explicit and reliable. The scope detection hook outputs `Scope:`, `Diff:`, and file list lines, while the directory creation hook outputs `Review directory:` with the path. This eliminates ambiguity about what commands to run and where to write findings.

The changes also add design principles to the hook documentation, clarifying that hooks should output all computed values rather than requiring the model to construct them. The review documentation now shows concrete examples of constructing diff commands from hook output, and the reviewer skill guidance emphasizes focusing on changed code rather than the entire codebase.
