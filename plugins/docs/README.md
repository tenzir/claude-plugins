# Docs

Documentation workflows for Tenzir projects.

## ✨ Features

- 📝 **Writing Documentation Skill**: Guidance on the Diátaxis framework,
  section selection, and Tenzir docs conventions
- 🚀 **Write Command**: Interactive workflow for documenting changes
- 🔍 **Review Command**: Check completeness and style of documentation changes
- 🔀 **PR Command**: Create pull requests for documentation changes
- 🤖 **Writer Subagent**: Opus-based agent that handles writing and reviewing documentation autonomously
- 🔎 **Reader Subagent**: Haiku-based agent that answers questions by navigating the live documentation

## 📦 Installation

```
/plugin install docs@tenzir
```

## ⚙️ How it works

### Writing documentation skill

Automatically loaded when working with documentation. Provides:

- The Diátaxis framework (Tutorials, Guides, Explanations, Reference) plus
  Integrations
- Decision tree for choosing the right documentation section
- File format conventions (`.mdx`)
- Frontmatter templates
- Integration with the `prose:technical-writing` skill for style guidance

### Write command

Interactive workflow via `/docs:write [topic]`:

1. Initializes docs repository if needed
2. Determines what to document (topic, changes, or last commit)
3. Selects the appropriate section using Diátaxis
4. Writes or updates documentation
5. Runs linting validation

### Review command

Review documentation changes via `/docs:review`:

1. Identifies changed files in `.docs/`
2. Starts the local preview server
3. Checks completeness (reference/guide alignment, cross-section consistency)
4. Reviews writing style against `prose:technical-writing` skill
5. Summarizes issues and offers to fix them

### PR command

Create a pull request via `/docs:pr`:

1. Checks for uncommitted changes
2. Runs linting and build checks
3. Creates a topic branch and commits
4. Opens a PR with `gh pr create`

### Writer subagent

The `docs:writer` subagent autonomously handles the documentation workflow. It
executes `/docs:write` followed by `/docs:review`, then halts to let you inspect
the results before deciding to create a PR. The subagent:

1. Writes documentation (initializes repo, selects section, creates/updates files)
2. Reviews the changes (completeness, style)
3. Summarizes what was done and stops

Use this subagent when you want to delegate documentation creation entirely. It
makes autonomous decisions about section selection, style fixes, and reports any
completeness gaps.

### Reader subagent

The `docs:reader` subagent answers questions about Tenzir by navigating the live
documentation at docs.tenzir.com. Use it when you need authoritative answers
about TQL operators, functions, platform features, or how to use Tenzir.

## 🔧 Configuration

The plugin clones `github.com/tenzir/docs` to `.docs/` in your project root if
it doesn't exist yet.

### Sync hook

A `PreToolUse` hook keeps `.docs/` synchronized when editing documentation
files. The hook fetches updates only when the last sync was more than 24 hours
ago (tracked in `.docs/.git/claude-last-sync`). The hook exits early when
running inside the `tenzir/docs` repository itself.

```
                    ┌─────────────────────┐
                    │  Edit/Write .docs/* │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │  .docs/.git exists? │
                    └──────────┬──────────┘
                               │
                      no ◄─────┴─────► yes
                       │               │
                       ▼               ▼
                    ┌──────┐  ┌─────────────────────┐
                    │ exit │  │ Last sync < 24h?    │
                    └──────┘  └──────────┬──────────┘
                                         │
                                yes ◄────┴────► no (stale)
                                 │              │
                                 ▼              ▼
                              ┌──────┐  ┌─────────────────────┐
                              │ exit │  │ git fetch origin    │
                              └──────┘  │ (update timestamp)  │
                                        └──────────┬──────────┘
                                                   │
                              ┌─────────────────────────────────────┐
                              │           Which branch?             │
                              └──────────────────┬──────────────────┘
                                                 │
                           main ◄────────────────┴────────────► topic
                            │                                     │
                            ▼                                     ▼
               ┌─────────────────────┐               ┌─────────────────────┐
               │   Worktree clean?   │               │  Branch merged to   │
               └──────────┬──────────┘               │    origin/main?     │
                          │                          └──────────┬──────────┘
                 yes ◄────┴────► no                             │
                  │              │                     yes ◄────┴────► no
                  ▼              ▼                      │              │
     ┌────────────────────┐  ┌──────────────┐          ▼              ▼
     │ Can fast-forward?  │  │Would merge   │  ┌──────────────┐ ┌──────────────┐
     └─────────┬──────────┘  │  cleanly?    │  │warn: branch  │ │Would merge   │
               │             └──────┬───────┘  │  was merged  │ │  cleanly?    │
      yes ◄────┴────► no            │          └──────────────┘ └──────┬───────┘
       │              │        yes ◄─┴─► no                            │
       ▼              ▼         │       │                         yes ◄─┴─► no
  ┌─────────┐  ┌────────────┐   ▼       ▼                          │       │
  │  pull   │  │  Diverged? │ exit  ┌────────────┐                 ▼       ▼
  │ --ff    │  └─────┬──────┘       │block: merge│               exit  ┌────────────┐
  └─────────┘        │              │ conflicts  │                     │block: may  │
                yes ◄─┴─► no        └────────────┘                     │ conflict   │
                 │       │                                             └────────────┘
                 ▼       ▼
          ┌───────────┐ exit
          │block: main│ (ahead
          │ diverged  │  is ok)
          └───────────┘
```

**Non-blocking warnings** (verbose mode only): merged topic branches, network
issues.

**Blocking errors** (shown to Claude): diverged main, merge conflicts. These
prevent the edit and let Claude help resolve the issue.

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
