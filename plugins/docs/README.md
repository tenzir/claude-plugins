# Docs

Documentation workflows for Tenzir projects.

## Features

- 📝 **Writing Documentation Skill**: Guidance on the Diátaxis framework,
  section selection, and Tenzir docs conventions
- 🔧 **Manager Agent**: Initialize, update, preview, and build the docs
  repository
- 🚀 **Write Docs Command**: Interactive workflow for documenting changes

## Installation

```
/plugin install docs@tenzir
```

## How it works

### Writing documentation skill

Automatically loaded when working with documentation. Provides:

- The Diátaxis framework (Tutorials, Guides, Explanations, Reference) plus
  Integrations
- Decision tree for choosing the right documentation section
- File format conventions (`.md`, `.mdx`, `.mdoc`)
- Frontmatter templates
- Integration with the `technical-writing` skill for style guidance

### Manager agent

Lightweight agent (Haiku) for repository operations:

| Mode         | Description                           |
| ------------ | ------------------------------------- |
| `initialize` | Clone docs repo, install dependencies |
| `update`     | Pull latest changes                   |
| `preview`    | Start dev server at localhost:4321    |
| `build`      | Build production site                 |
| `pr`         | Create PR for documentation changes   |

Invoke via `docs:manager <mode>`.

### Write docs command

Interactive workflow via `/docs:write-docs [topic]`:

1. Verifies docs repository is available
2. Determines what to document (topic, changes, or last commit)
3. Selects the appropriate section using Diátaxis
4. Writes or updates documentation
5. Runs linting validation

## Configuration

The plugin clones `github.com/tenzir/docs` to `.tenzir-docs/` in your project
root. This location is consistent across all Tenzir repositories and is
automatically added to `.gitignore`.

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
