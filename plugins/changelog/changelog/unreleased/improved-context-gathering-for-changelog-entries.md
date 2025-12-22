---
title: Improved context gathering for changelog entries
type: change
authors:
  - mavam
  - claude
created: 2025-12-22T11:40:46.363821Z
---

The `/changelog:add` command now provides clearer guidance for determining which commits to include. When no PR exists, the command walks backwards through git history to identify a coherent sequence of commits, stopping at the first commit with an existing changelog entry.
