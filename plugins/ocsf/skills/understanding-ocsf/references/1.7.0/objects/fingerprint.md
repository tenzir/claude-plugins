# Fingerprint

The Fingerprint object provides detailed information about a digital fingerprint, which is a compact representation of data used to identify a longer piece of information, such as a public key or file content. It contains the algorithm and value of the fingerprint, enabling efficient and reliable identification of the associated data.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `algorithm` | string_t | optional |
| `algorithm_id` | integer_t | required |
| `value` | file_hash_t | required |

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
