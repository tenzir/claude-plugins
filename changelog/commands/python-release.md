---
description: Release a Python project using tenzir-changelog and uv
---

# Python Release Workflow

Guide me through releasing a Python project that uses `tenzir-changelog` and `uv`.

## Pre-Release Checklist

Before starting, verify:

1. All changes are committed and pushed
2. CI is passing on the main branch
3. Unreleased changelog entries exist in `changelog/unreleased/`

## Release Steps

### 1. Pre-release validation

Make sure the tree is clean and all checks pass:

```sh
uv run check-release
```

If `check-release` does not exist, run the project-specific checks (e.g.,
linting, type checking, tests).

### 2. Determine version

Ask me what version to release. Options:

- **patch** (x.y.Z) - Bug fixes, minor changes
- **minor** (x.Y.0) - New features, backward compatible
- **major** (X.0.0) - Breaking changes

### 3. Create intro file

Create an intro file summarizing the release:

```sh
cat > /tmp/intro.md << 'EOF'
This release introduces new feature X and fixes several bugs related to Y.
EOF
```

### 4. Stage the release

Stage the release manifest and move unreleased changelog entries:

```sh
uvx tenzir-changelog release create vX.Y.Z --intro-file /tmp/intro.md --yes
uvx tenzir-changelog validate
```

The command relocates the contents of `changelog/unreleased/` into
`changelog/releases/vX.Y.Z/entries/`, records release metadata in
`manifest.yaml`, and refreshes the release notes.

### 5. Bump version

Bump the version:

```sh
uv version --bump patch|minor|major
```

This updates `pyproject.toml` and `uv.lock`. Do not modify `pyproject.toml` manually.

### 6. Commit release artifacts

Commit the release artifacts and version bump:

```sh
git commit -am "Bump version to vX.Y.Z"
```

### 7. Publish

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
