# Data Classification

The Data Classification object includes information about data classification levels and data category types.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `category` | string_t | optional |
| `category_id` | integer_t | recommended |
| `classifier_details` | object (classifier_details) | recommended |
| `confidentiality` | string_t | optional |
| `confidentiality_id` | integer_t | recommended |
| `discovery_details` | object (discovery_details) | optional |
| `policy` | object (policy) | optional |
| `size` | long_t | optional |
| `src_url` | url_t | optional |
| `status` | string_t | recommended |
| `status_details` | string_t | optional |
| `status_id` | integer_t | recommended |
| `total` | integer_t | optional |
| `uid` | string_t | optional |

## Constraints

At least one of: `category_id`, `confidentiality_id`
