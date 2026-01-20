---
title: Plan review hook respects user rejection
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-20T16:21:39.295533Z
---

The plan review hook now correctly skips execution when you reject a plan. Previously, the "Starting plan review..." notification appeared regardless of acceptance status, causing confusing output.
