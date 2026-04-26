# Fixate

Fixate is a small ExUnit fixture-loading library (v0.1.0). It loads files from `priv/fixtures/` into the test context via `@fixture` module attributes, with support for custom per-extension parsers registered through an OTP Agent.

## Changelog

Follows [Keep a Changelog 1.1.0](https://keepachangelog.com/en/1.1.0/).

- New work goes under `## [Unreleased]` with subsections (`### Added`, `### Fixed`, etc.)
- Generate a release **ONLY** when instructed to do so.
- On release: replace `## [Unreleased]` with `## [x.y.z] - YYYY-MM-DD` and bump `version:` in `mix.exs`. Create a tag with "v" prefix (`vx.y.z`) in the repository.

## Commands

```bash
mix test              # run tests
mix precommit         # full CI pipeline: compile, format, test, dialyzer, credo
mix credo --strict    # lint
mix dialyzer          # static analysis
```
