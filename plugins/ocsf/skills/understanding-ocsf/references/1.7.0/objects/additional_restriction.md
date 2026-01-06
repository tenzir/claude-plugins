# Additional Restriction

The Additional Restriction object describes supplementary access controls and guardrails that constrain or limit granted permissions beyond the primary policy. These restrictions are typically applied through hierarchical policy frameworks, organizational controls, or conditional access mechanisms. Examples include AWS Service Control Policies (SCPs), Resource Control Policies (RCPs), Azure Management Group policies, GCP Organization policies, conditional access policies, IP restrictions, time-based constraints, and MFA requirements.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `policy` | object (policy) | required |
| `status` | string_t | optional |
| `status_id` | integer_t | recommended |
