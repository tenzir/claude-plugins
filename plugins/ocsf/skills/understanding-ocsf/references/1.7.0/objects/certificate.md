# Digital Certificate

The Digital Certificate, also known as a Public Key Certificate, object contains information about the ownership and usage of a public key. It serves as a means to establish trust in the authenticity and integrity of the public key and the associated entity.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `created_time` | timestamp_t | recommended |
| `created_time_dt` | datetime_t | optional |
| `expiration_time` | timestamp_t | recommended |
| `expiration_time_dt` | datetime_t | optional |
| `fingerprints` | object (fingerprint) | recommended |
| `is_self_signed` | boolean_t | recommended |
| `issuer` | string_t | required |
| `sans` | object (san) | optional |
| `serial_number` | string_t | required |
| `subject` | string_t | recommended |
| `uid` | string_t | optional |
| `version` | string_t | recommended |

## Used By

- [authentication](../classes/authentication.md)
