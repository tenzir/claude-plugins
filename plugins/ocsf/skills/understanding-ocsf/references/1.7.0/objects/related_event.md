# Related Event/Finding

The Related Event object describes an event or another finding related to a finding. It may or may not be an OCSF event.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `attacks` | object (attack) | optional |
| `count` | integer_t | optional |
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `desc` | string_t | optional |
| `first_seen_time` | timestamp_t | optional |
| `first_seen_time_dt` | datetime_t | optional |
| `kill_chain` | object (kill_chain_phase) | optional |
| `last_seen_time` | timestamp_t | optional |
| `last_seen_time_dt` | datetime_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `observables` | object (observable) | optional |
| `product` | object (product) | optional |
| `product_uid` | string_t | optional |
| `severity` | string_t | optional |
| `severity_id` | integer_t | recommended |
| `status` | string_t | optional |
| `tags` | object (key_value_object) | optional |
| `title` | string_t | optional |
| `traits` | object (trait) | optional |
| `type` | string_t | optional |
| `type_name` | string_t | optional |
| `type_uid` | long_t | recommended |
| `uid` | string_t | required |
