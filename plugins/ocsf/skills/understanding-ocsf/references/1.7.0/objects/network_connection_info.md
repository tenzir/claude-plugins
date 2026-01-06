# Network Connection Information

The Network Connection Information object describes characteristics of an OSI Transport Layer communication, including TCP and UDP.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `boundary` | string_t | optional |
| `boundary_id` | integer_t | recommended |
| `community_uid` | string_t | optional |
| `direction` | string_t | optional |
| `direction_id` | integer_t | required |
| `flag_history` | string_t | optional |
| `protocol_name` | string_t | recommended |
| `protocol_num` | integer_t | recommended |
| `protocol_ver` | string_t | optional |
| `protocol_ver_id` | integer_t | recommended |
| `session` | object (session) | optional |
| `tcp_flags` | integer_t | optional |
| `uid` | string_t | recommended |

## Used By

- [airborne_broadcast_activity](../classes/airborne_broadcast_activity.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [drone_flights_activity](../classes/drone_flights_activity.md)
- [file_hosting](../classes/file_hosting.md)
- [ftp_activity](../classes/ftp_activity.md)
- [ftp_activity](../classes/ftp_activity.md)
- [http_activity](../classes/http_activity.md)
- [http_activity](../classes/http_activity.md)
- [network_activity](../classes/network_activity.md)
- [network_activity](../classes/network_activity.md)
- [network_connection_query](../classes/network_connection_query.md)
- [network_file_activity](../classes/network_file_activity.md)
- [network_file_activity](../classes/network_file_activity.md)
- [network_remediation_activity](../classes/network_remediation_activity.md)
- [ntp_activity](../classes/ntp_activity.md)
- [ntp_activity](../classes/ntp_activity.md)
- [rdp_activity](../classes/rdp_activity.md)
- ... (9 more)
