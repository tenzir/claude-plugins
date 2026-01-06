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

## Articles

### [Defining and Using Observables](./references/docs/articles/defining-and-using-observables.md)

Covers how to define and populate the `observables` array in OCSF events. Read
this when enriching events with queryable indicators like IP addresses, hashes,
or domain names.

### [How to Model Alerts with OCSF](./references/docs/articles/modeling-alerts.md)

Explains when to use the `is_alert` attribute vs. Detection Finding vs. Security
Control event classes. Read this when mapping security alerts or detections.

### [Patching the Core Schema With Extensions](./references/docs/articles/patching-core-using-extensions.md)

Shows how to add attributes to core schema objects without creating new event
classes. Read this when you need to extend OCSF for vendor-specific fields.

### [Profiles are Powerful](./references/docs/articles/profiles-are-powerful.md)

Covers profile modeling approaches: augmentation, native, and hybrid. Read this
when deciding how to apply Cloud, Container, or Host profiles to events.

### [Representing Process Parentage](./references/docs/articles/representing-process-parentage.md)

Explains process parent/creator relationships in endpoint events. Read this when
mapping process trees or parent-child relationships in security telemetry.
