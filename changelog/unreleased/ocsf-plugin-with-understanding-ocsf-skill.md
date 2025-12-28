---
title: OCSF plugin with understanding-ocsf skill
type: feature
authors:
  - mavam
  - claude
created: 2025-12-28T19:59:12.221961Z
---

The OCSF plugin provides comprehensive schema navigation for the Open Cybersecurity Schema Framework through the `understanding-ocsf` skill. The skill guides users through five core OCSF concepts: attributes, objects, classes, profiles, and extensions, with detailed documentation for each.

Reference documentation is dynamically generated from schema.ocsf.io covering all stable versions from 1.0.0 to 1.7.0. The generator fetches versioned schemas and creates Markdown references for 83 event classes and 170 object types, organized by the 8 OCSF categories (System, Findings, IAM, Network, Discovery, Application, Remediation, Unmanned). Progressive disclosure is achieved through hierarchical index files that link from the main index to version-specific indices to individual class and object documentation.

Generated references are excluded from git due to their size (approximately 2.6 MB across 8 versions), and users run the generation script as needed after installation.
