---
title: Automated review setup with project context awareness
type: change
authors:
  - mavam
  - claude
created: 2026-01-19T19:29:51.490404Z
---

The `review` command now features automated setup and project-aware reviews through hook-based automation and an Explore agent phase.

Two new hooks run automatically before spawning reviewers:

- **Scope detection hook** determines what to review (staged, unstaged, or branch changes) and outputs the file list
- **Review directory hook** creates a timestamped directory at `.reviews/<date>/<session_id>/` for persistent findings

Before spawning specialized reviewers, the command launches an Explore agent to gather project context by examining config files and the README. This context calibrates reviewer relevance scoring, with reviewers deducting confidence points when concerns don't apply to the project.

The reviewing methodology now emphasizes finding relevance to the specific project context, helping filter out generic concerns that don't match the codebase's nature (e.g., performance concerns for static documentation sites).
