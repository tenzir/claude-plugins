# Identity Provider

The Identity Provider object contains detailed information about a provider responsible for creating, maintaining, and managing identity information while offering authentication services to applications. An Identity Provider (IdP) serves as a trusted authority that verifies the identity of users and issues authentication tokens or assertions to enable secure access to applications or services.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `auth_factors` | object (auth_factor) | optional |
| `domain` | string_t | optional |
| `fingerprint` | object (fingerprint) | optional |
| `has_mfa` | boolean_t | optional |
| `issuer` | string_t | optional |
| `name` | string_t | recommended |
| `protocol_name` | string_t | optional |
| `scim` | object (scim) | optional |
| `sso` | object (sso) | optional |
| `state` | string_t | optional |
| `state_id` | integer_t | optional |
| `tenant_uid` | string_t | optional |
| `uid` | string_t | recommended |
| `url_string` | url_t | optional |

## Constraints

At least one of: `name`, `uid`

## Used By

- [cloud_resources_inventory_info](../classes/cloud_resources_inventory_info.md)
