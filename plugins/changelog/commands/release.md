---
description: Guide through releasing a project with tenzir-changelog (detect, stage, review, commit, publish, verify).
---

# Release Workflow

Guide me through releasing a project that uses `tenzir-changelog`.

## Detect Project Type

Check if `pyproject.toml` exists. If so, the project type is **python**.

Record the detected project type. Apply "Project type:" sub-sections only when
they match. Skip non-matching sub-sections.

## Pre-Release Checks

Before starting, verify:

1. **Clean tree**: Ensure no uncommitted changes
2. **CI passing**: Confirm CI is green on the main branch
3. **Unreleased entries exist**: Check `changelog/unreleased/` for pending entries

If any check fails, use `AskUserQuestion` to ask how to proceed.

## Release Steps

### 1. Quality gates

#### Project type: python

Run the quality gates (all must pass):

- `uv run ruff check`
- `uv run ruff format --check`
- `uv run mypy`
- `uv run pytest`
- `uv build`

Fix any failures before continuing.

### 2. Determine version

Use `AskUserQuestion` to ask what version to release:

- **patch** (x.y.Z) - Bug fixes, minor changes
- **minor** (x.Y.0) - New features, backward compatible
- **major** (X.0.0) - Breaking changes

### 3. Stage the release

Create an intro file (`/tmp/intro.md`) summarizing the release highlights based
on entries in `changelog/unreleased/`. Example:

> This release adds support for custom templates and improves validation
> performance. It also fixes several bugs related to YAML parsing.

Then stage the release:

```sh
uvx tenzir-changelog release create vX.Y.Z --intro-file /tmp/intro.md --yes
```

### 4. Review release notes

Display the generated release notes and use `AskUserQuestion` to ask for confirmation:

```sh
uvx tenzir-changelog release notes vX.Y.Z
```

If adjustments are needed, edit the intro or entries and re-run `release create`.

### 5. Bump version

See if there are version files to update (e.g., `package.json`, `Cargo.toml`,
`plugin.json`). If so, update them now.

#### Project type: python

Run:

```sh
uv version --bump patch|minor|major
```

This updates `pyproject.toml` and `uv.lock`.

### 6. Commit release artifacts

```sh
git add -A && git commit -m "Release vX.Y.Z"
```

### 7. Publish the release

Preview the release notes that will be published:

```sh
uvx tenzir-changelog release notes vX.Y.Z
```

If the output looks correct, publish the release (this creates the git tag,
pushes it, and creates the GitHub release):

```sh
uvx tenzir-changelog release publish vX.Y.Z --tag --yes
```

### 8. Post-release

Show the release notes summary:

```sh
uvx tenzir-changelog release notes vX.Y.Z
```

Then verify:

1. The GitHub release page shows correct release notes
2. CI workflows triggered by the tag are passing

#### Project type: python

3. The **Publish to PyPI** workflow completed successfully
