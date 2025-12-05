---
description: Release a Python project using tenzir-changelog and uv
---

# Python Release Workflow

Guide me through releasing a Python project that uses `tenzir-changelog` and `uv`.

## Required Plugin

This command requires the `changelog` plugin for managing changelog entries and
release notes. Install it with:

```
/plugin install changelog@tenzir
```

## Pre-Release Checklist

Before starting, verify:

1. All changes are committed and pushed
2. CI is passing on the main branch
3. Unreleased changelog entries exist in `changelog/unreleased/`

## Release Steps

### 1. Pre-release validation

Make sure the tree is clean and all quality gates pass. See the
`writing-python-code` skill for the full check suite.

### 2. Determine version

Ask me what version to release. Options:

- **patch** (x.y.Z) - Bug fixes, minor changes
- **minor** (x.Y.0) - New features, backward compatible
- **major** (X.0.0) - Breaking changes

### 3. Stage the release

Create an intro file (`/tmp/intro.md`) with a brief summary of the release
highlights. Example:

> This release adds support for custom templates and improves validation
> performance. It also fixes several bugs related to YAML parsing.

Then stage the release:

```sh
uvx tenzir-changelog release create vX.Y.Z --intro-file /tmp/intro.md --yes
```

The command relocates the contents of `changelog/unreleased/` into
`changelog/releases/vX.Y.Z/entries/`, records release metadata in
`manifest.yaml`, and refreshes the release notes.

### 4. Bump version

Bump the version:

```sh
uv version --bump patch|minor|major
```

This updates `pyproject.toml` and `uv.lock`. Do not modify `pyproject.toml` manually.

### 5. Commit release artifacts

Commit the release artifacts and version bump:

```sh
git commit -am "Bump version to vX.Y.Z"
```

### 6. Publish

Publish the release and annotate the tag:

```sh
uvx tenzir-changelog release publish vX.Y.Z --tag --yes
```

The `--tag` flag creates an annotated tag and pushes it to the remote. Add
`--draft` or `--prerelease` if you need staged releases. The command pushes
the current branch, creates the GitHub release, and publishes the release
notes. Review the printed release URL to verify the release.

Publishing the release triggers the **Publish to PyPI** workflow, which
builds the distributions, validates metadata, uploads to PyPI, and performs
an install smoke test.
