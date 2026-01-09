This release introduces a version-agnostic release workflow that simplifies publishing and CI integration, allowing commands to default to the latest release version. It also improves changelog browsing by sorting module entries chronologically rather than grouping them by project.

## 🔧 Changes

### Improved context gathering for changelog entries

The `/changelog:add` command now provides clearer guidance for determining which commits to include. When no PR exists, the command walks backwards through git history to identify a coherent sequence of commits, stopping at the first commit with an existing changelog entry.

*By @mavam and @claude.*
