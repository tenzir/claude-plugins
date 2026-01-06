# Load Balancer

The load balancer object describes the load balancer entity and contains additional information regarding the distribution of traffic across a network.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `classification` | string_t | optional |
| `code` | integer_t | recommended |
| `dst_endpoint` | object (network_endpoint) | recommended |
| `endpoint_connections` | object (endpoint_connection) | recommended |
| `error_message` | string_t | optional |
| `ip` | ip_t | optional |
| `message` | string_t | optional |
| `metrics` | object (metric) | optional |
| `name` | string_t | recommended |
| `status_detail` | string_t | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`

## Used By

- [dhcp_activity](../classes/dhcp_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [ftp_activity](../classes/ftp_activity.md)
- [http_activity](../classes/http_activity.md)
- [network_activity](../classes/network_activity.md)
- [network_file_activity](../classes/network_file_activity.md)
- [ntp_activity](../classes/ntp_activity.md)
- [rdp_activity](../classes/rdp_activity.md)
- [smb_activity](../classes/smb_activity.md)
- [ssh_activity](../classes/ssh_activity.md)
- [tunnel_activity](../classes/tunnel_activity.md)
