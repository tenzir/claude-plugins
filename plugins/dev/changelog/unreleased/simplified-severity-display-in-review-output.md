---
title: Simplified severity display in review output
type: change
authors:
  - mavam
  - claude
created: 2026-01-19T21:28:15.815656Z
---

The review command now uses a simplified severity display that maps priority levels directly to colored emojis (P1→🔴, P2→🟠, P3→🟡, P4→⚪) instead of computing composite "action" labels from severity and confidence scores.

This change makes review findings easier to scan by eliminating the intermediate "critical/important/minor/optional" classification. Findings are now sorted by severity and confidence only, and the legend shows the direct P1-P4 mapping rather than derived action categories.
