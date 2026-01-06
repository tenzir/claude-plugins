# CVE

The Common Vulnerabilities and Exposures (CVE) object represents publicly disclosed cybersecurity vulnerabilities defined in CVE Program catalog ( [https://cve.mitre.org/](CVE). There is one CVE Record for each vulnerability in the catalog.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `created_time` | timestamp_t | recommended |
| `created_time_dt` | datetime_t | optional |
| `cvss` | object (cvss) | recommended |
| `cwe` | object (cwe) | optional |
| `cwe_uid` | string_t | optional |
| `cwe_url` | url_t | optional |
| `desc` | string_t | optional |
| `epss` | object (epss) | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `product` | object (product) | optional |
| `references` | string_t | recommended |
| `related_cwes` | object (cwe) | optional |
| `title` | string_t | recommended |
| `type` | string_t | recommended |
| `uid` | string_t | required |
