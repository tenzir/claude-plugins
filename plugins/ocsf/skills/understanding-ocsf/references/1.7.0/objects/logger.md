# Logger

The Logger object represents the device and product where events are stored with times for receipt and transmission.  This may be at the source device where the event occurred, a remote scanning device, intermediate hops, or the ultimate destination.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `device` | object (device) | recommended |
| `event_uid` | string_t | optional |
| `is_truncated` | boolean_t | optional |
| `log_format` | string_t | optional |
| `log_level` | string_t | optional |
| `log_name` | string_t | recommended |
| `log_provider` | string_t | recommended |
| `log_version` | string_t | optional |
| `logged_time` | timestamp_t | recommended |
| `logged_time_dt` | datetime_t | optional |
| `name` | string_t | recommended |
| `product` | object (product) | recommended |
| `transmit_time` | timestamp_t | recommended |
| `transmit_time_dt` | datetime_t | optional |
| `uid` | string_t | recommended |
| `untruncated_size` | integer_t | optional |
| `version` | string_t | optional |

## Constraints

At least one of: `name`, `uid`
