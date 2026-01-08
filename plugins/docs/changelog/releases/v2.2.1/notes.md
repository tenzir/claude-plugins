This release fixes two bugs in the documentation reader subagent. The reader now reports all examples from operator and function pages instead of only the first one, and only reports verbatim examples from the documentation instead of synthesizing potentially incorrect code.

## 🐞 Bug fixes

### Complete example reporting in documentation reader

The documentation reader now reports all examples from operator and function pages instead of only the first one.

*By @mavam and @claude.*

### Stricter documentation reader behavior

The `docs:reader` subagent now only reports verbatim examples from the documentation instead of synthesizing code that may be incorrect.

*By @mavam and @claude.*
