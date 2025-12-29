# Objects

Objects are collections of contextually related attributes that represent
entities. They are the reusable building blocks embedded within event classes.

## Common Objects

These foundational objects appear frequently across event classes:

| Object             | Description                                               |
| ------------------ | --------------------------------------------------------- |
| `actor`            | User, role, application, or process that initiated action |
| `device`           | Addressable computer system or host                       |
| `user`             | Person or service account                                 |
| `process`          | Running program with PID, command line, parent            |
| `file`             | File with path, name, hashes, permissions                 |
| `network_endpoint` | Network address with IP, port, protocol                   |
| `cloud`            | Cloud environment context (provider, account, region)     |
| `container`        | Container instance with image, runtime, orchestrator      |
| `metadata`         | Event metadata (product, version, log details)            |
| `observable`       | Indicator with type, value, reputation                    |

## Object Structure

Each object definition includes:

- **Name**: Unique identifier (snake_case)
- **Description**: What the object represents
- **Attributes**: Fields with types and requirements
- **Constraints**: Validation rules (e.g., "at least one of X or Y")

## Cross-references

Objects reference other objects. For example:

- `actor` contains `user`, `process`, `session`
- `process` contains `file` (for executable), `user` (owner)
- `finding` contains `attack`, `evidences`, `remediation`

## Version-Specific Details

For the complete list of objects in each OCSF version, see the versioned
reference documentation under `references/<version>/objects-overview.md`.
Detailed per-object documentation is in `references/<version>/objects/`.
