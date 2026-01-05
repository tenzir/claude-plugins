---
title: Bidirectional arrow binding documentation
type: change
authors:
  - mavam
  - claude
created: 2026-01-05T21:07:59.551106Z
---

The arrow binding documentation now includes a complete example showing how to
connect shapes with arrows that move together when dragged. The documentation
clarifies that bindings are bidirectional—both the arrow's `startBinding`/`endBinding`
and the shape's `boundElements` must reference each other. New sections explain
arrow positioning rules (first point must be `[0, 0]`) and the formula for
calculating edge attachment points from `fixedPoint` ratios.
