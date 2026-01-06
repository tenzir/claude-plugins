# MITRE Mitigation

The MITRE Mitigation object describes the ATT&CK® or ATLAS™ Mitigation ID and/or name that is associated to an attack.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `countermeasures` | object (d3fend) | optional |
| `name` | string_t | recommended |
| `src_url` | url_t | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`
