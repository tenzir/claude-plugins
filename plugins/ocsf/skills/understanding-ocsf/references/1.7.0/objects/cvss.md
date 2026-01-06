# CVSS Score

The Common Vulnerability Scoring System ( [https://www.first.org/cvss/](CVSS) object provides a way to capture the principal characteristics of a vulnerability and produce a numerical score reflecting its severity.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `base_score` | float_t | required |
| `depth` | string_t | recommended |
| `metrics` | object (metric) | optional |
| `overall_score` | float_t | recommended |
| `severity` | string_t | optional |
| `src_url` | url_t | optional |
| `vector_string` | string_t | optional |
| `vendor_name` | string_t | recommended |
| `version` | string_t | required |
