This major release standardizes skill naming with `python:following-conventions` and replaces the plugin-specific release command with the generic `/changelog:release` command. It also adds a dependency upgrade guide for Python projects.

## 🚀 Features

### Add `/changelog:release` command

The changelog plugin now includes a `/changelog:release` command that guides through the release workflow for any project using `tenzir-changelog`. The command auto-detects the project type (e.g., Python via `pyproject.toml`) and applies language-specific steps like quality gates and version bumping.

*By @mavam and @claude.*

### Add changelog add command to plugin

Add the `/changelog:add` command to streamline creating changelog entries. This command provides an interactive workflow guided by the changelog-management skill, reducing the complexity of manual entry creation. Documentation has been reorganized to feature this new command and simplify the skill guidance.

*By @mavam and @claude.*

### Add releaser subagent to changelog plugin

Add a `releaser` subagent to the changelog plugin to automate the release workflow using `tenzir-changelog`. This subagent guides projects through the complete release process, including version determination, release notes generation, and publishing to GitHub.

*By @mavam and @claude.*

## 🔧 Changes

### Add Markdown formatting best practice

The skill now advises to use backticks for code and technical terms, and to use emphasis and bold where it improves clarity.

*By @mavam.*

### Document multi-value flags and human author requirement

The example now shows `--author`, `--component`, and `--pr` passed multiple times. Added note that every entry requires at least one human author.

*By @mavam.*

### Improve changelog skill discoverability

Rewrite the `changelog-management` skill description to focus on concrete trigger moments (finishing features, wrapping up commits and PRs) rather than tool-centric language.

*By @mavam and @claude.*

### Improve component awareness in changelog workflow

The `/changelog:add` workflow now checks `changelog/config.yaml` for available components before creating entries. When a component clearly fits the change, it should be selected. Cross-cutting changes (e.g., CI work) can still omit components.

*By @mavam and @claude.*

### Improve releaser agent reliability with Sonnet model and process guardrails

Upgrade the releaser agent to use Claude Sonnet instead of Haiku for improved reliability and constraint adherence. Add a "Follow the Process" section that explicitly instructs the agent to use the `tenzir-changelog` CLI and `/changelog:release` command rather than bypassing the workflow with direct `gh` or `git tag` commands, ensuring consistent and safe release practices.

*By @mavam and @claude.*

### Use --co-author for AI-assisted development

Use `--co-author` for AI-assisted development instead of `--author`. The CLI infers the primary author automatically; `--co-author` appends to the list while `--author` overrides it entirely.

*By @mavam and @claude.*

### Use `--description-file` instead of `--description`

The `--description-file` flag reads the description from a file, avoiding shell escaping issues that can occur with inline `--description` arguments.

*By @mavam.*

## 🐞 Bug fixes

### Always pass --description to skip interactive editor

The skill now instructs Claude to always pass `--description` when adding entries to avoid launching an interactive editor.

*By @mavam.*

### Clarify entry type selection criteria in changelog skill

The skill now provides clearer guidance on when to use `bugfix` vs `change` entry types, reducing misclassification.

*By @mavam and @claude.*

### Clarify publish step to use release notes for preview

The /changelog:release command now recommends using 'release notes' to preview before publishing instead of running 'release publish' without --yes.

*By @mavam and @claude.*

### Fix release command documentation

Updated the /changelog:release command documentation to use `release notes` instead of the deprecated `release show` command, matching the current tenzir-changelog API.

*By @mavam.*
