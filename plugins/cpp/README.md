# C++

C++ language support, tooling, and coding conventions for Claude Code. Provides
LSP integration via clangd for code intelligence, along with style guidelines
covering naming, class structure, templates, and documentation.

## ✨ Features

- 🛠️ **LSP Integration**: Code intelligence via clangd (go-to-definition,
  find-references, hover, diagnostics)
- 📝 **Coding Conventions**: Style guidelines and clang tooling configuration

## 📦 Installation

```
/plugin install cpp@tenzir
```

## 🚀 Usage

### LSP

Open any C++ file to activate clangd language server for code intelligence.

### Coding Conventions

The `following-conventions` skill activates when editing `.cpp` or `.hpp` files,
providing style guidance for:

**Naming**: Claude uses `snake_case` everywhere except template parameters:

```cpp
// Claude will generate this:
class table_slice { ... };
auto make_slice(const record& r) -> table_slice;

// Not this:
class TableSlice { ... };
TableSlice makeSlice(const Record& r);
```

**Member variables** get a trailing underscore; getters/setters share the name:

```cpp
class connection {
public:
  auto timeout() const -> duration { return timeout_; }
  void timeout(duration d) { timeout_ = d; }
private:
  duration timeout_;
};
```

**Style preferences** like west const and almost-always-auto:

```cpp
// Claude writes this:
auto x = int64_t{0};
const std::string& name = get_name();

// Not this:
int64_t x = 0;
std::string const& name = get_name();
```

**Class structure** follows public-first ordering with explicit constructors:

```cpp
class parser {
public:
  explicit parser(std::string_view input);  // explicit for single-arg
  auto parse() -> result;
private:
  std::string_view input_;
};
```

The skill relies on `.clang-format` and `.clang-tidy` in your repository root
for formatting and linting. Project-specific configuration should be documented
in your project's `.claude/` directory.

## Related Plugins

- **formatter@tenzir**: Auto-formats C++ files with `clang-format` on
  Write/Edit operations
