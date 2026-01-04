Initial release of the OCSF plugin with comprehensive schema navigation, versioned documentation, and a dedicated guide subagent.

## 🚀 Features

### Lazy OCSF reference generation

OCSF reference documentation is now generated lazily on first use. Instead of blocking session start with a hook, the skill instructs Claude to run the generator script when references are missing. The script now uses the OCSF server's REST API (`/api/version`, `/export/schema`) instead of HTML scraping, making generation faster and more reliable (~4 seconds for latest version).

_By @mavam and @claude._

### OCSF guide subagent for schema questions

The `ocsf:guide` subagent answers questions about OCSF classes, objects, attributes, and profiles. It invokes the understanding-ocsf skill and uses Haiku for fast, focused responses.

_By @mavam and @claude._

### Versioned profile references and external resource integration

The reference generator now produces versioned profile documentation alongside classes and objects. Profile attributes vary across OCSF versions, so the static `profiles.md` now contains only conceptual guidance while detailed attribute tables live in `references/<version>/profiles/`.

The skill also links to external OCSF articles and FAQs with trigger descriptions that indicate when to fetch each resource. The guide agent can retrieve full article content for deep-dive questions about observables, process parentage, alert modeling, and schema extensions.

_By @mavam and @claude._

## 🔧 Changes

### Versioned classes and objects overviews

Classes and objects now have version-specific overview documentation, following the same pattern established for profiles. The static `classes.md` and `objects.md` files contain only conceptual guidance, while the generator creates `classes-overview.md` and `objects-overview.md` in `references/<version>/` with complete listings for each OCSF version. This ensures the skill documentation stays accurate as classes and objects are added or modified across OCSF releases.

_By @mavam and @claude._
