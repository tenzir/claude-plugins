# RPC Interface

The RPC Interface represents the remote procedure call interface used in the DCE/RPC session.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `ack_reason` | integer_t | recommended |
| `ack_result` | integer_t | recommended |
| `uuid` | uuid_t | required |
| `version` | string_t | required |
