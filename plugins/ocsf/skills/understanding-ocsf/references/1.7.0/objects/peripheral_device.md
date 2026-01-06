# Peripheral Device

The peripheral device object describes the properties of external, connectable, and detachable hardware.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `class` | string_t | optional |
| `model` | string_t | recommended |
| `name` | string_t | required |
| `serial_number` | string_t | recommended |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `uid` | string_t | recommended |
| `vendor_id_list` | string_t | recommended |
| `vendor_name` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`

## Used By

- [peripheral_activity](../classes/peripheral_activity.md)
- [peripheral_device_query](../classes/peripheral_device_query.md)
