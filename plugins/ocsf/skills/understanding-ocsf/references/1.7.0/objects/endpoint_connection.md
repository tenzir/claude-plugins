# Endpoint Connection

The Endpoint Connection object contains information detailing a connection attempt to an endpoint.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `code` | integer_t | recommended |
| `network_endpoint` | object (network_endpoint) | recommended |

## Constraints

At least one of: `network_endpoint`, `code`
