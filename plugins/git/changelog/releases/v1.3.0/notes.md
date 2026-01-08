This release introduces autonomous commit workflows that automatically split unrelated changes into separate commits without prompting. The new `/git:address-pr-comments` command systematically addresses GitHub PR review comments, creating commits and resolving threads automatically. The commit workflow now includes expanded static checks (linters, type checkers, formatters) before staging changes. Several bugfixes improve multi-line review comment handling and branch pushing reliability.

## 🔧 Changes

### Autonomous commit workflow

The `/git:commit` command now runs in a forked context with autonomous decision-making. When staged changes contain multiple unrelated modifications, the command automatically splits them into separate commits without prompting. It always creates new commits rather than amending unless explicitly requested.

The separate `committer` subagent has been removed since the command now handles autonomous execution directly.

*By @mavam and @claude.*

### Expanded static checks in commit workflow

The commit workflow now runs static checks before analyzing whether to split staged changes into multiple commits. The step explicitly includes linters, type checkers, and formatters, checking `pyproject.toml`, `package.json`, or `Makefile` for configured tools and skipping if none are found.

*By @mavam and @claude.*

### Immediate push after each PR comment fix

When addressing PR comments, the workflow now pushes after each commit before replying to the reviewer. This ensures the referenced commit SHA is immediately visible on GitHub when the reviewer sees the response.

*By @mavam and @claude.*

### Pre-commit linting step

The `/git:commit` command now includes a linting step before staging and committing changes. If a project has a linter configured, it runs automatically to catch issues early.

*By @mavam and @claude.*
