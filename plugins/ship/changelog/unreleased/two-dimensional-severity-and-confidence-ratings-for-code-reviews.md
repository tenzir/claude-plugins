---
title: Two-dimensional severity and confidence ratings for code reviews
type: change
authors:
  - mavam
  - claude
created: 2026-01-19T08:43:33.707Z
---

Code review findings now include independent severity and confidence ratings for better prioritization.

The `reviewing-changes` skill defines a two-dimensional rating system:

- **Severity** (P1-P4) measures the impact of a finding from critical security issues to cosmetic improvements
- **Confidence** (0-100) measures certainty that the finding is real

The `review` command computes action emojis from these dimensions:

- 🔴 Act now — P1-P2 issues with high confidence (80%+)
- 🟠 Investigate — Potentially critical issues or confirmed minor issues
- 🟡 Consider — Lower-confidence moderate issues or confirmed trivial issues
- ⚪ Optional — Low-confidence trivial suggestions

This replaces the previous single-dimension confidence scoring system where severity was implied from the confidence score. The new system lets reviewers independently assess "how bad is this?" and "how sure am I?" for more nuanced findings.
