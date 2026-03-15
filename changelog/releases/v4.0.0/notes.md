This is the final release of claude-plugins. The repository has been archived and all development continues at tenzir/skills.

## 💥 Breaking changes

### Brand, Python, and Tenzir plugins removed from marketplace

The `brand` and `python` plugins have been removed from the marketplace. Their functionality is now superseded by the new [tenzir/skills](https://github.com/tenzir/skills) repository, which is the new home for these shared agent skills.

The `tenzir` plugin has also been removed from the marketplace.

*By @mavam and @claude.*

### C++ plugin removed from marketplace

The C++ plugin has been removed from the marketplace. Its contents have been migrated into a skill in the [tenzir/tenzir](https://github.com/tenzir/tenzir) repository, where the C++ coding conventions and language server integration live closer to the codebase they apply to.

*By @mavam and @claude.*

### Dev plugin reduced to auto-formatting hook

The `dev` plugin no longer provides changelog, documentation, review, planning, git, or release workflows. It now only provides the automatic file-formatting hook for edited files.

The removed `dev` skills are superseded by the new [tenzir/skills](https://github.com/tenzir/skills) repository.

*By @mavam and @claude.*

### Repository archived

This repository has been archived. All development continues at [tenzir/skills](https://github.com/tenzir/skills). 👋

*By @mavam and @claude.*
