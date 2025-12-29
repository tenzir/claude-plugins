---
name: following-conventions
description: C++ coding conventions. Use when editing .cpp/.hpp files or asking about C++ style.
---

# C++ Coding Conventions

General C++ coding standards based on STL and modern C++ best practices.

## Tooling

Use clang-format for formatting and clang-tidy for linting. The `.clang-format`
and `.clang-tidy` files in the repository root are authoritative—run the tools
and trust the output.

## Style Conventions

These are not enforced by tooling:

- **West const**: `const T&` not `T const&`
- **Prefer `auto`**: Unless you need a type conversion
- **Vertical whitespace**: Avoid blank lines within functions. Use comments
  to separate logical blocks instead.
- **Naming**: See [naming.md](./naming.md)

## File Organization

- Headers: `.hpp`, implementation: `.cpp`
- Forward declarations: `<module>/fwd.h`
- Use `#pragma once`—no manual include guards
- Function parameters: inputs first, then outputs

## Classes

**Member order:**

1. `public`, then `protected`, then `private`
2. Within each: constructors, operators, mutating members, accessors
3. Friends immediately after opening the class

**Rules:**

- Mark single-argument constructors `explicit`
- Use `explicit(false)` when implicit conversion is intentional
- Follow the rule of zero or rule of five
- Declare move operations `noexcept`
- Use `struct` for state-less types or when the API is the struct's state

## Template Metaprogramming

- Use `class` for template parameters; `typename` only for dependent types
- Name parameters `T`, packs `Ts`, arguments `x`, packs `xs`
- Provide `*_t` and `*_v` helpers for traits

## Comments

- `FIXME:` for bugs, `TODO:` for improvements (colon required)
- Doxygen: `///` with Markdown, `@param`, `@returns`, `@pre`, `@post`
