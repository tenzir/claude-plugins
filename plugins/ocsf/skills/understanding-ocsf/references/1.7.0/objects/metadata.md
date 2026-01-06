# Metadata

The Metadata object describes the metadata associated with the event.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `correlation_uid` | string_t | optional |
| `data_classification` | object (data_classification) | recommended |
| `data_classifications` | object (data_classification) | recommended |
| `debug` | string_t | optional |
| `event_code` | string_t | optional |
| `extension` | object (extension) | optional |
| `extensions` | object (extension) | optional |
| `is_truncated` | boolean_t | optional |
| `labels` | string_t | optional |
| `log_format` | string_t | optional |
| `log_level` | string_t | optional |
| `log_name` | string_t | recommended |
| `log_provider` | string_t | optional |
| `log_source` | string_t | optional |
| `log_version` | string_t | optional |
| `logged_time` | timestamp_t | optional |
| `logged_time_dt` | datetime_t | optional |
| `loggers` | object (logger) | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `original_event_uid` | string_t | optional |
| `original_time` | string_t | recommended |
| `processed_time` | timestamp_t | optional |
| `processed_time_dt` | datetime_t | optional |
| `product` | object (product) | required |
| `profiles` | string_t | optional |
| `reporter` | object (reporter) | recommended |
| `sequence` | integer_t | optional |
| `source` | string_t | optional |
| `tags` | object (key_value_object) | optional |
| `tenant_uid` | string_t | recommended |
| `transformation_info_list` | object (transformation_info) | optional |
| `transmit_time` | timestamp_t | optional |
| `transmit_time_dt` | datetime_t | optional |
| `type` | string_t | optional |
| `uid` | string_t | optional |
| `untruncated_size` | integer_t | optional |
| `version` | string_t | required |

## Used By

- [account_change](../classes/account_change.md)
- [admin_group_query](../classes/admin_group_query.md)
- [airborne_broadcast_activity](../classes/airborne_broadcast_activity.md)
- [api_activity](../classes/api_activity.md)
- [application_error](../classes/application_error.md)
- [application_lifecycle](../classes/application_lifecycle.md)
- [application_security_posture_finding](../classes/application_security_posture_finding.md)
- [authentication](../classes/authentication.md)
- [authorize_session](../classes/authorize_session.md)
- [base_event](../classes/base_event.md)
- [cloud_resources_inventory_info](../classes/cloud_resources_inventory_info.md)
- [compliance_finding](../classes/compliance_finding.md)
- [config_state](../classes/config_state.md)
- [data_security_finding](../classes/data_security_finding.md)
- [datastore_activity](../classes/datastore_activity.md)
- [detection_finding](../classes/detection_finding.md)
- [device_config_state_change](../classes/device_config_state_change.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [drone_flights_activity](../classes/drone_flights_activity.md)
- ... (63 more)
