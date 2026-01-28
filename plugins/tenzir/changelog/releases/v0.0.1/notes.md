This release introduces the `tenzir:guide` subagent for fast documentation lookups and adds dynamic documentation syncing from the latest Tenzir release.

## 🚀 Features

### Dynamic documentation loading for tenzir plugin

The `tenzir:docs` skill now dynamically loads documentation from the latest Tenzir GitHub release, ensuring you always have access to the most current information without waiting for plugin updates.

The sync process uses two complementary strategies. At session start, a background sync attempts to fetch the latest release tarball (`tenzir-skill.tar.gz`) with a 24-hour cache to avoid redundant downloads. If you use the skill and the cache has expired, a blocking sync ensures the documentation is up to date before the skill loads. This hybrid approach balances performance with freshness.

You can control sync behavior with the `--non-blocking` option for background downloads. The sync also patches the skill name to match the directory structure (`docs` instead of `tenzir`) and gracefully falls back to cached versions during network errors.

*By @mavam and @claude.*

### Guide subagent for answering Tenzir questions

The `tenzir:guide` subagent provides fast, accurate answers to Tenzir questions by searching the local documentation. Use it to ask about TQL pipelines, operators, functions, node configuration, platform setup, and integrations. The agent leverages the `tenzir:docs` skill to navigate documentation and synthesize responses with citations, eliminating the need to manually search through documentation files.

*By @mavam and @claude.*
