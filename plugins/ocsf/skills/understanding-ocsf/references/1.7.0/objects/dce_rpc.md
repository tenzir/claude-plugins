# DCE/RPC

The DCE/RPC, or Distributed Computing Environment/Remote Procedure Call, object describes the remote procedure call system for distributed computing environments.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `command` | string_t | recommended |
| `command_response` | string_t | recommended |
| `flags` | string_t | required |
| `opnum` | integer_t | recommended |
| `rpc_interface` | object (rpc_interface) | required |

## Used By

- [smb_activity](../classes/smb_activity.md)
