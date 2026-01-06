# Software Component

The Software Component object describes characteristics of a software component within a software package.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `author` | string_t | recommended |
| `hash` | object (fingerprint) | optional |
| `license` | string_t | optional |
| `name` | string_t | required |
| `purl` | string_t | recommended |
| `related_component` | string_t | recommended |
| `relationship` | string_t | optional |
| `relationship_id` | integer_t | recommended |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `version` | string_t | required |
