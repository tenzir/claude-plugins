# Development Dependencies

Standard dev dependencies for Tenzir Python projects.

```toml
[dependency-groups]
dev = [
  "pytest>=8.3.0",
  "pytest-cov>=5.0.0",
  "mypy>=1.11.0",
  "ruff>=0.7.0",
  "coverage[toml]>=7.6.0",
]
```

## Key Points

- **Ruff**: Linting and formatting
- **Mypy**: Static type checking
- **Pytest + pytest-cov**: Testing with coverage
- **Coverage**: Coverage reporting with TOML config support

Add type stubs as needed (e.g., `types-pyyaml` for PyYAML).
