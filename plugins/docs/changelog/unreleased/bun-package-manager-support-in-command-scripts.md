---
title: Bun package manager support in command scripts
type: change
authors:
  - mavam
  - claude
created: 2026-01-15T07:37:59.722448Z
---

The docs plugin commands now use `bun run` instead of `pnpm` to align with the
Tenzir documentation site's migration to bun as its package manager. This
affects the `/docs:write`, `/docs:pr`, and `/docs:review` commands, which now
invoke `bun run lint:fix` and `bun run dev` when working with the documentation
repository.
