# File

The File object represents the metadata associated with a file stored in a computer system. It encompasses information about the file itself, including its attributes, properties, and organizational details.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `accessed_time` | timestamp_t | optional |
| `accessed_time_dt` | datetime_t | optional |
| `accessor` | object (user) | optional |
| `attributes` | integer_t | optional |
| `company_name` | string_t | optional |
| `confidentiality` | string_t | optional |
| `confidentiality_id` | integer_t | optional |
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `creator` | object (user) | optional |
| `data_classification` | object (data_classification) | recommended |
| `data_classifications` | object (data_classification) | recommended |
| `desc` | string_t | optional |
| `drive_type` | string_t | optional |
| `drive_type_id` | integer_t | optional |
| `encryption_details` | object (encryption_details) | optional |
| `ext` | string_t | recommended |
| `hashes` | object (fingerprint) | recommended |
| `internal_name` | string_t | optional |
| `is_deleted` | boolean_t | optional |
| `is_encrypted` | boolean_t | optional |
| `is_public` | boolean_t | optional |
| `is_readonly` | boolean_t | optional |
| `is_system` | boolean_t | optional |
| `mime_type` | string_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `modifier` | object (user) | optional |
| `name` | file_name_t | required |
| `owner` | object (user) | optional |
| `parent_folder` | string_t | optional |
| `path` | file_path_t | recommended |
| `product` | object (product) | optional |
| `security_descriptor` | string_t | optional |
| `signature` | object (digital_signature) | optional |
| `size` | long_t | optional |
| `storage_class` | string_t | optional |
| `tags` | object (key_value_object) | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | required |
| `uid` | string_t | optional |
| `uri` | url_t | optional |
| `url` | object (url) | optional |
| `version` | string_t | optional |
| `volume` | string_t | optional |
| `xattributes` | object (object) | optional |

## Used By

- [data_security_finding](../classes/data_security_finding.md)
- [email_file_activity](../classes/email_file_activity.md)
- [event_log_actvity](../classes/event_log_actvity.md)
- [file_activity](../classes/file_activity.md)
- [file_activity](../classes/file_activity.md)
- [file_hosting](../classes/file_hosting.md)
- [file_hosting](../classes/file_hosting.md)
- [file_query](../classes/file_query.md)
- [file_remediation_activity](../classes/file_remediation_activity.md)
- [folder_query](../classes/folder_query.md)
- [ftp_activity](../classes/ftp_activity.md)
- [http_activity](../classes/http_activity.md)
- [network_file_activity](../classes/network_file_activity.md)
- [rdp_activity](../classes/rdp_activity.md)
- [smb_activity](../classes/smb_activity.md)
- [ssh_activity](../classes/ssh_activity.md)
