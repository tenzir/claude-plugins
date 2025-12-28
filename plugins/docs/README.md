# Docs

Documentation workflows for Tenzir projects.

## ✨ Features

- 📝 **Writing Documentation Skill**: Guidance on the Diátaxis framework,
  section selection, and Tenzir docs conventions
- 🚀 **Write Command**: Interactive workflow for documenting changes
- 🔍 **Review Command**: Check completeness and style of documentation changes
- 🤖 **Writer Subagent**: Autonomous agent that writes, reviews, and publishes documentation
- 🔎 **Reader Subagent**: Answers questions by navigating the live documentation

## 📦 Installation

```
/plugin install docs@tenzir
```

## 🚀 Usage

### `/docs:write [topic]`

Write or update documentation. Optionally specify a topic, or let it infer from
recent changes.

### `/docs:review`

Review documentation changes for completeness and style issues.

### `docs:writer` subagent

Fully autonomous documentation workflow. Writes docs, reviews them, and creates
a PR for `tenzir/docs`. Operates from within `.docs/` to handle the nested
repository context.

### `docs:reader` subagent

Ask questions about Tenzir. Navigates live documentation at docs.tenzir.com to
find authoritative answers.

### `docs:authoring` skill

Activates when working in `.docs/`. Provides Diátaxis framework guidance and
Tenzir documentation conventions.

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
