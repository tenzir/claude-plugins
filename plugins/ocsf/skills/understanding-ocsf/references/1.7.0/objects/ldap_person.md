# LDAP Person

The additional LDAP attributes that describe a person.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `cost_center` | string_t | optional |
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `deleted_time` | timestamp_t | optional |
| `deleted_time_dt` | datetime_t | optional |
| `display_name` | string_t | optional |
| `email_addrs` | email_t | optional |
| `employee_uid` | string_t | optional |
| `given_name` | string_t | optional |
| `hire_time` | timestamp_t | optional |
| `hire_time_dt` | datetime_t | optional |
| `job_title` | string_t | optional |
| `labels` | string_t | optional |
| `last_login_time` | timestamp_t | optional |
| `last_login_time_dt` | datetime_t | optional |
| `ldap_cn` | string_t | optional |
| `ldap_dn` | string_t | optional |
| `leave_time` | timestamp_t | optional |
| `leave_time_dt` | datetime_t | optional |
| `location` | object (location) | optional |
| `manager` | object (user) | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `office_location` | string_t | optional |
| `phone_number` | string_t | optional |
| `surname` | string_t | optional |
| `tags` | object (key_value_object) | optional |
