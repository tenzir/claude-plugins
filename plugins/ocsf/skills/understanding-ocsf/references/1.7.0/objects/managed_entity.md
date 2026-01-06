# Managed Entity

The Managed Entity object describes the type and version of an entity, such as a user, device, or policy.  For types in the `type_id` enum list, an associated attribute should be populated.  If the type of entity is not in the `type_id` list, information can be put into the `data` attribute, `type_id` should be 'Other' and the `type` attribute should label the entity type.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `data` | json_t | optional |
| `device` | object (device) | recommended |
| `email` | object (email) | recommended |
| `group` | object (group) | recommended |
| `location` | object (location) | optional |
| `name` | string_t | recommended |
| `org` | object (organization) | recommended |
| `policy` | object (policy) | recommended |
| `type` | string_t | recommended |
| `type_id` | integer_t | recommended |
| `uid` | string_t | recommended |
| `user` | object (user) | recommended |
| `version` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`, `device`, `group`, `org`, `policy`, `user`

## Used By

- [entity_management](../classes/entity_management.md)
- [entity_management](../classes/entity_management.md)
