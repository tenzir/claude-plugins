# Endpoint

The Endpoint object describes a physical or virtual device that connects to and exchanges information with a computer network. Some examples of endpoints are mobile devices, desktop computers, virtual machines, embedded devices, and servers. Internet-of-Things devices—like cameras, lighting, refrigerators, security systems, smart speakers, and thermostats—are also endpoints.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `agent_list` | object (agent) | optional |
| `container` | object (container) | recommended |
| `domain` | string_t | optional |
| `hostname` | hostname_t | recommended |
| `hw_info` | object (device_hw_info) | optional |
| `instance_uid` | string_t | recommended |
| `interface_name` | string_t | recommended |
| `interface_uid` | string_t | recommended |
| `ip` | ip_t | recommended |
| `location` | object (location) | optional |
| `mac` | mac_t | optional |
| `name` | string_t | recommended |
| `namespace_pid` | integer_t | recommended |
| `os` | object (os) | optional |
| `owner` | object (user) | recommended |
| `subnet_uid` | string_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `uid` | string_t | recommended |
| `vlan_uid` | string_t | optional |
| `vpc_uid` | string_t | optional |
| `zone` | string_t | optional |

## Constraints

At least one of: `ip`, `uid`, `name`, `hostname`, `instance_uid`, `interface_uid`, `interface_name`
