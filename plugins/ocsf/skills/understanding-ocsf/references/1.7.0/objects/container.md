# Container

The Container object describes an instance of a specific container. A container is a prepackaged, portable system image that runs isolated on an existing system using a container runtime like containerd.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `hash` | object (fingerprint) | recommended |
| `image` | object (image) | recommended |
| `labels` | string_t | optional |
| `name` | string_t | recommended |
| `network_driver` | string_t | optional |
| `orchestrator` | string_t | optional |
| `pod_uuid` | uuid_t | optional |
| `runtime` | string_t | optional |
| `size` | long_t | recommended |
| `tag` | string_t | optional |
| `tags` | object (key_value_object) | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `uid`, `name`

## Used By

- [cloud_resources_inventory_info](../classes/cloud_resources_inventory_info.md)
