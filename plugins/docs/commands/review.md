---
description: Review documentation changes for completeness and style
---

# Review documentation

Use the `docs:writing` and `prose:technical-writing` skills for this review.

## 1. Identify changes

Check for uncommitted changes in `.docs/`:

```bash
cd .docs && git diff --stat
```

If there are no changes, inform the user and stop.

## 2. Start preview server

Start the local development server:

```bash
cd .docs && pnpm dev
```

Tell the user the preview is available at `http://localhost:4321` and that they
can check the rendered output while you continue with the review.

## 3. Check documentation completeness

According to `docs:writing`, review the changes for completeness
across documentation sections. Changes often require updates in multiple
sections. For example:

- Reference changes may need corresponding guide updates
- New features often need a guide showing practical usage
- New concepts in explanations should link to relevant guides

Report any completeness gaps and suggest what additional documentation may be
needed.

## 4. Review writing style

According to `prose:technical-writing`, check the changed content for style
issues. Report any issues found with specific suggestions for improvement.

## 5. Summarize review

Provide a summary:

- Files reviewed
- Completeness issues (if any)
- Style issues (if any)
- Recommended next steps

If issues were found, ask if the user wants you to fix them.
