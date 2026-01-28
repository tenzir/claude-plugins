---
title: Go run fallback for shfmt in format hook
type: feature
authors:
  - mavam
  - claude
created: 2026-01-28T09:14:16.277242Z
---

The format hook now falls back to `go run` for `shfmt` when the binary is not installed directly. This ensures shell scripts get formatted even when `shfmt` is not on your system, as long as Go is available. The Go module version is pinned to `mvdan.cc/sh/v3/cmd/shfmt@v3.10.0` for reproducibility.
