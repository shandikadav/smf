# Publishing SMF

This guide is for maintainers publishing `setup_my_flutter` to pub.dev. Documentation commands below do not publish anything until `dart pub publish` is explicitly run.

## Current release preparation

The latest pub.dev release verified on 5 October 2026 is `1.0.0+1`. The source checkout is prepared for **2.0.0**, with an **Unreleased** changelog entry.

A major release communicates the raised Dart SDK minimum, the new Riverpod default/template, and stricter feature-generation requirements. Check the [migration guide](migration-2.0.0.md) when reviewing the release.

Keep these values aligned:

| File | Value |
| --- | --- |
| `pubspec.yaml` | `version: 2.0.0` |
| `lib/src/commands/version_command.dart` | `smfVersion = '2.0.0'` |
| `CHANGELOG.md` | `[2.0.0]` release entry |

Immediately before publishing, replace `Unreleased` with the actual release date, remove the README's release-preparation notice, and update the migration guide's availability wording. Check pub.dev again to ensure this version has not already been published. Published versions cannot be replaced with edited contents.

## Build and verify from the repository

Raw Mason bricks and maintenance tools are available in a source checkout. Changes to a brick must be rebuilt into the bundled Dart templates before release:

```sh
dart pub get
dart run tool/bundle_bricks.dart
dart format bin lib/setup_my_flutter.dart lib/src/commands lib/src/core lib/src/utils lib/src/templates/bundles test tool
dart analyze
dart test
dart run bin/main.dart --version
dart run bin/main.dart generate feature --help
dart run tool/verify_scaffolds.dart
```

Do not run the formatter over raw `__brick__` Dart files: those contain Mustache template syntax. The generated projects are formatted during creation.

The scaffold verification tool creates four projects: BLoC and Riverpod 3, each with MVP and Enterprise. It generates additional features, runs `flutter analyze` and `flutter test`, then checks feature generation with Riverpod 2. Firebase packages are disabled in this matrix. A failed run exits with a nonzero code and retains logs and generated projects for inspection.

Optional verification modes:

```sh
dart run tool/verify_scaffolds.dart --offline --keep
dart run tool/verify_scaffolds.dart --preset enterprise
```

`--offline` needs cached dependencies. `--keep` retains successful runs too. `--preset enterprise` checks only Enterprise projects and omits the Riverpod 2 check, which uses the MVP project.

Record the actual SDK versions used. The current changes passed scaffold analysis and widget tests with Flutter `3.47.6` / Dart `3.13.5`. Verify the minimum supported SDK and native builds separately before claiming those targets are tested.

## Validate the publication archive

Run a publication dry run:

```sh
dart pub publish --dry-run
```

This validates package metadata and analyzes the package as it will be published, without uploading it. Review both the archive listing and all reported warnings.

The archive should contain:

- `pubspec.yaml`, README, changelog, license, and documentation.
- CLI entry points and implementation.
- `lib/src/templates/bundles/feature_bundle.dart` and `project_structure_bundle.dart`.

The archive should exclude raw `lib/src/templates/bricks/`, repository-only `test/`, `tool/`, local environment files, caches, and build output. Repository tests read raw bricks to check bundle consistency; both are intentionally excluded from the published package. `.env.example` is allowed as a placeholder example if one is added to the package repository.

If the dry run reports uncommitted Git changes, review and commit the intended release contents before publication. Resolve dependency or analyzer errors and inspect metadata warnings before continuing. Keep README examples aligned with the actual archive and supported commands.

## Publish and check the release

When the release contents, date, verification, and publisher authorization are ready:

```sh
dart pub publish
```

Follow Dart's authentication and confirmation flow using an account with permission to publish `setup_my_flutter`.

After successful publication, verify [the pub.dev package page](https://pub.dev/packages/setup_my_flutter) and install the published artifact:

```sh
dart pub global activate setup_my_flutter 2.0.0
smf --version
smf generate feature --help
```

Run a small project creation smoke test with the installed executable to confirm bundled templates work from the published archive. Record the release in your repository using its normal commit/tag workflow.

Reference: [Dart publishing guide](https://dart.dev/tools/pub/publishing) and [global activation documentation](https://dart.dev/tools/pub/cmd/pub-global).
