# Anomaly

Describes an anomaly or deviation detected in a system. Anomalies are unexpected activity patterns that could indicate potential issues needing attention.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `observation_parameter` | string_t | required |
| `observation_type` | string_t | recommended |
| `observations` | object (observation) | required |
| `observed_pattern` | string_t | recommended |
