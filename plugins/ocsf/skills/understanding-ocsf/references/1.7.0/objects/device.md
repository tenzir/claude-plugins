# Device

The Device object represents an addressable computer system or host, which is typically connected to a computer network and participates in the transmission or processing of data within the computer network.

**Extends**: endpoint

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `agent_list` | object (agent) | optional |
| `autoscale_uid` | string_t | optional |
| `boot_time` | timestamp_t | optional |
| `boot_time_dt` | datetime_t | optional |
| `boot_uid` | string_t | optional |
| `container` | object (container) | recommended |
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `desc` | string_t | optional |
| `domain` | string_t | optional |
| `eid` | string_t | optional |
| `first_seen_time` | timestamp_t | optional |
| `first_seen_time_dt` | datetime_t | optional |
| `groups` | object (group) | optional |
| `hostname` | hostname_t | recommended |
| `hw_info` | object (device_hw_info) | optional |
| `hypervisor` | string_t | optional |
| `iccid` | string_t | optional |
| `image` | object (image) | optional |
| `imei` | string_t | optional |
| `imei_list` | string_t | optional |
| `instance_uid` | string_t | recommended |
| `interface_name` | string_t | recommended |
| `interface_uid` | string_t | recommended |
| `ip` | ip_t | optional |
| `is_backed_up` | boolean_t | optional |
| `is_compliant` | boolean_t | optional |
| `is_managed` | boolean_t | optional |
| `is_mobile_account_active` | boolean_t | optional |
| `is_personal` | boolean_t | optional |
| `is_shared` | boolean_t | optional |
| `is_supervised` | boolean_t | optional |
| `is_trusted` | boolean_t | optional |
| `last_seen_time` | timestamp_t | optional |
| `last_seen_time_dt` | datetime_t | optional |
| `location` | object (location) | optional |
| `mac` | mac_t | optional |
| `meid` | string_t | optional |
| `model` | string_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `name` | string_t | optional |
| `namespace_pid` | integer_t | recommended |
| `network_interfaces` | object (network_interface) | optional |
| `org` | object (organization) | optional |
| `os` | object (os) | optional |
| `os_machine_uuid` | uuid_t | optional |
| `owner` | object (user) | recommended |
| `region` | string_t | recommended |
| `risk_level` | string_t | optional |
| `risk_level_id` | integer_t | optional |
| `risk_score` | integer_t | optional |
| `subnet` | subnet_t | optional |
| `subnet_uid` | string_t | optional |
| `type` | string_t | recommended |
| `type_id` | integer_t | required |
| `udid` | string_t | optional |
| `uid` | string_t | recommended |
| `uid_alt` | string_t | optional |
| `vendor_name` | string_t | recommended |
| `vlan_uid` | string_t | optional |
| `vpc_uid` | string_t | optional |
| `zone` | string_t | optional |

## Constraints

At least one of: `ip`, `uid`, `name`, `hostname`, `instance_uid`, `interface_uid`, `interface_name`

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
