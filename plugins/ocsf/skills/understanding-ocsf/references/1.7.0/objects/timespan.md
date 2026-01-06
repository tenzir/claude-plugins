# Time Span

The Time Span object represents different time period durations. If a timespan is fractional, i.e. crosses one period, e.g. a week and 3 days, more than one may be populated since each member is of integral type. In that case `type_id` if present should be set to `Other.`<P>A timespan may also be defined by its time interval boundaries, `start_time` and `end_time`.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `duration` | long_t | recommended |
| `duration_days` | integer_t | recommended |
| `duration_hours` | integer_t | recommended |
| `duration_mins` | integer_t | recommended |
| `duration_months` | integer_t | recommended |
| `duration_secs` | integer_t | recommended |
| `duration_weeks` | integer_t | recommended |
| `duration_years` | integer_t | recommended |
| `end_time` | timestamp_t | recommended |
| `end_time_dt` | datetime_t | optional |
| `start_time` | timestamp_t | recommended |
| `start_time_dt` | datetime_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |

## Constraints

At least one of: `duration`, `duration_days`, `duration_hours`, `duration_mins`, `duration_months`, `duration_secs`, `duration_weeks`, `duration_years`, `end_time`, `start_time`
