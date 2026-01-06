# DNS Answer

The DNS Answer object represents a specific response provided by the Domain Name System (DNS) when querying for information about a domain or performing a DNS operation. It encapsulates the relevant details and data returned by the DNS server in response to a query.

**Extends**: _dns

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `class` | string_t | recommended |
| `flag_ids` | integer_t | recommended |
| `flags` | string_t | optional |
| `packet_uid` | integer_t | recommended |
| `rdata` | string_t | required |
| `ttl` | integer_t | recommended |
| `type` | string_t | recommended |

## Used By

- [dns_activity](../classes/dns_activity.md)
