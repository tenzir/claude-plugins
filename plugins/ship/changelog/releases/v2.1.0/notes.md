This release improves code reviews with a two-dimensional rating system that separates severity from confidence. It also adds support for Claude Code plugin and Node.js project types during releases, and saves review output persistently in a hierarchical directory structure.

## 🚀 Features

### Claude plugin project type detection

The `/ship:release` command now automatically detects Claude Code plugins and knows to update the version in `.claude-plugin/plugin.json`. This eliminates manual version file discovery during plugin releases.

*By @mavam and @claude.*

### Node.js version bumping in release workflow

The `ship:release` skill now supports Node.js projects during the version bumping step. It uses `npm version --no-git-tag-version` to update `package.json`, then provides guidance for regenerating the appropriate lock file based on which package manager the project uses (npm, yarn, pnpm, or bun).

*By @mavam and @claude.*

## 🔧 Changes

### Agent color validation

The validation script now enforces valid agent color values, ensuring that agent frontmatter only uses supported colors (red, blue, green, yellow, purple, orange, pink, cyan).

The finalizer agent color changed from magenta to red to comply with the validation requirements. This ensures consistent agent appearance across the marketplace.

*By @mavam and @claude.*

### Persistent review output in hierarchical directory

Code reviews are now saved persistently in a hierarchical `.reviews/` directory instead of being deleted after display.

The `ship:review` command creates a timestamped directory structure:

```
.reviews/
  YYYY-MM-DD/
    <session-id>/
      ux.md
      arch.md
      docs.md
      security.md
      tests.md
      consistency.md
```

This lets you inspect complete review findings after the review completes. The command displays a summary of high-confidence findings (80+) but saves all findings with their confidence scores to the files for later reference.

*By @mavam and @claude.*

### Refined changelog bot comment styling

The changelog bot now displays PR comment suggestions with cleaner typography. Reaction options appear in a smaller, lighter font with middle dot separators instead of pipes, and command argument hints use the same elegant separator style.

The comment footer reads "This changelog was automatically generated. React to proceed:" followed by emoji reactions, making it clearer that the suggestions are automated and actionable.

*By @mavam and @claude.*

### Two-dimensional severity and confidence ratings for code reviews

Code review findings now include independent severity and confidence ratings for better prioritization.

The `reviewing-changes` skill defines a two-dimensional rating system:

- **Severity** (P1-P4) measures the impact of a finding from critical security issues to cosmetic improvements
- **Confidence** (0-100) measures certainty that the finding is real

The `review` command computes action emojis from these dimensions:

- 🔴 Act now — P1-P2 issues with high confidence (80%+)
- 🟠 Investigate — Potentially critical issues or confirmed minor issues
- 🟡 Consider — Lower-confidence moderate issues or confirmed trivial issues
- ⚪ Optional — Low-confidence trivial suggestions

This replaces the previous single-dimension confidence scoring system where severity was implied from the confidence score. The new system lets reviewers independently assess "how bad is this?" and "how sure am I?" for more nuanced findings.

*By @mavam and @claude.*
