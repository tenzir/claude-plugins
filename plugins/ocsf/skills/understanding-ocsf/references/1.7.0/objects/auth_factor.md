# Authentication Factor

An Authentication Factor object describes a category of methods used for identity verification in an authentication attempt.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `device` | object (device) | recommended |
| `email_addr` | email_t | optional |
| `factor_type` | string_t | recommended |
| `factor_type_id` | integer_t | required |
| `is_hotp` | boolean_t | recommended |
| `is_totp` | boolean_t | recommended |
| `phone_number` | string_t | optional |
| `provider` | string_t | recommended |
| `security_questions` | string_t | optional |

## Used By

- [account_change](../classes/account_change.md)
- [authentication](../classes/authentication.md)
