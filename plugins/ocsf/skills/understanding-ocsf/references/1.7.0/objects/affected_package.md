# Affected Software Package

The Affected Package object describes details about a software package identified as affected by a vulnerability/vulnerabilities.

**Extends**: package

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `architecture` | string_t | recommended |
| `cpe_name` | string_t | optional |
| `epoch` | integer_t | optional |
| `fixed_in_version` | string_t | optional |
| `hash` | object (fingerprint) | optional |
| `license` | string_t | optional |
| `license_url` | url_t | optional |
| `name` | string_t | required |
| `package_manager` | string_t | optional |
| `package_manager_url` | url_t | optional |
| `path` | file_path_t | optional |
| `purl` | string_t | optional |
| `release` | string_t | optional |
| `remediation` | object (remediation) | optional |
| `src_url` | url_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `uid` | string_t | optional |
| `vendor_name` | string_t | optional |
| `version` | string_t | required |
