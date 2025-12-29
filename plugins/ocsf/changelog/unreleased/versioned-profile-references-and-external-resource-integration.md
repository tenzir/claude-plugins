---
title: Versioned profile references and external resource integration
type: feature
authors:
  - mavam
  - claude
created: 2025-12-29T05:07:44.183009Z
---

The reference generator now produces versioned profile documentation alongside
classes and objects. Profile attributes vary across OCSF versions, so the static
`profiles.md` now contains only conceptual guidance while detailed attribute
tables live in `references/<version>/profiles/`.

The skill also links to external OCSF articles and FAQs with trigger
descriptions that indicate when to fetch each resource. The guide agent can
retrieve full article content for deep-dive questions about observables, process
parentage, alert modeling, and schema extensions.
