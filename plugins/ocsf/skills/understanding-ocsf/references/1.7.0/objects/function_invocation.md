# Function Invocation

The Function Invocation object provides details regarding the invocation of a function.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `error` | string_t | optional |
| `parameters` | object (parameter) | optional |
| `return_value` | string_t | optional |

## Constraints

At least one of: `parameters`, `return_value`, `error`
