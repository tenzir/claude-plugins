---
description: Guide through releasing a project with tenzir-changelog (detect, stage, review, commit, publish, verify).
context: fork
argument-hint: "[patch|minor|major]"
---

## Release context

Look for unreleased changes.

### 1. Detect release type

Check `<repo>/changelog/config.yaml` for a `modules` field

- If present and releasing a module → **module release**
- Otherwise → **standard release**

### 2. Identify unreleased entries

In the target changelog directory:

- Module: `<repo>/.../<module>/changelog/unreleased/`
- Standard: `<repo>/changelog/unreleased/`

Abort if none exist.

## Agent setup

Invoke these skills:

- `changelog:managing-entries`
- `prose:technical-writing`

## Pre-release checks

Before starting, verify:

1. **Clean tree**: Ensure no uncommitted changes
2. **CI passing**: Confirm CI is green on the main branch

If any check fails, abort and explain why. Do not attempt to fix issues.

## Release steps

Begin by identifying the project type by running
`${CLAUDE_PLUGIN_ROOT}/scripts/detect-project-type.sh`.

Only execute the project-specific sections, e.g., if the project type is
`python`, only read the instructions fenced within the respective XML tag:

<project type="python">
Python-specific instructions here.
</project>

### 1. Quality gates

<project type="python">

Run the quality gates (all must pass):

- `uv run ruff check`
- `uv run ruff format --check`
- `uv run mypy`
- `uv run pytest`
- `uv build`

Fix any failures before continuing.

</project>

### 2. Determine version bump

Use `$1` if provided. Otherwise, infer from unreleased entries:

- **patch** (x.y.Z) - Only bugfixes and minor changes
- **minor** (x.Y.0) - Any features present
- **major** (X.0.0) - Any breaking changes present

If the bump type cannot be determined, abort and explain why.

### 3. Stage the release

Staging the release means reorganizing the changelog/ directory to reflect the
latest release. This requires two additional inputs:

1. **Title**: Examine the release notes and synthesize a user-facing title that
   highlights the lead topic—the most important change from a user's
   perspective. For example, "User-Defined Functions" or "Kubernetes Support".

2. **Intro**: Create an intro file (e.g., `.intro.md`) summarizing the release
   highlights based on entries in `changelog/unreleased/`. Example:

   > This release adds support for custom templates and improves validation
   > performance. It also fixes several bugs related to YAML parsing.

Then execute staging the release:

```sh
uvx tenzir-changelog release create --patch|--minor|--major \
  --title "Title" \
  --intro-file .intro.md \
  --yes
```

Remove the temporary intro file on success.

### 4. Review release notes

Display the generated release notes:

```sh
uvx tenzir-changelog release notes
```

Proceed with the generated notes. Do not ask for confirmation.

### 5. Bump version

If the project contains files that maintain the authoritative project version,
update them now using the bump type from step 2.

Example files that contain an authoritative version:

- Cargo.toml
- extension.toml
- package.json
- plugin.json

<project type="python">

Run with the bump type from step 2:

```sh
uv version --bump patch|minor|major
```

This updates `pyproject.toml` and `uv.lock`.

</project>

### 6. Publish the release

Preview the release notes:

```sh
uvx tenzir-changelog release notes
```

Stage all changes, then publish (commits, creates git tag, pushes, and creates
GitHub release):

```sh
git add -A
uvx tenzir-changelog release publish --commit --tag --yes
```

### 7. Verify

Confirm:

1. The GitHub release page shows correct release notes
2. GitHub Actions workflows triggered by the tag are passing

<project type="python">

Watch CI until the **Publish to PyPI** workflow completes successfully.

</project>

## Module releases

For module releases, adapt the above release steps as follows:

- Only execute steps 1–5 and skip the remaining ones
- **Stop after "Bump version"**—do not publish or create tags
- Stage only this module's files: `git add <module-root>/`
  - `<module-root>` is the parent directory of module's `changelog/`
  - e.g., if changelog is at `plugins/cpp/changelog/`, stage `plugins/cpp/`
- Commit with message format: `git commit -m "Release <module-name> <version>"`
  - `<module-name>` is the module directory name (e.g., `cpp`, `mylib`)
  - `<version>` is the direct output from `uvx tenzir-changelog release version`
    that includes a `v` prefix
- Report the new version; the parent project handles publishing
