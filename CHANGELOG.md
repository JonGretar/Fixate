# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `Fixate.start/1` now accepts a `fixture_path:` option to configure the fixture directory (e.g. `Fixate.start(fixture_path: "test/fixtures")`).
- Fixture path can also be set via application config: `config :fixate, fixture_path: "test/fixtures"`.
- `Fixate.fixture_path/0` returns the currently configured fixture base path.

### Changed

- Agent state restructured internally from a flat parser map to `%{parsers: %{}, fixture_path: path}`.
- `Fixate.Case` now reads the fixture path from the Agent rather than hardcoding `priv/fixtures`.

## [0.1.0] - 2019-05-01

First release.
