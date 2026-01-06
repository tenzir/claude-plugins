# Data Security

The Data Security object describes the characteristics, techniques and content of a Data Loss Prevention (DLP), Data Loss Detection (DLD), Data Classification, or similar tools' finding, alert, or detection mechanism(s).

**Extends**: data_classification

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `category` | string_t | optional |
| `category_id` | integer_t | recommended |
| `classifier_details` | object (classifier_details) | recommended |
| `confidentiality` | string_t | optional |
| `confidentiality_id` | integer_t | recommended |
| `data_lifecycle_state` | string_t | optional |
| `data_lifecycle_state_id` | integer_t | recommended |
| `detection_pattern` | string_t | recommended |
| `detection_system` | string_t | optional |
| `detection_system_id` | integer_t | recommended |
| `discovery_details` | object (discovery_details) | optional |
| `pattern_match` | string_t | optional |
| `policy` | object (policy) | recommended |
| `size` | long_t | optional |
| `src_url` | url_t | optional |
| `status` | string_t | recommended |
| `status_details` | string_t | optional |
| `status_id` | integer_t | recommended |
| `total` | integer_t | optional |
| `uid` | string_t | optional |

## Constraints

At least one of: `data_lifecycle_state_id`, `detection_pattern`, `detection_system_id`, `policy`

## Used By

- [data_security_finding](../classes/data_security_finding.md)
