---
title: Use portable shebang in formatter hook
type: bugfix
authors:
  - mavam
  - claude
created: 2025-12-08T15:48:58.974407Z
---

The shebang now uses `#!/usr/bin/env bash` instead of `#!/bin/bash` for portability across systems where bash may be installed in different locations.
