# MITRE D3FEND™ Technique

The MITRE D3FEND™ Technique object describes the leaf defensive technique ID and/or name associated to a countermeasure.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `name` | string_t | recommended |
| `src_url` | url_t | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`
