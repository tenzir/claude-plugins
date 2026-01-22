# Dev

Developer utilities for Tenzir projects. Provides documentation workflows with
the Diátaxis framework and technical writing guidance based on Google's style
guide.

## ✨ Features

- 📚 **Docs Authoring Skill**: Guidance on the Diátaxis framework, section
  selection, and Tenzir docs conventions
- ✍️ **Technical Writing Skill**: Style guidelines for clear technical
  documentation following Google's developer documentation style guide
- 🤖 **Docs Updater Subagent**: Autonomous agent that writes, reviews, and
  publishes documentation

## 🚀 Usage

### Updating documentation

For hands-off documentation, delegate to the docs updater subagent:

```
Document the latest changes @dev:docs-updater
```

The subagent writes docs, reviews them, runs linting, and creates a PR against
`tenzir/docs`--all without further input.

## 🔧 Configuration

The plugin clones `github.com/tenzir/docs` to `.docs/` in your project root if
it doesn't exist yet.

A sync hook keeps `.docs/` up-to-date when editing documentation files. It
fetches updates at most once per day and blocks on merge conflicts so Claude can
help resolve them.

## Documentation sections

The Diátaxis framework organizes documentation into four quadrants:

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
