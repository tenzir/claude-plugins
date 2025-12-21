This release improves the release workflow with relative versioning support and clearer staging instructions. The documentation has been updated to align with tenzir-changelog v0.17.2, which no longer duplicates release titles in the notes.

## 🔧 Changes

### Clearer release staging instructions

The "Stage the release" step now uses a structured list to explain the required inputs (title and intro) instead of separate paragraphs. This makes the instructions easier to follow.

*By @mavam and @claude.*

### Relative versioning in release workflow

The release workflow now uses `--patch`, `--minor`, or `--major` flags instead of explicit version numbers. The new `release version` command queries the latest version for commit messages, and `release publish` defaults to the latest release when no version is specified.

*By @mavam and @claude.*

### Updated release command for tenzir-changelog v0.17.2

The release command documentation now reflects that `tenzir-changelog` v0.17.2 no longer adds an H1 heading to release notes. GitHub already displays the release title as a page header, so having it inside the notes caused duplication.

*By @mavam and @claude.*
