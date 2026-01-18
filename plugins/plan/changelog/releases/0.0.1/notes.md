This release introduces the plan review plugin, which automatically evaluates implementation plans using external AI tools when exiting plan mode.

## 🚀 Features

### Automated plan review with AI tools

The plan review plugin automatically evaluates your implementation plans using external AI tools when you exit plan mode. Configure multiple review tools (Codex, Gemini, or CLI-based tools) that run in parallel and report findings on a P1-P4 severity scale. P1 (critical) issues block plan approval by default, while P2 (major) issues provide guidance without blocking. Control review behavior through environment variables for tool selection, timeout durations, and blocking policies.

*By @mavam and @claude.*
