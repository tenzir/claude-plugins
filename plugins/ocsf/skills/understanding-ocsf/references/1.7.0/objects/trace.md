# Trace

The trace object contains information about a distributed trace,  which is crucial for observability. Traces are made up of one or more spans, which are individual units of work in application activity. Traces track the journey of a request as it moves through various services in a system, capturing key details like timing, status, and dependencies at each step. Traces provide insights into system performance, helping to identify latency, bottlenecks, and issues in complex, distributed environments.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `duration` | long_t | optional |
| `end_time` | timestamp_t | optional |
| `end_time_dt` | datetime_t | optional |
| `flags` | string_t | optional |
| `service` | object (service) | optional |
| `span` | object (span) | optional |
| `start_time` | timestamp_t | optional |
| `start_time_dt` | datetime_t | optional |
| `uid` | string_t | required |

## Used By

- [api_activity](../classes/api_activity.md)
- [http_activity](../classes/http_activity.md)
