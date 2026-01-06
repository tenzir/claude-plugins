# HASSH

The HASSH object contains SSH network fingerprinting values for specific client/server implementations. It provides a standardized way of identifying and categorizing SSH connections based on their unique characteristics and behavior.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `algorithm` | string_t | recommended |
| `fingerprint` | object (fingerprint) | required |

## Used By

- [ssh_activity](../classes/ssh_activity.md)
- [ssh_activity](../classes/ssh_activity.md)
