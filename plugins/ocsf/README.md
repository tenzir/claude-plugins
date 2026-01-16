# OCSF

Reference documentation for the Open Cybersecurity Schema Framework (OCSF).
The guide subagent fetches schema documentation directly from Tenzir docs to
answer questions about event classes, objects, attributes, and profiles.

## ✨ Features

- 🗂️ **Schema Navigation**: Hierarchical reference to event classes, objects,
  and profiles across OCSF versions
- 📚 **Core Concepts**: Understand attributes, objects, classes, profiles, and
  extensions
- 🤖 **Guide Subagent**: Fast answers to OCSF schema questions

## 🚀 Usage

### `ocsf:guide` subagent

Delegate OCSF questions to the guide for fast, accurate answers:

```
@ocsf:guide What class should I use for SSH login events?

@ocsf:guide What's the difference between actor and user objects?

@ocsf:guide Which profile adds container context to events?
```
