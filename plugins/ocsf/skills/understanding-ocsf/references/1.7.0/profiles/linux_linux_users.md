# Linux Users

The attributes that Linux uses to identify user information.

**Extension**: linux

## Attributes

| Attribute | Type | Requirement | Description |
|-----------|------|-------------|-------------|
| `auid` | integer_t | optional | Audit User ID |
| `egid` | integer_t | optional | Effective Group ID |
| `euid` | integer_t | optional | Effective User ID |
| `group` | object (group) | recommended | Group |
