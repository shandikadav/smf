# Changelog

Notable changes follow [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - Unreleased

Release preparation only. The latest published version verified on 5 October 2026 is `1.0.0+1`. See the [migration guide](https://github.com/shandikadav/smf/blob/main/doc/migration-2.0.0.md) before upgrading.

### Breaking changes

- Raise the CLI's minimum Dart SDK from `3.0.0` to `3.8.0`, matching the existing lint dependency.
- New Riverpod projects use `flutter_riverpod: ^3.0.0` and manual `NotifierProvider` templates instead of the previous Riverpod 2 `StateNotifier` scaffold. Riverpod annotation/generator packages are no longer installed by default.
- Require `--state-management bloc` or `--state-management riverpod` when both packages are direct dependencies; previously selection was implicit.
- Require Equatable as a direct dependency before generating a BLoC feature.

### Added

- Generated pages connected to their BLoC/provider, with a Load button demonstrating loading and success states.
- `.env.example` for setting up cloned generated apps.
- A generated home page widget test replacing Flutter's default counter test.
- 16 CLI regression tests covering creation safety, dependency detection, state management selection, generated pages, and source/bundle consistency.
- A scaffold verification tool covering both presets with BLoC/Riverpod 3 and feature generation with Riverpod 2; includes `--offline`, `--keep`, and `--preset` options.
- Pub.dev installation and usage documentation, a 2.0.0 migration guide, and a maintainer publishing guide.

### Fixed

- Create projects in an owned temporary directory and preserve existing destination files, directories, and symlinks during failure handling.
- Recheck the destination before moving a completed scaffold, including when another path appears during creation.
- Generate Envied configuration during creation and declare obfuscated Enterprise API keys as `static final`.
- Replace references to Flutter's removed `MyApp` counter scaffold in the generated widget test.
- Parse actual YAML dependencies rather than matching package names in comments or development dependencies; report malformed YAML before feature generation.
- Remove the default Riverpod generator dependency combination that could conflict with Envied generation.
- Guard BLoC/provider updates after disposal or completion.
- Avoid following symlinks when removing empty template files.

### Changed

- Support manual Riverpod feature templates in existing Riverpod 2 and Riverpod 3 apps.
- Read the Dio base URL from Envied configuration and enable HTTP logging only in debug builds, without headers or bodies.
- Ignore generated environment values and local environment files in generated apps' Git configuration while keeping `.env.example`.
- Reuse the generated application theme, remove empty files from disabled template sections, and format completed projects.
- Replace the unused `yaml_edit` dependency with `yaml` for dependency detection.
- Clarify that Firebase selection installs packages, localization needs application setup, and Enterprise entry points need additional configuration for native flavors.
- Exclude repository tests that need raw bricks, and local environment files, from the published archive.

### Verification

- CLI analyzer and all 16 regression tests passed.
- Generated apps passed `flutter analyze` and `flutter test` for BLoC MVP, BLoC Enterprise, Riverpod 3 MVP, Riverpod 3 Enterprise, and Riverpod 2 compatibility.
- Scaffold verification used Flutter `3.47.6` and Dart `3.13.5`. Native Android/iOS builds, Firebase initialization, and execution on the minimum supported Dart SDK require separate verification.

## [1.0.0+1] - 2026-08-13

### Added

- `version` command: print the SMF version via `smf version`, `smf --version`, or `smf -v`.
- Global `--version` / `-v` flag registered on the CLI runner.

### Fixed

- Dependency conflict between `envied_generator` and `riverpod_generator` when using Riverpod 3.
- Pin the Riverpod preset to the 2.x series: `flutter_riverpod: ^2.6.1`, `riverpod_annotation: ^2.6.1`, and `riverpod_generator: ^2.6.4`.

### Changed

- Change the license from MIT to BSD 3-Clause.
- Format source files with `dart format`.

## [1.0.0] - 2026-08-13

### Added

- Initial release of the `setup_my_flutter` CLI.
- Interactive `create` command for Flutter projects with a feature-first clean architecture structure.
- `generate feature` command for state management, pages, and architecture layers.
- Bundled Mason `project_structure` and `feature` bricks.
- Package presets for common Flutter project setups.
- Rollback support for failed creation.
