# Rule

The Rule object describes characteristics of a rule associated with a policy or an event.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `category` | string_t | optional |
| `desc` | string_t | optional |
| `name` | string_t | recommended |
| `type` | string_t | optional |
| `uid` | string_t | recommended |
| `version` | string_t | optional |

## Constraints

At least one of: `name`, `uid`
