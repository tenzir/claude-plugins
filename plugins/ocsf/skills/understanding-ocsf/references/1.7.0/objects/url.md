# Uniform Resource Locator

The Uniform Resource Locator (URL) object describes the characteristics of a URL.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `categories` | string_t | optional |
| `category_ids` | integer_t | recommended |
| `domain` | string_t | optional |
| `hostname` | hostname_t | recommended |
| `path` | string_t | recommended |
| `port` | port_t | recommended |
| `query_string` | string_t | recommended |
| `resource_type` | string_t | optional |
| `scheme` | string_t | recommended |
| `subdomain` | string_t | optional |
| `url_string` | url_t | recommended |

## Constraints

At least one of: `url_string`, `path`

## Used By

- [email_url_activity](../classes/email_url_activity.md)
- [network_activity](../classes/network_activity.md)
