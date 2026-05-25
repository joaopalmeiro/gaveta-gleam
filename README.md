# gaveta

Vanilla utility functions for different projects.

[![Package Version](https://img.shields.io/hexpm/v/gaveta)](https://hex.pm/packages/gaveta)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/gaveta/)

```sh
gleam add gaveta
```

## Development

Install [mise](https://mise.jdx.dev/getting-started.html), [1Password](https://1password.com/downloads/), and [1Password CLI](https://developer.1password.com/docs/cli/get-started/) (if necessary).

```bash
mise install && gleam --version
```

```bash
gleam format
```

```bash
gleam check
```

```bash
gleam test
```

## Deployment

Bump the `version` in the [gleam.toml](gleam.toml) file.

Commit and push changes.

```bash
HEXPM_API_KEY="op://Development/gaveta-gleam/HEXPM_API_KEY" op run -- gleam publish
```

```bash
git tag
```

```bash
git tag "v$(grep '^version' gleam.toml | cut -d '"' -f2)"
```

```bash
git push origin "v$(grep '^version' gleam.toml | cut -d '"' -f2)"
```
