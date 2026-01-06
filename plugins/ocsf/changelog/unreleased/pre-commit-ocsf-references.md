---
title: Pre-commit OCSF references with automated updates
type: change
pr: 4
authors:
  - mavam
  - claude
---

OCSF schema references and documentation articles are now pre-committed to the
repository instead of being lazily generated or fetched remotely. A GitHub
Action checks daily for new OCSF releases and documentation updates,
automatically filing PRs when changes are detected. Users can still generate
references for specific versions locally using `generate-references.py`.
