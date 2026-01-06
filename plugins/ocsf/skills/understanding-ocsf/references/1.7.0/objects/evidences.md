# Evidence Artifacts

A collection of evidence artifacts associated to the activity/activities that triggered a security detection.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `actor` | object (actor) | recommended |
| `api` | object (api) | recommended |
| `connection_info` | object (network_connection_info) | recommended |
| `container` | object (container) | recommended |
| `data` | json_t | optional |
| `database` | object (database) | recommended |
| `databucket` | object (databucket) | recommended |
| `device` | object (device) | recommended |
| `dst_endpoint` | object (network_endpoint) | recommended |
| `email` | object (email) | recommended |
| `file` | object (file) | recommended |
| `http_request` | object (http_request) | recommended |
| `http_response` | object (http_response) | recommended |
| `ja4_fingerprint_list` | object (ja4_fingerprint) | recommended |
| `job` | object (job) | recommended |
| `name` | string_t | optional |
| `process` | object (process) | recommended |
| `query` | object (dns_query) | recommended |
| `reg_key` | object (win/reg_key) | recommended |
| `reg_value` | object (win/reg_value) | recommended |
| `resources` | object (resource_details) | recommended |
| `script` | object (script) | recommended |
| `src_endpoint` | object (network_endpoint) | recommended |
| `tls` | object (tls) | recommended |
| `uid` | string_t | optional |
| `url` | object (url) | recommended |
| `user` | object (user) | recommended |
| `verdict` | string_t | optional |
| `verdict_id` | integer_t | optional |
| `win_service` | object (win/win_service) | recommended |

## Constraints

At least one of: `actor`, `api`, `connection_info`, `data`, `database`, `databucket`, `device`, `dst_endpoint`, `email`, `file`, `process`, `query`, `src_endpoint`, `url`, `user`, `job`, `script`, `reg_key`, `reg_value`, `win_service`

## Used By

- [compliance_finding](../classes/compliance_finding.md)
- [detection_finding](../classes/detection_finding.md)
