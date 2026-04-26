# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2026-04-26

### Added

- `Fixate.start/1` now accepts a `fixture_path:` option to configure the fixture directory (e.g. `Fixate.start(fixture_path: "test/fixtures")`).
- Fixture path can also be set via application config: `config :fixate, fixture_path: "test/fixtures"`.
- `Fixate.fixture_path/0` returns the currently configured fixture base path.
- `Fixate.FixtureNotFoundError` exception module for missing fixture files.

### Changed

- Agent state restructured internally to `%{parsers: %{}, fixture_path: path, cache: %{}}`.
- `Fixate.Case` now reads the fixture path from the Agent rather than hardcoding `priv/fixtures`.

### Performance

- Parsed fixture files are now cached in Agent state for the duration of the test run. A fixture file read more than once (across tests) is only read from disk and parsed once.

### Fixed

- Missing fixture files now raise `Fixate.FixtureNotFoundError` with a message indicating the path and a hint to check the project root, instead of a raw `File.read!` error.

## [0.1.0] - 2019-05-01

First release.
