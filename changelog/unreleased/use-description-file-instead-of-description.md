---
title: Use `--description-file` instead of `--description`
type: change
author: mavam
component: changelog
created: 2025-12-05T07:18:28.304305Z
---

The `--description-file` flag reads the description from a file, avoiding shell escaping issues that can occur with inline `--description` arguments.
