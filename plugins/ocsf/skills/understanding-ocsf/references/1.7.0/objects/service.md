# Service

The Service object describes characteristics of a service, ` e.g. AWS EC2. `

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `labels` | string_t | optional |
| `name` | string_t | recommended |
| `tags` | object (key_value_object) | optional |
| `uid` | string_t | recommended |
| `version` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`

## Used By

- [authentication](../classes/authentication.md)
- [service_query](../classes/service_query.md)
