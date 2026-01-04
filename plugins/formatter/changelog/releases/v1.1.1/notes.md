This release improves shell script formatting by adding EditorConfig support, ensuring formatting aligns with repository-specific conventions.

## 🔧 Changes

### EditorConfig support for shell script formatting

The `shfmt` integration now respects `.editorconfig` files when formatting shell scripts. Previously, `shfmt` always used hard-coded defaults (`-i 2 -ci -bn`), ignoring repository-specific formatting rules. The hook now searches for an `.editorconfig` file from the script's directory up to the working directory root. If found, `shfmt` defers to those settings; otherwise, it falls back to the original defaults.

This change ensures shell script formatting aligns with repository conventions while maintaining backward compatibility for projects without `.editorconfig`.

*By @mavam and @claude.*
