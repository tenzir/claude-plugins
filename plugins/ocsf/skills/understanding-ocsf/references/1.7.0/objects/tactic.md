# MITRE Tactic

The MITRE Tactic object describes the ATT&CK® or ATLAS™ Tactic ID and/or name that is associated to an attack.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `name` | string_t | recommended |
| `src_url` | url_t | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`
