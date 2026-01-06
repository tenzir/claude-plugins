---
name: understanding-ocsf
description: Understand the OCSF schema. Use when working with OCSF, looking up
  classes or objects, normalizing security events, or asking about the schema.
---

# Understanding OCSF

The Open Cybersecurity Schema Framework (OCSF) is a vendor-agnostic schema for
normalizing security telemetry. This skill helps you understand its structure.

## Core Concepts

OCSF organizes cybersecurity data through five interconnected constructs:

1. **Attributes** - Named data types (scalar or complex) that form the
   foundation. See [attributes.md](./attributes.md).

2. **Objects** - Collections of contextually related attributes representing
   entities like Process, User, or File. See [objects.md](./objects.md).

3. **Classes** - Structured sets of attributes and objects describing specific
   security events like authentication or file activity.
   See [classes.md](./classes.md).

4. **Profiles** - Dynamic mix-ins that augment classes with cross-cutting
   attributes (e.g., Cloud, Container, Host). See [profiles.md](./profiles.md).

5. **Extensions** - Mechanisms for expanding the schema without modifying the
   core. See [extensions.md](./extensions.md).

## Hierarchy

```
Attributes  →  Objects  →  Event Classes  →  Categories
   │              │              │               │
   └──────────────┴──────────────┴───────────────┘
                  compose into
```

- **Attributes** populate **Objects**
- **Objects** populate **Event Classes**
- **Event Classes** are organized into **Categories**
- **Profiles** cross-cut multiple Event Classes
- **Extensions** can add new elements at any level

## Categories

OCSF organizes event classes into 8 categories:

| Category    | UID  | Use When                                    |
| ----------- | ---- | ------------------------------------------- |
| System      | 1xxx | OS/endpoint events (files, processes)       |
| Findings    | 2xxx | Security detections and alerts              |
| IAM         | 3xxx | Identity and access (auth, account changes) |
| Network     | 4xxx | Network communication (connections, DNS)    |
| Discovery   | 5xxx | Asset/config state (inventory, software)    |
| Application | 6xxx | Application behavior (API, datastore)       |
| Remediation | 7xxx | Incident response activities                |
| Unmanned    | 8xxx | Unmanned systems (experimental)             |

## Quick Reference

- [Attributes](./attributes.md) - Types, naming conventions
- [Objects](./objects.md) - Reusable entity structures
- [Classes](./classes.md) - Event schemas by category
- [Profiles](./profiles.md) - Cross-cutting augmentations
- [Extensions](./extensions.md) - Schema expansion

## Version-specific References

For detailed class/object/profiles/extensions schemas, read
[references/index.md](./references/index.md).

To generate references for a specific OCSF version not yet available locally
(including non-stable versions like `1.8.0-dev`):

```sh
uv run scripts/generate-references.py --version X.Y.Z
```

## FAQs

Read [schema-faq.md](./references/docs/faqs/schema-faq.md) for questions like:

- How do I create a typical OCSF event?
- How would I populate the `observables` array?
- When should I use a Finding event class?
- When should I use metadata.correlation_uid?
- Can Finding events be correlated with each other too?
- How do I use the Actor object?
- When should I use the session attribute?
- When should I use the unmapped attribute?
- unmapped is of Object type. What does that mean and is it different from JSON or a String type?
- When should I use Authorize Session from Identity and Access Management vs. Web Resource Access Activity from the Application category?
- When should I use HTTP Activity vs. Web Resource Access Activity?
- Can you explain Profiles to me?
- Is there a similarity between OCSF and LDAP (and X.500)?
- How should the attribute suffixes `_uid` and `_id` be used and what are "siblings?"
- How is backwards compatibility managed?
- What changes are not backwards compatible?
- When should I use `status` and when should I use `state` when adding to the schema?
- When should I use a `Module Activity: Load` event and when should I use a `Process Activity: Inject` event

# Articles

### [Defining and Using Observables](./references/docs/articles/defining-and-using-observables.md)

This article explains how observables enrich OCSF events by providing optimized query paths to important data without requiring deep navigation through nested event structures. **Read this when** you need to extract specific data types (like IP addresses or file hashes) from events, want to avoid scanning multiple fields, or are designing query optimization strategies. **Useful for** understanding **observable type_id**, **dictionary types**, **event class attributes**, **object attributes**, and **query optimization** in OCSF schemas.

### [How to Model Alerts with OCSF](./references/docs/articles/modeling-alerts.md)

This article covers the explicit alertable signal mechanism introduced in OCSF 1.4, including the `is_alert` attribute and how it distinguishes alerts from regular events, along with the distinction between Detection Findings, Data Security Findings, and Security Control profile augmented events. **Read this when** you need to flag events requiring immediate attention, design alert processing pipelines, or want to understand how to model **Detection Findings**, **Data Security Findings**, and **Security Control profiles**. **Useful for** SIEM integration, alert routing, **severity_id** interpretation, and understanding **alertable signals** and event prioritization.

### [Patching the Core Schema With Extensions](./references/docs/articles/patching-core-using-extensions.md)

This article demonstrates how extensions can add attributes and objects to existing core classes and objects without creating new extension classes, enabling schema customization while maintaining compatibility with the core schema. **Read this when** you want to extend core event classes with custom attributes, create proprietary enrichment fields, or avoid the complexity of full extension development. **Useful for** understanding **extension mechanism**, **schema patching**, **custom attributes**, **data types**, and how to augment **existing classes and objects** without structural changes.

### [Profiles are Powerful](./references/docs/articles/profiles-are-powerful.md)

This article explores the four modeling approaches using OCSF Profiles (augmentation, native, partially native, and hybrid profiles) and how they function as elegant mix-in attribute sets that cut across event categories and classes. **Read this when** you need to apply focused attribute sets across multiple event classes, want to understand **mix-in** semantics, or are designing flexible event schemas that avoid class explosion. **Useful for** querying events by **profile membership**, understanding **augmentation profiles**, metadata filtering with `profiles[]` arrays, and implementing cross-cutting concerns like Host or Security Control attributes.

### [Representing Process Parentage](./references/docs/articles/representing-process-parentage.md)

This article provides prescriptive guidance on correctly modeling process parentage in endpoint events using OCSF fields like `actor.process`, `process.parent_process`, `process.lineage`, and `process.ancestry`, with particular attention to the creator vs. parent distinction on Windows platforms. **Read this when** you're mapping endpoint detection and response (EDR) process telemetry, need to distinguish between process creators and parents, or are handling **Process Activity: Launch** events. **Useful for** understanding **process hierarchy**, **endpoint security**, **parent_process vs. creator_process** semantics, and correctly populating **actor.process** and **process.parent_process** fields.
