# Occurrence Details

Details about where in the target entity, specified information was discovered. Only the attributes, relevant to the target entity type should be populated.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `cell_name` | string_t | optional |
| `column_name` | string_t | optional |
| `column_number` | integer_t | optional |
| `end_line` | integer_t | optional |
| `json_path` | string_t | optional |
| `page_number` | integer_t | optional |
| `record_index_in_array` | integer_t | optional |
| `row_number` | integer_t | optional |
| `start_line` | integer_t | optional |

## Constraints

At least one of: `cell_name`, `column_name`, `column_number`, `end_line`, `json_path`, `page_number`, `record_index_in_array`, `row_number`, `start_line`
