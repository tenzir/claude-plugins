# Authentication Token

The Authentication Token object represents standardized authentication tokens, tickets, or assertions that conform to established authentication protocols such as Kerberos, OIDC, and SAML. These tokens are issued by authentication servers and identity providers and carry protocol-specific metadata, lifecycle information, and security attributes defined by their respective specifications.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `created_time` | timestamp_t | recommended |
| `created_time_dt` | datetime_t | optional |
| `encryption_details` | object (encryption_details) | recommended |
| `expiration_time` | timestamp_t | optional |
| `expiration_time_dt` | datetime_t | optional |
| `is_renewable` | boolean_t | optional |
| `kerberos_flags` | string_t | recommended |
| `type` | string_t | recommended |
| `type_id` | integer_t | recommended |

## Used By

- [authentication](../classes/authentication.md)
