This is the first stable release of the formatter plugin. It improves portability with a standard shebang and adds support for MDX file formatting to prevent lint failures in projects using MDX.

## 🐞 Bug fixes

### Add MDX file support to formatter hook

The format hook now formats `.mdx` files with markdownlint and prettier, preventing lint failures in projects that use MDX.

*By @mavam and @claude.*

### Use portable shebang in formatter hook

The shebang now uses `#!/usr/bin/env bash` instead of `#!/bin/bash` for portability across systems where bash may be installed in different locations.

*By @mavam and @claude.*
