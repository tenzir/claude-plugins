# Network Endpoint

The Network Endpoint object describes characteristics of a network endpoint. These can be a source or destination of a network connection.

**Extends**: endpoint

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `agent_list` | object (agent) | optional |
| `autonomous_system` | object (autonomous_system) | optional |
| `container` | object (container) | recommended |
| `domain` | string_t | optional |
| `hostname` | hostname_t | recommended |
| `hw_info` | object (device_hw_info) | optional |
| `instance_uid` | string_t | recommended |
| `interface_name` | string_t | recommended |
| `interface_uid` | string_t | recommended |
| `intermediate_ips` | ip_t | optional |
| `ip` | ip_t | recommended |
| `isp` | string_t | optional |
| `isp_org` | string_t | optional |
| `location` | object (location) | optional |
| `mac` | mac_t | optional |
| `name` | string_t | recommended |
| `namespace_pid` | integer_t | recommended |
| `network_scope` | string_t | optional |
| `network_scope_id` | integer_t | optional |
| `os` | object (os) | optional |
| `owner` | object (user) | recommended |
| `port` | port_t | recommended |
| `proxy_endpoint` | object (network_proxy) | optional |
| `subnet_uid` | string_t | optional |
| `svc_name` | string_t | recommended |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `uid` | string_t | recommended |
| `vlan_uid` | string_t | optional |
| `vpc_uid` | string_t | optional |
| `zone` | string_t | optional |

## Constraints

At least one of: `ip`, `uid`, `name`, `hostname`, `svc_name`, `instance_uid`, `interface_uid`, `interface_name`, `domain`

## Used By

- [account_change](../classes/account_change.md)
- [airborne_broadcast_activity](../classes/airborne_broadcast_activity.md)
- [airborne_broadcast_activity](../classes/airborne_broadcast_activity.md)
- [api_activity](../classes/api_activity.md)
- [api_activity](../classes/api_activity.md)
- [authentication](../classes/authentication.md)
- [authentication](../classes/authentication.md)
- [authorize_session](../classes/authorize_session.md)
- [authorize_session](../classes/authorize_session.md)
- [data_security_finding](../classes/data_security_finding.md)
- [data_security_finding](../classes/data_security_finding.md)
- [datastore_activity](../classes/datastore_activity.md)
- [datastore_activity](../classes/datastore_activity.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [drone_flights_activity](../classes/drone_flights_activity.md)
- [drone_flights_activity](../classes/drone_flights_activity.md)
- [email_activity](../classes/email_activity.md)
- ... (29 more)
