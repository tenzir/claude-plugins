# MITRE D3FEND™ Tactic

The MITRE D3FEND™ Tactic object describes the tactic ID and/or name that is associated to an attack.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `name` | string_t | recommended |
| `src_url` | url_t | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`
