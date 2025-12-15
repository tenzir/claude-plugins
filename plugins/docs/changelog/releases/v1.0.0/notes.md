This is the first stable release of the docs plugin. It introduces a streamlined workflow with dedicated commands for documentation management, replacing the previous agent-based approach. The plugin now features intelligent path detection, SSH-based repository cloning, and a simplified directory structure.

## 💥 Breaking changes

### Refactor docs plugin workflow: remove agent, add dedicated commands

Refactor documentation workflow to remove the redundant `docs:manager` agent.

Users should now use two dedicated commands instead:

- `/docs:write-docs` for creating and updating documentation (now with inlined initialization)
- `/docs:pr` for creating pull requests with documentation changes

The plugin now includes a shared `detect-docs-root.sh` script that intelligently detects whether you're in the docs repository or a project that uses an external docs checkout. The `/docs:write-docs` command now handles initialization automatically—no need to manually launch an agent first.

This simplifies the workflow and makes the documentation pipeline more intuitive and discoverable.

*By @mavam and @claude.*

## 🚀 Features

### Add path detection to docs plugin

The manager agent now auto-detects whether it's running directly in the `tenzir/docs` repository or needs to clone it to `.tenzir-docs/`. This enables seamless use of the plugin from within the docs repo itself.

*By @mavam and @claude.*

## 🔧 Changes

### Simplify docs plugin directory name to .docs

Simplify the documentation repository directory name from `.tenzir-docs` to `.docs` for consistency and clarity. When cloning the Tenzir docs repository in external projects, it now uses the shorter `.docs` directory name instead of the longer `.tenzir-docs` prefix.

*By @mavam and @claude.*

### Use SSH URL for docs repository clone

The `/docs:write-docs` command now clones the documentation repository using SSH (`git@github.com:tenzir/docs.git`) instead of HTTPS. This enables seamless authentication for users with SSH keys configured, avoiding credential prompts.

*By @mavam and @claude.*
