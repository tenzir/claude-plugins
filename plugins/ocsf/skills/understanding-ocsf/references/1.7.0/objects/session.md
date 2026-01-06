# Session

The Session object describes details about an authenticated session. e.g. Session Creation Time, Session Issuer.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `count` | integer_t | optional |
| `created_time` | timestamp_t | recommended |
| `created_time_dt` | datetime_t | optional |
| `credential_uid` | string_t | optional |
| `expiration_reason` | string_t | optional |
| `expiration_time` | timestamp_t | optional |
| `expiration_time_dt` | datetime_t | optional |
| `is_mfa` | boolean_t | optional |
| `is_remote` | boolean_t | recommended |
| `is_vpn` | boolean_t | optional |
| `issuer` | string_t | recommended |
| `terminal` | string_t | optional |
| `uid` | string_t | recommended |
| `uid_alt` | string_t | optional |
| `uuid` | uuid_t | optional |

## Used By

- [authentication](../classes/authentication.md)
- [authorize_session](../classes/authorize_session.md)
- [session_query](../classes/session_query.md)
- [tunnel_activity](../classes/tunnel_activity.md)
