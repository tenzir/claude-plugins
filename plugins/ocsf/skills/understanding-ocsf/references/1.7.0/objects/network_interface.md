# Network Interface

The Network Interface object describes the type and associated attributes of a physical or virtual network interface.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `hostname` | hostname_t | recommended |
| `ip` | ip_t | recommended |
| `mac` | mac_t | recommended |
| `name` | string_t | recommended |
| `namespace` | string_t | optional |
| `open_ports` | object (port_info) | optional |
| `subnet_prefix` | integer_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `uid` | string_t | optional |

## Constraints

At least one of: `ip`, `mac`, `name`, `hostname`, `uid`

## Used By

- [dhcp_activity](../classes/dhcp_activity.md)
- [networks_query](../classes/networks_query.md)
- [tunnel_activity](../classes/tunnel_activity.md)
