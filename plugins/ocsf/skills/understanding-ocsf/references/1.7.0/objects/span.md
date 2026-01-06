# Span

Represents a single unit of work or operation within a distributed trace. A span typically tracks the execution of a request across a service, capturing important details such as the operation, timestamps, and status. Spans help break down the overall trace into smaller, manageable parts, enabling detailed analysis of the performance and behavior of specific operations within the system. They are crucial for understanding latency, dependencies, and bottlenecks in complex distributed systems.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `duration` | long_t | optional |
| `end_time` | timestamp_t | required |
| `end_time_dt` | datetime_t | optional |
| `message` | string_t | optional |
| `operation` | string_t | optional |
| `parent_uid` | string_t | optional |
| `service` | object (service) | optional |
| `start_time` | timestamp_t | required |
| `start_time_dt` | datetime_t | optional |
| `status_code` | string_t | optional |
| `uid` | string_t | required |
