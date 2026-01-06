# Incident

The attributes that add incident handling semantics to a Finding.

## Attributes

| Attribute | Type | Requirement | Description |
|-----------|------|-------------|-------------|
| `assignee` | object (user) | optional | Assignee |
| `assignee_group` | object (group) | optional | Assignee Group |
| `impact` | string_t | recommended | Impact |
| `impact_id` | integer_t | recommended | Impact ID |
| `impact_score` | integer_t | recommended | Impact Score |
| `is_suspected_breach` | boolean_t | optional | Suspected Breach |
| `priority` | string_t | optional | Priority |
| `priority_id` | integer_t | recommended | Priority ID |
| `src_url` | url_t | recommended | Source URL |
| `ticket` | object (ticket) | optional | Ticket |
| `tickets` | object (ticket) | optional | Tickets |
| `verdict` | string_t | recommended | Verdict |
| `verdict_id` | integer_t | recommended | Verdict ID |
