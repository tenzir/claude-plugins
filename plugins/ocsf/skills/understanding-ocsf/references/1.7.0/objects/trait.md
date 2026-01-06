# Trait

Describes a characteristic or feature of an entity that was observed. For example, this object can be used to represent specific characteristics derived from events or findings that can be surfaced as distinguishing traits of the entity in question.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `category` | string_t | optional |
| `name` | string_t | recommended |
| `type` | string_t | optional |
| `uid` | string_t | recommended |
| `values` | string_t | optional |

## Constraints

At least one of: `name`, `uid`
