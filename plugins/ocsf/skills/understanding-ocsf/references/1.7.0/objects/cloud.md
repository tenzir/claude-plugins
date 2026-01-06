# Cloud

The Cloud object describes the cloud computing environment where an event or finding originated. It provides comprehensive context about the cloud infrastructure, including the cloud service provider, account or subscription details, organizational structure, geographic regions, availability zones, and logical partitions.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `account` | object (account) | optional |
| `cloud_partition` | string_t | optional |
| `org` | object (organization) | optional |
| `project_uid` | string_t | optional |
| `provider` | string_t | required |
| `region` | string_t | recommended |
| `zone` | string_t | optional |

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
