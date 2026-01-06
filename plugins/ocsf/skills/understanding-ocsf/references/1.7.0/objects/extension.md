# Schema Extension

The OCSF Schema Extension object provides detailed information about the schema extension used to construct the event. The schema extensions are registered in the  [https://github.com/ocsf/ocsf-schema/blob/main/extensions.md](extensions.md file.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `name` | string_t | recommended |
| `uid` | string_t | recommended |
| `version` | string_t | required |

## Constraints

At least one of: `name`, `uid`
