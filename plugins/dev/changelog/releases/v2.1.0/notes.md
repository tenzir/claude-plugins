This release adds a documentation reader subagent that answers questions about Tenzir by navigating the live documentation at docs.tenzir.com. It also makes the docs:writer subagent fully autonomous by handling PR creation directly from within the .docs/ repository.

## 🚀 Features

### Untitled

Make `docs:writer` subagent fully autonomous. The subagent now handles the entire documentation workflow including PR creation by running all git commands from within `.docs/`. Remove `/docs:pr` command as it was a leaky abstraction that didn't properly handle the nested repo context.

### Documentation reader subagent

The `docs:reader` subagent answers questions about Tenzir by navigating the live documentation at docs.tenzir.com. It fetches the sitemap, follows `.md` links to relevant pages, and provides concise answers with TQL examples.

*By @mavam and @claude.*
