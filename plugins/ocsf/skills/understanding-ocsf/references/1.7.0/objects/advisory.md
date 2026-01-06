# Advisory

The Advisory object represents publicly disclosed cybersecurity vulnerabilities defined in a Security advisory. e.g. ` Microsoft KB Article`, `Apple Security Advisory`, or a `GitHub Security Advisory (GHSA)`

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `avg_timespan` | object (timespan) | optional |
| `bulletin` | string_t | optional |
| `classification` | string_t | optional |
| `created_time` | timestamp_t | recommended |
| `created_time_dt` | datetime_t | optional |
| `desc` | string_t | optional |
| `install_state` | string_t | recommended |
| `install_state_id` | integer_t | recommended |
| `is_superseded` | boolean_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `os` | object (os) | recommended |
| `product` | object (product) | optional |
| `references` | string_t | recommended |
| `related_cves` | object (cve) | optional |
| `related_cwes` | object (cwe) | optional |
| `size` | long_t | optional |
| `src_url` | url_t | optional |
| `title` | string_t | recommended |
| `uid` | string_t | required |
