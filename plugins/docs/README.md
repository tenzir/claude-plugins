# Docs

Documentation workflows for Tenzir projects. Guides you through the Diátaxis
framework for structuring content, and provides commands and agents for writing,
reviewing, and publishing documentation.

## ✨ Features

- 📚 **Authoring Skill**: Guidance on the Diátaxis framework, section selection,
  and Tenzir docs conventions
- ✍️ **Write Command**: Interactive workflow for documenting changes
- 👀 **Review Command**: Check completeness and style of documentation changes
- 🤖 **Writer Subagent**: Autonomous agent that writes, reviews, and publishes
  documentation
- 🔍 **Reader Subagent**: Answers questions by navigating the live documentation

## 🚀 Usage

### Writing documentation

Document your recent changes:

```
/docs:write
```

The command analyzes uncommitted changes (or the last commit) and creates
documentation in the appropriate Diataxis section.

Document a specific topic:

```
/docs:write the new batch operator
```

### Reviewing documentation

Check your documentation changes for completeness and style:

```
/docs:review
```

This starts a preview server at `localhost:4321`, checks if related sections
need updates (e.g., a new operator may need both reference and guide content),
and reports style issues.

### Autonomous documentation workflow

For hands-off documentation, delegate to the writer subagent:

```
Document the latest changes @docs:writer
```

The subagent writes docs, reviews them, runs linting, and creates a PR against
`tenzir/docs`--all without further input.

### Looking up documentation

Ask questions about Tenzir without leaving your editor:

```
How does the batch operator work? @docs:reader
```

The reader subagent navigates docs.tenzir.com and returns authoritative answers
with TQL examples quoted directly from the documentation.

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
