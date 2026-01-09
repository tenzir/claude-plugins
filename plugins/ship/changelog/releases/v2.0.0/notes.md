This major release rebrands the plugin from "changelog" to "ship" to better reflect its broader focus on release engineering. Commands have been updated from `/changelog:add` and `/changelog:release` to `/ship:add` and `/ship:release`, and all CLI invocations now use `tenzir-ship` instead of `tenzir-changelog`.

## 💥 Breaking changes

### Plugin renamed from changelog to ship

The `changelog` plugin has been renamed to `ship` to better reflect its focus on release engineering. Commands have been renamed from `/changelog:add` and `/changelog:release` to `/ship:add` and `/ship:release`. The `managing-entries` skill has been removed in favor of documentation links to the `tenzir-ship` CLI reference. All CLI invocations now use `tenzir-ship` instead of `tenzir-changelog`.

*By @mavam and @claude.*

## 🔧 Changes

### Fail-fast validation and clarified module detection in release command

The release command now performs upfront validation, aborting immediately if no unreleased entries exist in the target changelog directory. This prevents unnecessary processing and provides faster feedback.

The module detection process is now explicitly two-stage: first checking for a `modules` field in the repository's changelog config, then verifying unreleased entries in the appropriate directory (module-specific or top-level).

The documentation structure has been reorganized with dedicated sections for release context, agent setup, and module-specific workflows, making it easier to understand the release flow.

*By @mavam and @claude.*

## 🐞 Bug fixes

### Correct argument handling in ship commands

The `/ship:add` and `/ship:release` commands now correctly use positional arguments (`$1`) instead of incorrectly referencing named arguments in their metadata.

Previously, both commands declared an `args` field in their frontmatter but then referenced the wrong variable names in their instructions. The `add` command referenced `type` argument instead of `$1`, and the `release` command referenced `bump` argument instead of `$1`. This caused the commands to fail when users provided arguments.

*By @mavam and @claude.*
