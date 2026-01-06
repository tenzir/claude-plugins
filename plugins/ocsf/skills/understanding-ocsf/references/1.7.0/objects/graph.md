# Graph

A graph data structure representation with nodes and edges.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `desc` | string_t | optional |
| `edges` | object (edge) | optional |
| `is_directed` | boolean_t | optional |
| `name` | string_t | recommended |
| `nodes` | object (node) | required |
| `query_language` | string_t | optional |
| `query_language_id` | integer_t | recommended |
| `type` | string_t | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`
