# Dev

Developer utilities including documentation, changelogs, code review, and
releases. Provides documentation workflows with the Diataxis framework,
technical writing guidance based on Google's style guide, changelog management
with tenzir-ship, and parallel code review with specialized reviewers.

## ✨ Features

- 📚 **Docs Authoring Skill**: Guidance on the Diataxis framework, section
  selection, and Tenzir docs conventions
- ✍️ **Technical Writing Skill**: Style guidelines for clear technical
  documentation following Google's developer documentation style guide
- 📝 **Changelog Adder Agent**: Creates changelog entries for PR changes,
  suitable for CI automation
- 🔍 **Code Review Command**: Spawns specialized reviewers in parallel to
  analyze changes with confidence-scored findings
- 🚀 **Release Command**: Guides through releasing a project with tenzir-ship
- 🔄 **Finalize Command**: Adds changelog entry, commits, and pushes changes

## 🚀 Usage

### Updating documentation

For hands-off documentation, delegate to the docs updater subagent:

```
Document the latest changes @dev:docs-updater
```

The subagent writes docs, reviews them, runs linting, and creates a PR against
`tenzir/docs`--all without further input.

### Creating changelog entries

Spawn the changelog adder agent to create a changelog entry for your changes:

```
Create a changelog entry @dev:changelog-adder
```

The agent analyzes your changes and creates an appropriate changelog entry using
tenzir-ship.

### Code review

Run parallel code review on your changes:

```
/dev:review
```

This spawns specialized reviewers (security, architecture, tests, UX,
readability, docs, performance) that analyze your changes in parallel and report
findings with confidence scores.

### Releasing

Guide through a release:

```
/dev:release [patch|minor|major]
```

### Finalizing changes

Add changelog, commit, and push in one command:

```
/dev:finalize
```

## 🔧 Configuration

The plugin clones `github.com/tenzir/docs` to `.docs/` in your project root if
it doesn't exist yet.

A sync hook keeps `.docs/` up-to-date when editing documentation files. It
fetches updates at most once per day and blocks on merge conflicts so Claude can
help resolve them.

## Documentation sections

The Diataxis framework organizes documentation into four quadrants:

| Section      | Use for                                         |
| ------------ | ----------------------------------------------- |
| Tutorials    | Learning-oriented projects ("I want to learn")  |
| Guides       | Task-focused how-tos ("I want to accomplish X") |
| Explanations | Conceptual content ("I want to understand")     |
| Reference    | Technical specs ("I need facts")                |

Separately, Tenzir has an Integrations section for third-party products:

| Section      | Use for                                          |
| ------------ | ------------------------------------------------ |
| Integrations | Third-party products ("How do I use X + Tenzir") |
