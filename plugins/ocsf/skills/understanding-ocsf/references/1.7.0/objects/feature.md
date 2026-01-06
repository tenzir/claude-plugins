# Feature

The Feature object provides information about the software product feature that generated a specific event. It encompasses details related to the capabilities, components, user interface (UI) design, and performance upgrades associated with the feature.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `name` | string_t | recommended |
| `uid` | string_t | recommended |
| `version` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`
