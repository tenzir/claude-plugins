# Auto-Update

Automatically updates the `tenzir` marketplace when a Claude Code session starts.

## ✨ Features

Claude Code does not yet support automatic marketplace updates on session
start. This plugin is a workaround until [anthropics/claude-code#10265][issue]
is resolved.

- 🔄 **Automatic**: Updates run silently on every session start
- 🔒 **Safe**: Uses the official `claude plugin marketplace update` command
- 🗑️ **Temporary**: Uninstall once the upstream feature lands

[issue]: https://github.com/anthropics/claude-code/issues/10265

## 📦 Installation

```
/plugin install auto-update@tenzir
```

## ⚙️ How it works

On every session start, the plugin runs:

```bash
claude plugin marketplace update tenzir
```

The update runs silently in the background and does not interrupt your session.
