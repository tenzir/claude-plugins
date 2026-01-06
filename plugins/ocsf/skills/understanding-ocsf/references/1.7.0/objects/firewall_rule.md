# Firewall Rule

The Firewall Rule object represents a specific rule within a firewall policy or event. It contains information about a rule's configuration, properties, and associated actions that define how network traffic is handled by the firewall.

**Extends**: rule

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `category` | string_t | optional |
| `condition` | string_t | optional |
| `desc` | string_t | optional |
| `duration` | long_t | optional |
| `match_details` | string_t | optional |
| `match_location` | string_t | optional |
| `name` | string_t | recommended |
| `rate_limit` | integer_t | optional |
| `sensitivity` | string_t | optional |
| `type` | string_t | optional |
| `uid` | string_t | recommended |
| `version` | string_t | optional |

## Constraints

At least one of: `name`, `uid`

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
