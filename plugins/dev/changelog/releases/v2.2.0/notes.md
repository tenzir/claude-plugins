This release restores the `/docs:pr` command with enhanced cross-referencing capabilities that automatically link documentation PRs with parent project PRs. It also improves the synchronization workflow by automatically cloning the documentation repository when needed, eliminating manual setup steps.

## 🚀 Features

### Cross-referencing PR command

Restore `/docs:pr` command. Now automatically detects if the parent project has an open PR and links both PRs to each other.

## 🐞 Bug fixes

### Automatic clone of documentation repository

The synchronization script now automatically clones the docs repository when `.docs/` doesn't exist, instead of silently exiting. The hook also triggers on Read operations to ensure the repository is available earlier in the workflow.

Additionally, the duplicate `hooks/sync-docs.sh` script was removed in favor of the more sophisticated `scripts/synchronize-docs.sh`.

*By @mavam and @claude.*
