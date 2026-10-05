# Migrating to SMF 2.0.0

SMF 2.0.0 is being prepared and is not published yet. This guide describes changes from the published `1.0.0+1` release. Run the version 2.0.0 installation commands below after it becomes available on pub.dev.

## What changes

| Area | 1.0.0+1 | 2.0.0 |
| --- | --- | --- |
| CLI Dart constraint | `>=3.0.0 <4.0.0` | `>=3.8.0 <4.0.0` |
| New Riverpod projects | Riverpod 2 with `StateNotifier` | Riverpod 3 with manual `NotifierProvider` |
| Default Riverpod codegen dependencies | Annotation and generator packages | Not installed; manual providers |
| Both BLoC and Riverpod installed | Implicit selection | Explicit `--state-management` required |
| BLoC feature dependency | Equatable expected by generated code | Equatable checked before generation |
| Environment generation | Follow-up setup needed | Run during project creation |

Updating SMF changes future generation. It does not migrate an existing app, replace existing features, or upgrade that app's dependencies automatically.

## Update the CLI

Check the installed SDK and then activate the new version:

```sh
dart --version
dart pub global activate setup_my_flutter 2.0.0
smf --version
```

The version output should be `smf version 2.0.0`. If you use SMF as a development dependency, change its constraint to `^2.0.0`, run `flutter pub get`, and use `dart run setup_my_flutter` for CLI commands.

The CLI needs Dart 3.8 or newer. Packages resolved for a newly generated app can impose newer SDK requirements.

## Generate features in existing apps

If both packages are in your app's direct dependencies, choose which one to use:

```sh
smf generate feature auth --state-management bloc
smf generate feature preferences --state-management riverpod
```

For a BLoC app missing Equatable, install it before generation:

```sh
flutter pub add equatable
```

New Riverpod feature templates use manual `NotifierProvider` and work with Riverpod 2 and 3. An existing Riverpod 2 app can generate these features without upgrading to Riverpod 3. Ensure its root widget includes `ProviderScope`, and register each new page in your router.

Existing custom `StateNotifier` features are not rewritten. Migrate them separately if upgrading the application's Riverpod dependency. Keep annotation/generator packages if your own code uses them; the new SMF templates do not require them.

Save custom feature changes before using `--force`, which overwrites matching generated files. Review the diff and rerun your app's analysis and tests afterward.

## Apply environment and networking fixes to older scaffolds

New projects receive these changes automatically. For an older generated app, review and apply the relevant changes manually:

- Use `static final` for Envied fields with `obfuscate: true`, such as the Enterprise API key.
- Create a placeholder `.env.example` for contributors and keep local `.env` values out of Git.
- Ignore `.env`, `.env.*`, and generated `*.g.dart`, with an exception for `.env.example`. If already tracked, ignoring these files does not remove them from Git history or the index.
- Read the Dio base URL from `Env.baseUrl` and restrict logging to debug builds without headers or bodies.
- Replace Flutter's original counter widget test with tests for your actual root widget and feature behavior.

After changing environment values or Envied declarations:

```sh
dart run build_runner build
flutter analyze
flutter test
```

After cloning a newly generated app, copy `.env.example` to `.env`, edit the local values, resolve dependencies, and regenerate configuration before building. Envied values remain part of the compiled client application; privileged credentials belong on your backend.

## Complete application-specific setup

Firebase selection installs packages; you still need Firebase project/platform configuration and initialization. Enterprise localization requires translation assets and initialization. The Enterprise Dart entry points initially share the same app and do not define native Android/iOS flavors.

See the [README](../README.md) for current scaffold behavior and [changelog](../CHANGELOG.md) for the complete release notes.
