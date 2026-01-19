---
title: Node.js version bumping in release workflow
type: feature
authors:
  - mavam
  - claude
created: 2026-01-17T09:33:29.48488Z
---

The `ship:release` skill now supports Node.js projects during the version bumping step. It uses `npm version --no-git-tag-version` to update `package.json`, then provides guidance for regenerating the appropriate lock file based on which package manager the project uses (npm, yarn, pnpm, or bun).
