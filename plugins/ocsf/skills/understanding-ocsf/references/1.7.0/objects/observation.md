# Observation

A record of an observed value or event that captures the timing and frequency of its occurrence. Used to track when values/events were first detected, last detected, and their total occurrence count.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `count` | integer_t | recommended |
| `timespan` | object (timespan) | recommended |
| `value` | string_t | required |
