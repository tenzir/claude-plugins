---
category: breaking
---

Make `docs:writer` subagent fully autonomous. The subagent now handles the
entire documentation workflow including PR creation by running all git commands
from within `.docs/`. Remove `/docs:pr` command as it was a leaky abstraction
that didn't properly handle the nested repo context.
