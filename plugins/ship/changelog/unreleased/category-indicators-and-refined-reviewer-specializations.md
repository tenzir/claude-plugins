---
title: Category indicators and refined reviewer specializations
type: change
authors:
  - mavam
  - claude
created: 2026-01-19T12:34:26.157113Z
---

Code review findings now include visual category indicators and refined reviewer specializations for clearer prioritization.

The `review` command splits the previous `consistency` reviewer into two focused reviewers:

- **Readability** (👁️) evaluates naming quality, idiomatic patterns, and code clarity
- **Performance** (🚀) assesses algorithmic complexity, memory usage, and resource efficiency

Review output now displays category emojis alongside findings to quickly identify the concern area:

- 🛡️ security
- 🏗️ arch
- 🧪 tests
- 🎨 ux
- 👁️ readability
- 📖 docs
- 🚀 perf

This makes it easier to scan review results and understand both the urgency (from action emojis) and the nature (from category emojis) of each finding at a glance.
