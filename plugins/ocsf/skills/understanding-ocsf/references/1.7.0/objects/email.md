# Email

The Email object describes the email metadata such as sender, recipients, and direction, and can include embedded URLs and files.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `cc` | email_t | optional |
| `cc_mailboxes` | string_t | optional |
| `data_classification` | object (data_classification) | recommended |
| `data_classifications` | object (data_classification) | recommended |
| `delivered_to` | email_t | optional |
| `delivered_to_list` | email_t | optional |
| `files` | object (file) | optional |
| `from` | email_t | recommended |
| `from_list` | email_t | optional |
| `from_mailbox` | string_t | optional |
| `from_mailboxes` | email_t | optional |
| `http_headers` | object (http_header) | optional |
| `is_read` | boolean_t | optional |
| `message_uid` | string_t | recommended |
| `raw_header` | string_t | optional |
| `reply_to` | email_t | recommended |
| `reply_to_list` | email_t | optional |
| `reply_to_mailboxes` | string_t | optional |
| `return_path` | email_t | optional |
| `sender` | email_t | optional |
| `sender_mailbox` | string_t | optional |
| `size` | long_t | recommended |
| `smtp_from` | email_t | recommended |
| `smtp_to` | email_t | recommended |
| `subject` | string_t | recommended |
| `to` | email_t | recommended |
| `to_mailboxes` | string_t | optional |
| `uid` | string_t | recommended |
| `urls` | object (url) | optional |
| `x_originating_ip` | ip_t | optional |

## Constraints

At least one of: `from`, `to`

## Used By

- [email_activity](../classes/email_activity.md)
