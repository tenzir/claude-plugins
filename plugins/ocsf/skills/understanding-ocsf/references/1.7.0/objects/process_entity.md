# Process Entity

The Process Entity object provides critical fields for referencing a process.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `cmd_line` | string_t | recommended |
| `cpid` | uuid_t | recommended |
| `created_time` | timestamp_t | recommended |
| `created_time_dt` | datetime_t | optional |
| `name` | process_name_t | recommended |
| `path` | string_t | optional |
| `pid` | integer_t | recommended |
| `uid` | string_t | recommended |

## Constraints

At least one of: `cmd_line`, `name`, `path`, `pid`, `uid`, `cpid`
