# Baseline

Describes the baseline or expected behavior of a system, service, or component based on historical observations and measurements. It establishes reference points for comparison to detect anomalies, trends, and deviations from typical patterns.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `observation_parameter` | string_t | required |
| `observation_type` | string_t | recommended |
| `observations` | object (observation) | required |
| `observed_pattern` | string_t | recommended |
