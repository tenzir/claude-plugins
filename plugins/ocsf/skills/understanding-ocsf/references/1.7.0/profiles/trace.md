# Trace

The Trace Profile extends the OCSF framework to capture and standardize observability events, specifically targeting trace-level data. This profile enables integration and normalization of distributed tracing information, allowing OCSF events to retain essential trace context such as trace IDs, span relationships, and service dependencies.

## Attributes

| Attribute | Type | Requirement | Description |
|-----------|------|-------------|-------------|
| `trace` | object (trace) | recommended | Trace |
