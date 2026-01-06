# Script

The Script object describes a script or command that can be executed by a shell, script engine, or interpreter. Examples include Bash, JavsScript, PowerShell, Python, VBScript, etc. Note that the term <em>script</em> here denotes not only a script contained within a file but also a script or command typed interactively by a user, supplied on the command line, or provided by some other file-less mechanism.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `file` | object (file) | optional |
| `hashes` | object (fingerprint) | recommended |
| `name` | string_t | optional |
| `parent_uid` | string_t | optional |
| `script_content` | object (long_string) | required |
| `type` | string_t | optional |
| `type_id` | integer_t | required |
| `uid` | string_t | optional |

## Used By

- [script_activity](../classes/script_activity.md)
