---
title: Expanded Python conventions guidance
type: change
authors:
  - lava
pr: 6
created: 2026-01-14T10:27:00.11321Z
---

The Python conventions skill now includes expanded guidance on default libraries, package structure, and testing practices. The skill recommends using pydantic for models, FastAPI for REST APIs, and Click for CLI interfaces to maintain consistency across Tenzir repositories. New sections cover package structure best practices, including keeping `__init__.py` files empty and using absolute imports, as well as unit testing conventions with pytest, CliRunner, and parametrization patterns.
