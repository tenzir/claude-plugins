# Job

The Job object provides information about a scheduled job or task, including its name, command line, and state. It encompasses attributes that describe the properties and status of the scheduled job.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `cmd_line` | string_t | recommended |
| `created_time` | timestamp_t | recommended |
| `created_time_dt` | datetime_t | optional |
| `desc` | string_t | recommended |
| `file` | object (file) | optional |
| `last_run_time` | timestamp_t | recommended |
| `last_run_time_dt` | datetime_t | optional |
| `name` | string_t | required |
| `next_run_time` | timestamp_t | optional |
| `next_run_time_dt` | datetime_t | optional |
| `run_state` | string_t | optional |
| `run_state_id` | integer_t | recommended |
| `user` | object (user) | optional |

## Used By

- [job_query](../classes/job_query.md)
- [scheduled_job_activity](../classes/scheduled_job_activity.md)
