This release updates the docs plugin command scripts to use bun instead of pnpm, aligning with the Tenzir documentation site's package manager migration.

## 🔧 Changes

### Bun package manager support in command scripts

The docs plugin commands now use `bun run` instead of `pnpm` to align with the Tenzir documentation site's migration to bun as its package manager. This affects the `/docs:write`, `/docs:pr`, and `/docs:review` commands, which now invoke `bun run lint:fix` and `bun run dev` when working with the documentation repository.

*By @mavam and @claude.*
