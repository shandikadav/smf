# 🚀 Setup My Flutter (SMF)

A CLI tool for scaffolding Flutter projects with **Feature-First** architecture. Built with **Dart**, **Mason Engine**, and **interactive prompts** via `mason_logger`.

---

## 📋 Table of Contents

- [Features](#-features)
- [Requirements](#-requirements)
- [Installation](#-installation)
- [Usage](#-usage)
  - [Create Project](#create-project)
  - [Generate Feature](#generate-feature)
- [Project Presets](#-project-presets)
- [Generated Structure](#-generated-structure)
- [Architecture](#-architecture)
- [Development](#-development)
- [License](#-license)

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

## 🔧 Installation

### From Source (Development)

```bash
git clone <repo-url>
cd setup-my-project
dart pub get
```

### Compile to Binary

```bash
dart compile exe bin/main.dart -o build/smf
```

Then add `build/` to your `PATH` or move the binary to `/usr/local/bin/`:

```bash
cp build/smf /usr/local/bin/smf
```

---

## 🚀 Usage

### Create Project

Create a new Flutter project with Feature-First architecture:

```bash
# From source
dart run bin/main.dart create

# From compiled binary
smf create
```

The CLI will guide you through an interactive wizard:

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

#### What Happens During `create`:

1. ✅ Validates project name (snake_case)
2. ✅ Runs `flutter create` → auto-rollback on failure
3. ✅ Injects all dependencies via `flutter pub add`
4. ✅ Injects dev dependencies (`envied_generator`, `build_runner`, etc.)
5. ✅ Generates Feature-First folder structure via Mason brick
6. ✅ Generates home feature with selected state management
7. ✅ Creates `.env` file for envied configuration

---

### Generate Feature

Add a new feature to an existing project:

```bash
# From source
dart run bin/main.dart generate feature auth

# From compiled binary
smf generate feature auth
```

#### Options

| Flag | Shorthand | Description |
|---|---|---|
| `--force` | `-f` | Overwrite feature directory if it already exists |

#### Example with Force

```bash
smf generate feature auth --force
```

#### Auto-Detection

This command automatically detects the state management in use from `pubspec.yaml`:
- If `flutter_bloc` is found → generates BLoC files (event, state, bloc)
- If `flutter_riverpod` is found → generates Riverpod provider files

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

Full-featured setup for production-grade projects.

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

### CLI Architecture

```
bin/
└── main.dart                     # Entry point & CommandRunner
lib/
├── setup_my_flutter.dart         # Library barrel export
└── src/
    ├── commands/                  # CLI commands
    │   ├── create_command.dart    # `smf create`
    │   ├── generate_command.dart  # `smf generate` (parent)
    │   ├── generate_feature_command.dart  # `smf generate feature`
    │   └── presets.dart           # Package preset definitions
    ├── core/                      # Infrastructure
    │   ├── cli_exception.dart     # User-friendly error handling
    │   ├── rollback.dart          # Cleanup on failure
    │   └── shell_runner.dart      # Process.run wrapper
    ├── templates/                 # Mason bricks
    │   └── bricks/
    │       ├── project_structure/ # Full project template
    │       └── feature/           # Individual feature template
    └── utils/                     # Helpers
        ├── file_manager.dart      # File system operations
        └── string_utils.dart      # Validation & casing
```

### Design Principles

1. **Rollback Safety** — Every created directory is tracked. If the process fails, everything is automatically cleaned up to prevent dirty state.

2. **No Raw pubspec.yaml Edits** — Dependencies are always added via `flutter pub add`, never through string manipulation.

3. **User-Friendly Errors** — All exceptions are wrapped in `CliException` with clear messages and mitigation steps. No raw stack traces are shown to the user.

4. **Idempotency** — `generate feature` will not overwrite an existing folder unless the `--force` flag is explicitly provided.

5. **Validation First** — Project and feature names are validated before any subprocess is executed.

---

## 🛠 Development

### Commands

```bash
# Install dependencies
dart pub get

# Run CLI locally
dart run bin/main.dart <command> [arguments]

# Analyze code
dart analyze

# Format code
dart format .

# Run tests
dart test

# Compile to executable
dart compile exe bin/main.dart -o build/smf
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

### Adding a New Command

1. Create a new file in `lib/src/commands/`
2. Extend `Command<int>` from the `args` package
3. Register it in `bin/main.dart` via `runner.addCommand()`
4. Export it in `lib/src/commands/commands.dart`

### Adding a New Brick Template

1. Create a new directory at `lib/src/templates/bricks/<brick_name>/`
2. Add a `brick.yaml` with required variables
3. Create template files in `__brick__/` using Mustache syntax
4. Load the brick in your command using `MasonGenerator.fromBrick(Brick.path(...))`

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

MIT License — See [LICENSE](LICENSE) for details.
