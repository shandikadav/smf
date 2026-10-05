# Setup My Flutter (SMF)

[![pub package](https://img.shields.io/pub/v/setup_my_flutter.svg)](https://pub.dev/packages/setup_my_flutter)
[![Dart SDK](https://img.shields.io/badge/Dart-%3E%3D3.8.0-blue.svg)](https://dart.dev)
[![License: BSD-3-Clause](https://img.shields.io/badge/License-BSD--3--Clause-blue.svg)](LICENSE)

A Dart CLI that scaffolds Flutter projects with a feature-first architecture, BLoC or Riverpod, routing, networking, and environment configuration.

**Release status:** This README describes the upcoming **2.0.0** release. It is not published yet. The latest pub.dev release verified on 5 October 2026 is **1.0.0+1**. Commands that request version 2.0.0 will work after publication. To try these changes now, run `dart run bin/main.dart` from this source checkout.

See the [changelog](CHANGELOG.md), [migration guide](https://github.com/shandikadav/smf/blob/main/doc/migration-2.0.0.md), and [publishing guide](https://github.com/shandikadav/smf/blob/main/doc/publishing.md).

## Requirements

| Tool | Requirement for SMF 2.0.0 |
| --- | --- |
| Dart | `>=3.8.0 <4.0.0` |
| Flutter | Installed and available on `PATH`; needed to create and verify apps |
| Dependencies | Network access for package resolution, or a populated local package cache |

The Dart constraint applies to the CLI. Generated apps use packages resolved by `flutter pub add`; their current versions can require a newer Flutter/Dart SDK. Check your installation with `dart --version` and `flutter --version`.

## Install from pub.dev

Activate the latest published release:

```sh
dart pub global activate setup_my_flutter
smf --version
```

Run the same activation command to update an existing installation. After 2.0.0 is published, you can request it explicitly:

```sh
dart pub global activate setup_my_flutter 2.0.0
```

The package provides `smf` and `setup_my_flutter` for the full CLI, plus `create` as a shortcut for interactive project creation. If the executable is not found, add Dart's global package executable directory to your `PATH`, following the [Dart global activation documentation](https://dart.dev/tools/pub/cmd/pub-global#running-a-script-from-your-path).

You can also add SMF to an existing Flutter project's `dev_dependencies`. This example targets the upcoming release:

```yaml
dev_dependencies:
  setup_my_flutter: ^2.0.0
```

```sh
flutter pub get
dart run setup_my_flutter --help
dart run setup_my_flutter generate feature auth
```

## Create a project

```sh
smf create
```

The interactive prompts ask for a project name, state management, preset, optional Firebase packages, and confirmation. Use a lowercase `snake_case` name beginning with a letter and containing at least two characters; reserved Dart keywords are rejected.

SMF creates the project in a temporary directory, installs dependencies, generates the scaffold and environment configuration, and formats the result. It moves the completed project to the requested directory only after those steps succeed. Existing destination files, directories, and symlinks are rejected. On failure, SMF removes its temporary directory.

For a project named `my_app`:

```sh
cd my_app
flutter analyze
flutter test
flutter run
```

The generated home page has a **Load** button wired to its BLoC or Riverpod notifier. The sample state changes from `initial` through `loading` to `success`. Replace the placeholder loading logic with your application's behavior.

## Generate a feature

Run this from the Flutter project root, beside `pubspec.yaml`:

```sh
smf generate feature auth
```

SMF reads the actual `dependencies` YAML mapping. Comments and `dev_dependencies` do not determine the generated state management.

| Installed dependencies | Generated feature |
| --- | --- |
| `flutter_bloc` and `equatable` | BLoC, event, state, and a page using `BlocProvider`/`BlocBuilder` |
| `flutter_riverpod` | Manual `NotifierProvider` and a `ConsumerWidget` page; supports Riverpod 2 and 3 |
| Both state management packages | Explicit `--state-management` selection required |
| Neither state management package | Stateless page and architecture folders, without state management files |

For a project containing both packages:

```sh
smf generate feature auth --state-management bloc
smf generate feature preferences --state-management riverpod
```

The selected package must be a direct dependency. For BLoC, add Equatable if it is missing:

```sh
flutter pub add equatable
```

For Riverpod, ensure `ProviderScope` wraps your app. SMF does this when creating a Riverpod project.

Feature generation does not register a route automatically. In a project created by SMF, import the page in `lib/app/router/app_router.dart`:

```dart
import '../../features/auth/presentation/pages/auth_page.dart';
```

Add this entry to `AppRouter.router`'s `routes` list:

```dart
GoRoute(
  path: '/auth',
  name: 'auth',
  builder: (context, state) => const AuthPage(),
),
```

An existing feature is rejected by default. To regenerate it:

```sh
smf generate feature auth --force
```

`--force` overwrites matching generated files. Save custom changes first and review the resulting diff before continuing.

## Presets

| Component | MVP / Lite | Enterprise |
| --- | --- | --- |
| State management | BLoC + Equatable, or Riverpod 3 | BLoC + Equatable, or Riverpod 3 |
| Routing and HTTP | `go_router`, `dio` | `go_router`, `dio` |
| Preferences | `shared_preferences` | `shared_preferences` |
| Secure storage | — | `flutter_secure_storage` |
| Localization package | — | `easy_localization` |
| Environment | Envied `BASE_URL` | Envied `BASE_URL` and obfuscated `API_KEY` |
| Entry points | `main.dart` | `main.dart`, `main_dev.dart`, `main_stg.dart`, `main_prod.dart` |

New Riverpod projects use `flutter_riverpod: ^3.0.0`. The templates use manual providers, so SMF does not install `riverpod_annotation` or `riverpod_generator`.

The Enterprise entry points initially launch the same app. You can select one with:

```sh
flutter run -t lib/main_dev.dart
```

Configure distinct environment values and native Android/iOS flavors yourself if your app needs them. The generator does not create native flavor definitions. Enterprise includes the localization package; translation assets, asset declarations, and localization initialization still need to be added for your app.

Selecting Firebase installs `firebase_core` and `firebase_analytics`. Configure your Firebase project, platform files, and initialization before using those services. The generated app does not initialize Firebase automatically.

The data and domain layers are starting points. Implement models, repositories, entities, and use cases for your application.

## Environment and networking

Creation writes `.env` and `.env.example`. MVP includes:

```dotenv
BASE_URL=https://api.example.com
```

Enterprise also includes the placeholder `API_KEY=your_api_key_here`. Update the values in `.env`, then regenerate configuration:

```sh
dart run build_runner build
```

SMF runs this generation step during project creation. The generated `.gitignore` excludes `.env`, other `.env.*` files, and `*.g.dart`, while keeping `.env.example` available as a setup reference.

After cloning a generated app, restore its local environment and generated files before building:

```sh
cp .env.example .env
# Edit .env with the values for this environment.
flutter pub get
dart run build_runner build
flutter analyze
flutter test
```

Dio reads its base URL from `Env.baseUrl`. HTTP logging is enabled only in debug builds and excludes request/response headers and bodies.

Envied embeds configuration into the compiled application. Obfuscation does not turn a client-side value into a server secret; keep privileged credentials on your backend. See the [Envied documentation](https://pub.dev/packages/envied).

## Generated structure

```text
my_app/
├── .env
├── .env.example
├── lib/
│   ├── main.dart
│   ├── app/
│   │   ├── app.dart
│   │   └── router/app_router.dart
│   ├── core/
│   │   ├── config/env.dart
│   │   ├── constants/app_constants.dart
│   │   ├── network/dio_client.dart
│   │   └── theme/app_theme.dart
│   └── features/
│       └── home/
│           ├── data/
│           │   ├── models/
│           │   └── repositories/
│           ├── domain/
│           │   ├── entities/
│           │   └── usecases/
│           └── presentation/
│               ├── bloc/ or providers/
│               ├── pages/home_page.dart
│               └── widgets/
├── test/widget_test.dart
└── pubspec.yaml
```

The state management folder depends on your selection. Empty Dart files from disabled template sections are removed. Enterprise adds the extra entry points listed above. Flutter also creates the platform directories for the installed SDK's default targets.

## CLI reference

| Command | Purpose |
| --- | --- |
| `smf create` | Start interactive project creation |
| `smf generate feature <name>` | Generate a feature; prompts for a name if omitted |
| `smf generate feature <name> --state-management bloc` | Choose BLoC explicitly |
| `smf generate feature <name> --state-management riverpod` | Choose Riverpod explicitly |
| `smf generate feature <name> --force` | Overwrite matching feature files |
| `smf version`, `smf --version`, `smf -v` | Print the CLI version |
| `smf --help` | Show available commands |
| `smf generate feature --help` | Show feature options |

## Troubleshooting

| Symptom | Action |
| --- | --- |
| Destination already exists | Choose another project name or move the existing path. |
| No `pubspec.yaml` found | Run feature generation from the Flutter project root. |
| Both BLoC and Riverpod are installed | Pass `--state-management bloc` or `--state-management riverpod`. |
| Equatable is missing | Run `flutter pub add equatable` for the BLoC template. |
| Feature already exists | Use another name, or save your changes before using `--force`. |
| `env.g.dart` is missing | Create `.env` and run `dart run build_runner build`. |
| Package resolution fails | Read the Flutter/Dart SDK constraint error and update the SDK or adjust dependencies. |

## Development and verification

Use a source checkout for development. The published package contains bundled templates; raw Mason bricks, repository tests, and maintenance tools are excluded from the pub archive.

```sh
dart pub get
dart analyze
dart test
dart run tool/verify_scaffolds.dart
```

The verification tool creates BLoC and Riverpod projects for both presets, generates extra features, and runs Flutter analysis and widget tests. It also checks feature generation in a Riverpod 2 project. Firebase packages are disabled in this verification matrix.

For cached dependencies or a smaller run:

```sh
dart run tool/verify_scaffolds.dart --offline --keep
dart run tool/verify_scaffolds.dart --preset enterprise
```

See [Publishing SMF](https://github.com/shandikadav/smf/blob/main/doc/publishing.md) for bundle rebuilding, release checks, and pub.dev publication.

## License

[BSD 3-Clause](LICENSE).
