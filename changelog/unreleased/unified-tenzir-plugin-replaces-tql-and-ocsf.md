---
title: Unified tenzir plugin replaces tql and ocsf
type: breaking
authors:
  - mavam
  - claude
created: 2026-01-22T12:28:53.768758Z
---

The `tql` and `ocsf` plugins have been consolidated into a new unified `tenzir` plugin. Users must update their plugin configuration to replace `tql@tenzir` and `ocsf@tenzir` with `tenzir@tenzir`.

The new `tenzir` plugin combines all TQL and OCSF functionality into a single, cohesive experience with two workflow skills (`/tenzir:make-parser` and `/tenzir:make-ocsf-mapping`) and an OCSF subagent (`tenzir:ocsf`) for schema questions. This simplifies plugin management by reducing the number of plugins needed for Tenzir development workflows.

**Migration guide:**

Update your `.claude/settings.json` to replace the old plugins with the new one:

```diff
 "plugins": [
-  "tql@tenzir",
-  "ocsf@tenzir",
+  "tenzir@tenzir"
 ]
```

The `docs:reader` agent has been removed as it's superseded by general documentation lookup patterns.
