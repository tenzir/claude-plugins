# Plan Review

Automatically review plans with external AI tools before implementation.

When Claude exits plan mode via `ExitPlanMode`, this plugin sends the plan to
available AI review tools (codex, gemini) for multi-dimensional analysis.

## ✨ Features

- 🔍 **Multi-dimensional review** - Evaluates completeness, correctness,
  feasibility, risk, and clarity
- 🛠️ **Multi-tool support** - Uses codex, gemini, or any CLI-based AI tool
- ⚡ **Parallel execution** - Runs multiple reviewers simultaneously
- 📊 **Severity-based feedback** - P1-P4 scale with blocking for critical issues
- ⚙️ **Configurable** - Environment variables control behavior
- ✅ **Non-blocking by default** - Only P1 (critical) issues block approval

## 🚀 Usage

The plugin activates automatically when you exit plan mode. No manual invocation
needed.

### Configuration

Set environment variables to customize behavior:

| Variable                  | Default        | Description                          |
| ------------------------- | -------------- | ------------------------------------ |
| `PLAN_REVIEW_DIR`         | `.plans`       | Directory containing plan files      |
| `PLAN_REVIEW_TOOLS`       | `codex,gemini` | Comma-separated list of review tools |
| `PLAN_REVIEW_TIMEOUT`     | `120`          | Timeout in seconds per tool          |
| `PLAN_REVIEW_BLOCK_ON_P1` | `true`         | Whether P1 findings block approval   |
| `PLAN_REVIEW_SKIP`        | `false`        | Skip review entirely                 |

### Review Output

Reviews use a P1-P4 severity scale:

| Priority | Name     | Action                    |
| -------- | -------- | ------------------------- |
| P1       | Critical | Blocks approval, must fix |
| P2       | Major    | Shown to user, should fix |
| P3       | Minor    | Filtered (not shown)      |
| P4       | Info     | Filtered (not shown)      |

### Verdict Scale

| Verdict | Meaning                             | Exit Code |
| ------- | ----------------------------------- | --------- |
| APPROVE | Plan is ready for implementation    | 0         |
| REVISE  | Plan needs changes (P2 issues)      | 0         |
| BLOCK   | Plan has critical flaws (P1 issues) | 2         |

## Requirements

At least one CLI tool must be available in PATH:

- `codex` - OpenAI Codex CLI
- `gemini` - Google Gemini CLI

If no tools are available, the hook exits silently.
