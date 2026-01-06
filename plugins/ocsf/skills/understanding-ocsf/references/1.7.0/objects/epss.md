# EPSS

The Exploit Prediction Scoring System (EPSS) object describes the estimated probability a vulnerability will be exploited. EPSS is a community-driven effort to combine descriptive information about vulnerabilities (CVEs) with evidence of actual exploitation in-the-wild. ( [https://www.first.org/epss/](EPSS).

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `created_time` | timestamp_t | recommended |
| `created_time_dt` | datetime_t | optional |
| `percentile` | float_t | optional |
| `score` | string_t | required |
| `version` | string_t | recommended |
