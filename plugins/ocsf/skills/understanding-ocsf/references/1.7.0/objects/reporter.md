# Reporter

The entity from which an event or finding was reported.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `hostname` | hostname_t | recommended |
| `ip` | ip_t | recommended |
| `name` | string_t | recommended |
| `org` | object (organization) | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `hostname`, `ip`, `name`, `uid`
