# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0+1] - 2026-08-13

### Added
- `version` command: print the current SMF version via `smf version`, `smf --version`, or `smf -v`.
- Global `--version` / `-v` flag registered on the CLI runner.

### Fixed
- Dependency conflict between `envied_generator` and `riverpod_generator` when using Riverpod v3 (`>=3.4.2`).
  Riverpod preset packages are now pinned to the stable v2 series:
  `flutter_riverpod:^2.6.1`, `riverpod_annotation:^2.6.1`, `riverpod_generator:^2.6.4`.

### Changed
- License updated from MIT to **BSD 3-Clause** — the license recommended by the Dart and Flutter teams.
- Applied `dart format` to all source files.

## [1.0.0] - 2026-08-13

### Added
- Initial release of `setup_my_flutter` CLI tool.
- `create` command: Scaffolds a new Flutter project with Feature-First (Clean Architecture) structure.
- `generate` command: Generates individual features with BLoC, pages, providers, and clean architecture layers.
- Mason brick integration: Bundled `project_structure` and `feature` bricks.
- Preset support: Predefined package presets for common Flutter project setups.
- Rollback support: Automatically rolls back changes on failure.
