# SSO

The Single Sign-On (SSO) object provides a structure for normalizing SSO attributes, configuration, and/or settings from Identity Providers.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `auth_protocol` | string_t | optional |
| `auth_protocol_id` | integer_t | optional |
| `certificate` | object (certificate) | recommended |
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `duration_mins` | integer_t | optional |
| `idle_timeout` | integer_t | optional |
| `login_endpoint` | url_t | optional |
| `logout_endpoint` | url_t | optional |
| `metadata_endpoint` | url_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `name` | string_t | recommended |
| `protocol_name` | string_t | optional |
| `scopes` | string_t | optional |
| `uid` | string_t | recommended |
| `vendor_name` | string_t | optional |
