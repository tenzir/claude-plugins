---
name: managing-packages
description: Create and manage Tenzir packages. Use during package development when creating parsers for log samples, adding user-defined operators, showcasing example pipelines, and writing integration tests.
---

# Managing Tenzir Packages

Create, modify, and test Tenzir packages for parsers, transformations, and OCSF
mappings.

## Documentation

Read the following pages to understand packages and testing:

- <https://docs.tenzir.com/explanations/packages.md>
- <https://docs.tenzir.com/reference/test-framework.md>
- <https://docs.tenzir.com/guides/testing/write-tests.md>

When you need detailed information about operators, functions, or test
framework features, spawn the `docs:reader` subagent with your question.

## Changelog Management

The `tenzir-ship` framework manages the changelog/ directory. Read the
following pages to understand how to maintain a changelog:

- <https://docs.tenzir.com/reference/ship-framework.md>
- <https://docs.tenzir.com/guides/package-management/maintain-a-changelog.md>

When adding changelog entries to a package, spawn the `ship:adder` subagent or
run `/ship:add` directly.
