# Edge

Represents a connection or relationship between two nodes in a graph.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `data` | json_t | optional |
| `is_directed` | boolean_t | optional |
| `name` | string_t | recommended |
| `relation` | string_t | recommended |
| `source` | string_t | required |
| `target` | string_t | required |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`
