# SCIM

The System for Cross-domain Identity Management (SCIM) Configuration object provides a structured set of attributes related to SCIM protocols used for identity provisioning and management across cloud-based platforms. It standardizes user and group provisioning details, enabling identity synchronization and lifecycle management with compatible Identity Providers (IdPs) and applications. SCIM is defined in  [https://datatracker.ietf.org/doc/html/rfc7643](RFC-7634

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `auth_protocol` | string_t | optional |
| `auth_protocol_id` | integer_t | optional |
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `error_message` | string_t | optional |
| `is_group_provisioning_enabled` | boolean_t | optional |
| `is_user_provisioning_enabled` | boolean_t | optional |
| `last_run_time` | timestamp_t | optional |
| `last_run_time_dt` | datetime_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `name` | string_t | recommended |
| `protocol_name` | string_t | optional |
| `rate_limit` | integer_t | optional |
| `scim_group_schema` | json_t | recommended |
| `scim_user_schema` | json_t | recommended |
| `state` | string_t | optional |
| `state_id` | integer_t | optional |
| `uid` | string_t | recommended |
| `uid_alt` | string_t | optional |
| `url_string` | url_t | optional |
| `vendor_name` | string_t | optional |
| `version` | string_t | recommended |
