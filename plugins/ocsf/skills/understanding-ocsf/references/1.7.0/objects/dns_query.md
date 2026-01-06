# DNS Query

The DNS query object represents a specific request made to the Domain Name System (DNS) to retrieve information about a domain or perform a DNS operation. This object encapsulates the necessary attributes and methods to construct and send DNS queries, specify the query type (e.g., A, AAAA, MX).

**Extends**: _dns

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `class` | string_t | recommended |
| `hostname` | hostname_t | required |
| `opcode` | string_t | optional |
| `opcode_id` | integer_t | recommended |
| `packet_uid` | integer_t | recommended |
| `type` | string_t | recommended |

## Used By

- [dns_activity](../classes/dns_activity.md)
