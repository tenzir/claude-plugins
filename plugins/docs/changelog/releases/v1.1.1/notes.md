This release introduces a version-agnostic release workflow that simplifies publishing and CI integration, allowing commands to default to the latest release version. It also improves changelog browsing by sorting module entries chronologically rather than grouping them by project.

## 🚀 Features

### Untitled

The `/docs:write` command now synchronizes the `.docs/` clone before writing documentation. A new `scripts/synchronize-docs.sh` script handles cloning, fetching the latest changes from `main`, and installing dependencies.
