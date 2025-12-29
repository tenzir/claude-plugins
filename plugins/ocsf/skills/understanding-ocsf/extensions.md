# Extensions

Extensions allow vendors and organizations to expand OCSF without modifying the
core schema. They enable customization while maintaining compatibility.

> The extension mechanism documented here is stable across OCSF versions.
> Specific extension classes and their UIDs may vary between versions.

## What Extensions Can Add

Extensions can introduce:

- **Attributes** - New data fields
- **Objects** - New reusable entity types
- **Event Classes** - New event types within categories
- **Categories** - Entirely new event categories
- **Profiles** - New cross-cutting attribute overlays

## Built-in Extensions

OCSF includes platform-specific extensions:

### Linux Extension

Adds Linux-specific attributes via the `linux/linux_users` profile:

- `euid` - Effective user ID
- `egid` - Effective group ID
- `auid` - Audit user ID
- Additional Linux-specific group attributes

### Windows Extension

Adds Windows-specific event classes to System Activity (1xxx):

| UID    | Class                           | Description                 |
| ------ | ------------------------------- | --------------------------- |
| 201001 | `win/registry_key_activity`     | Registry key operations     |
| 201002 | `win/registry_value_activity`   | Registry value operations   |
| 201003 | `win/windows_resource_activity` | Windows resource operations |
| 201004 | `win/windows_service_activity`  | Windows service operations  |

Windows also adds Discovery classes (205xxx) for registry and prefetch queries.

## Extension Naming Conventions

### UID Ranges

Extensions receive unique identifier ranges:

- Core classes: 1-999 within each category
- Extension classes: 200000+ (e.g., 201001 for Windows registry)

### Attribute Naming

Vendor extensions should prefix attribute names with a 3-letter identifier:

- `aws_` for AWS-specific attributes
- `gcp_` for Google Cloud attributes
- `msft_` for Microsoft attributes

This prevents collision with core schema names.

## Creating Extensions

Extensions are defined separately from the core schema:

1. **Define the extension** in a separate schema file
2. **Assign unique IDs** within allocated ranges
3. **Version independently** while maintaining major version compatibility
4. **Register publicly** in the OCSF Extensions Registry (optional)

## When to Use Extensions

Use extensions when you need:

- **Vendor-specific data** that doesn't fit core schema
- **Platform-specific events** (Windows, Linux, macOS)
- **Domain-specific classes** for specialized use cases
- **Experimental features** before proposing to core

## Extension vs Profile

| Aspect     | Extension                        | Profile                             |
| ---------- | -------------------------------- | ----------------------------------- |
| Scope      | Adds new schema elements         | Augments existing classes           |
| Structure  | New classes, objects, attributes | Attribute overlays only             |
| Activation | Separate schema definition       | Applied per-event                   |
| Use case   | Platform/vendor-specific events  | Cross-cutting context (cloud, host) |

Extensions add new capabilities; profiles add optional context to existing
classes.
