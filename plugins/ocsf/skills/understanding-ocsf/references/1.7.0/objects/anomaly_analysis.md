# Anomaly Analysis

Describes the analysis of activity patterns and anomalies of target entities to identify potential security threats, performance issues, or other deviations from established baselines. This includes monitoring and analyzing user interactions, API usage, resource utilization, access patterns and other measured indicators.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `analysis_targets` | object (analysis_target) | required |
| `anomalies` | object (anomaly) | required |
| `baselines` | object (baseline) | recommended |

## Used By

- [detection_finding](../classes/detection_finding.md)
