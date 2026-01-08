This release improves OCSF documentation synchronization with content-based change detection and transitions to pre-committed schema references. The guide agent now uses Claude Sonnet for enhanced reasoning on complex schema questions.

## 🔧 Changes

### Pre-commit OCSF references with automated updates

OCSF schema references and documentation articles are now pre-committed to the repository instead of being lazily generated or fetched remotely. A GitHub Action checks daily for new OCSF releases and documentation updates, automatically filing PRs when changes are detected. Users can still generate references for specific versions locally using `generate-references.py`.

*By @mavam and @claude in #4.*

### Sonnet model for guide agent

The guide agent now uses Claude Sonnet instead of Haiku, providing improved reasoning for complex OCSF schema questions.

*By @mavam and @claude.*

## 🐞 Bug fixes

### Content-based sync for OCSF documentation

The OCSF docs sync workflow now compares actual file content instead of tracking upstream commit SHAs. This prevents unnecessary syncs when the ocsf-docs repository has infrastructure-only changes that don't affect articles or FAQs.

*By @mavam and @claude.*
