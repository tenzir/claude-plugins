# Kill Chain Phase

The Kill Chain Phase object represents a single phase of a cyber attack, including the initial reconnaissance and planning stages up to the final objective of the attacker. It provides a detailed description of each phase and its associated activities within the broader context of a cyber attack. See  [https://www.lockheedmartin.com/en-us/capabilities/cyber/cyber-kill-chain.html](Cyber Kill Chain®.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `phase` | string_t | recommended |
| `phase_id` | integer_t | required |

## Used By

- [security_finding](../classes/security_finding.md)
