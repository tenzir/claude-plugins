# MITRE Sub-technique

The MITRE Sub-technique object describes the ATT&CK® or ATLAS™ Sub-technique ID and/or name associated to an attack.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `name` | string_t | recommended |
| `src_url` | url_t | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`
