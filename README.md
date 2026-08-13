# 🚀 Setup My Flutter (SMF)

A CLI tool for scaffolding Flutter projects with **Feature-First** architecture. Built with **Dart**, **Mason Engine**, and **interactive prompts** via `mason_logger`.

---

## ✨ Features

- **Interactive CLI** — Guided wizard with prompts for project configuration
- **Feature-First Architecture** — Clean architecture folder structure per feature (presentation, data, domain)
- **Preset System** — Choose between **MVP** (lightweight) or **Enterprise** (full-featured)
- **State Management** — Supports **BLoC** and **Riverpod** with conditional template generation
- **Firebase Integration** — Optional `firebase_core` + `firebase_analytics` setup
- **Multi-Flavor** — Enterprise preset auto-generates `dev`, `stg`, `prod` entry points
- **Environment Config** — Auto-setup `envied` with `.env` file
- **Rollback Mechanism** — Auto-cleanup if the process fails mid-way
- **Idempotent Feature Generation** — Won't overwrite existing features (unless `--force` is used)
- **Validation** — Validates project/feature names against Dart package naming rules

---

## 📦 Requirements

| Dependency | Version |
|---|---|
| Dart SDK | `>=3.0.0` |
| Flutter SDK | Installed and available in `PATH` |

---

## 📖 Guide

### 1. Install the package

**Option A — Global activate (recommended):**

```bash
dart pub global activate --source path .
```

Now you can use `smf` from anywhere:

```bash
smf create
smf generate feature auth
```

**Option B — Add as a dev dependency in your project:**

```yaml
dev_dependencies:
  setup_my_flutter:
    git:
      url: <repo-url>
```

Then run:

```bash
flutter pub get
```

### 2. Create a new project

```bash
# If globally activated
smf create

# If added as dev dependency
dart run setup_my_flutter create
```

The CLI will walk you through an interactive wizard:

```
? Project name (snake_case): my_awesome_app
❯ Select state management:
    BLoC (flutter_bloc)
    Riverpod (flutter_riverpod)
❯ Select project preset:
    MVP / Lite
    Enterprise
? Include Firebase integration? (y/N): N

📋 Summary:
  Project:    my_awesome_app
  State Mgmt: BLoC (flutter_bloc)
  Preset:     MVP / Lite
  Firebase:   No

? Proceed with creation? (Y/n): Y
```

What happens under the hood:

1. Validates project name (snake_case)
2. Runs `flutter create` with auto-rollback on failure
3. Injects all dependencies via `flutter pub add`
4. Generates Feature-First folder structure via Mason brick
5. Creates `.env` file for envied configuration

### 3. Generate a new feature

Navigate to your Flutter project root, then:

```bash
# If globally activated
smf generate feature auth

# If added as dev dependency
dart run setup_my_flutter generate feature auth
```

To overwrite an existing feature, use the `--force` flag:

```bash
smf generate feature auth --force
```

The command auto-detects your state management from `pubspec.yaml`:
- `flutter_bloc` found → generates BLoC files (event, state, bloc)
- `flutter_riverpod` found → generates Riverpod provider files

---

## 📦 Project Presets

### MVP / Lite

Lightweight setup for rapid prototyping or small-to-medium projects.

| Package | Purpose |
|---|---|
| `go_router` | Declarative routing |
| `dio` | HTTP client |
| `shared_preferences` | Local key-value storage |
| `envied` | Environment variables (build-time) |
| `flutter_bloc` / `flutter_riverpod` | State management (choose one) |

Dev dependencies: `envied_generator`, `build_runner`

### Enterprise

All MVP packages **plus**:

| Package | Purpose |
|---|---|
| `flutter_secure_storage` | Encrypted local storage |
| `easy_localization` | Multi-language / i18n support |

Additional features:
- Multi-flavor entry points (`main_dev.dart`, `main_stg.dart`, `main_prod.dart`)
- Extended `.env` config with obfuscated API key

---

## 🏗 Generated Structure

### Project Structure (from `smf create`)

```
my_awesome_app/
├── lib/
│   ├── main.dart
│   ├── main_dev.dart              # Enterprise only
│   ├── main_stg.dart              # Enterprise only
│   ├── main_prod.dart             # Enterprise only
│   ├── app/
│   │   ├── app.dart               # Root widget (MaterialApp.router)
│   │   └── router/
│   │       └── app_router.dart    # GoRouter configuration
│   ├── core/
│   │   ├── config/
│   │   │   └── env.dart           # Envied environment config
│   │   ├── constants/
│   │   │   └── app_constants.dart
│   │   ├── network/
│   │   │   └── dio_client.dart    # Configured Dio singleton
│   │   ├── theme/
│   │   │   └── app_theme.dart     # Material 3 theme
│   │   └── utils/
│   └── features/
│       └── home/
│           ├── presentation/
│           │   ├── pages/
│           │   │   └── home_page.dart
│           │   ├── widgets/
│           │   └── bloc/          # BLoC files (if BLoC is selected)
│           │       ├── home_bloc.dart
│           │       ├── home_event.dart
│           │       └── home_state.dart
│           ├── data/
│           │   ├── repositories/
│           │   └── models/
│           └── domain/
│               ├── entities/
│               └── usecases/
├── .env                           # Environment variables
├── pubspec.yaml
└── ...
```

### Feature Structure (from `smf generate feature`)

```
lib/features/<feature_name>/
├── presentation/
│   ├── pages/
│   │   └── <feature_name>_page.dart
│   ├── widgets/
│   └── bloc/                      # or providers/ for Riverpod
│       ├── <feature_name>_bloc.dart
│       ├── <feature_name>_event.dart
│       └── <feature_name>_state.dart
├── data/
│   ├── repositories/
│   └── models/
└── domain/
    ├── entities/
    └── usecases/
```

---

## 🏛 Architecture

```
bin/
├── main.dart                     # CLI entry point (smf)
├── setup_my_flutter.dart         # Package entry point (dart run setup_my_flutter)
└── create.dart                   # Direct create (dart run setup_my_flutter:create)
lib/
├── setup_my_flutter.dart         # Library barrel export
└── src/
    ├── commands/
    │   ├── create_command.dart
    │   ├── generate_command.dart
    │   ├── generate_feature_command.dart
    │   └── presets.dart
    ├── core/
    │   ├── cli_exception.dart
    │   ├── rollback.dart
    │   └── shell_runner.dart
    ├── templates/
    │   └── bricks/
    │       ├── project_structure/
    │       └── feature/
    └── utils/
        ├── file_manager.dart
        └── string_utils.dart
```

### Design Principles

1. **Rollback Safety** — Every created directory is tracked. If the process fails, everything is automatically cleaned up to prevent dirty state.
2. **No Raw pubspec.yaml Edits** — Dependencies are always added via `flutter pub add`, never through string manipulation.
3. **User-Friendly Errors** — All exceptions are wrapped in `CliException` with clear messages and mitigation steps. No raw stack traces are shown to the user.
4. **Idempotency** — `generate feature` will not overwrite an existing folder unless the `--force` flag is explicitly provided.
5. **Validation First** — Project and feature names are validated before any subprocess is executed.

---

## 🛠 Development

```bash
# Install dependencies
dart pub get

# Run CLI locally
dart run bin/main.dart create
dart run bin/main.dart generate feature auth

# Analyze code
dart analyze

# Format code
dart format .

# Run tests
dart test

# Compile to standalone binary
dart compile exe bin/main.dart -o build/smf          # macOS / Linux
dart compile exe bin/main.dart -o build/smf.exe      # Windows
```

### Tech Stack

| Component | Package |
|---|---|
| CLI Framework | `args` (CommandRunner) |
| Templating | `mason` (MasonGenerator + Brick) |
| Logger / Prompts | `mason_logger` |
| YAML Manipulation | `yaml_edit` |
| Path Resolution | `path` |
| Testing | `test`, `mocktail` |

### Mustache Conventions

| Convention | Example |
|---|---|
| Variable (snake_case) | `{{feature_name}}` |
| PascalCase | `{{feature_name.pascalCase()}}` |
| camelCase | `{{feature_name.camelCase()}}` |
| titleCase | `{{feature_name.titleCase()}}` |
| Conditional (opt-in) | `{{#use_firebase}} ... {{/use_firebase}}` |
| Conditional (negative) | `{{^use_riverpod}} ... {{/use_riverpod}}` |

---

## 📄 License

BSD 3-Clause License — See [LICENSE](LICENSE) for details.
