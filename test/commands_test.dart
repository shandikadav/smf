import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason/mason.dart' hide Logger;
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;
import 'package:setup_my_flutter/setup_my_flutter.dart';
import 'package:setup_my_flutter/src/templates/bundles/feature_bundle.dart';
import 'package:setup_my_flutter/src/templates/bundles/project_structure_bundle.dart';
import 'package:test/test.dart';

class TestLogger extends Logger {
  TestLogger({this.stateManagement = StateManagement.bloc})
    : super(level: Level.quiet);

  final StateManagement stateManagement;

  @override
  String prompt(String? message, {Object? defaultValue, bool hidden = false}) =>
      'demo_app';

  @override
  T chooseOne<T extends Object?>(
    String? message, {
    required List<T> choices,
    T? defaultValue,
    String Function(T choice)? display,
  }) =>
      (message!.contains('state management') ? stateManagement : Preset.mvp)
          as T;

  @override
  bool confirm(String? message, {bool defaultValue = false}) =>
      !message!.contains('Firebase');
}

class ShellCall {
  const ShellCall(this.executable, this.arguments, this.workingDirectory);

  final String executable;
  final List<String> arguments;
  final String? workingDirectory;
}

class TestShellRunner extends ShellRunner {
  TestShellRunner({this.onRun}) : super(logger: Logger(level: Level.quiet));

  final void Function(ShellCall)? onRun;
  final List<ShellCall> calls = [];

  @override
  Future<ShellResult> run(
    String executable,
    List<String> arguments, {
    String? workingDirectory,
    bool throwOnError = true,
    String? description,
  }) async {
    final call = ShellCall(executable, arguments, workingDirectory);
    calls.add(call);
    onRun?.call(call);
    return const ShellResult(exitCode: 0, stdout: '', stderr: '');
  }
}

void main() {
  late Directory repository;
  late Directory sandbox;

  setUpAll(() => repository = Directory.current);
  setUp(() {
    sandbox = Directory.systemTemp.createTempSync('smf-test-');
    Directory.current = sandbox;
  });
  tearDown(() {
    Directory.current = repository;
    sandbox.deleteSync(recursive: true);
  });

  Future<int?> generate(List<String> args) {
    final runner = CommandRunner<int>('smf', 'test')
      ..addCommand(GenerateFeatureCommand(logger: Logger(level: Level.quiet)));
    return runner.run(['feature', ...args]);
  }

  void pubspec(String dependencies) {
    File('pubspec.yaml').writeAsStringSync('name: demo_app\n$dependencies\n');
  }

  group('Create safety', () {
    for (final kind in ['directory', 'file', 'symlink']) {
      test('rejects existing $kind without touching it', () async {
        final destination = p.join(sandbox.path, 'demo_app');
        if (kind == 'directory') {
          Directory(destination).createSync();
          File(p.join(destination, 'work.txt')).writeAsStringSync('user work');
        } else if (kind == 'file') {
          File(destination).writeAsStringSync('user work');
        } else {
          Link(destination).createSync(p.join(sandbox.path, 'missing_target'));
        }
        final shell = TestShellRunner();
        final command = CreateCommand(logger: TestLogger(), shellRunner: shell);

        await expectLater(command.run(), throwsA(isA<CliException>()));

        expect(shell.calls, isEmpty);
        expect(
          FileSystemEntity.typeSync(destination, followLinks: false),
          isNot(FileSystemEntityType.notFound),
        );
        if (kind == 'directory') {
          expect(
            File(p.join(destination, 'work.txt')).readAsStringSync(),
            'user work',
          );
        } else if (kind == 'file') {
          expect(File(destination).readAsStringSync(), 'user work');
        }
      });
    }

    test('codegen failure rolls back only the temporary project', () async {
      File('unrelated.txt').writeAsStringSync('keep me');
      final shell = TestShellRunner(
        onRun: (call) {
          if (call.executable == 'dart' &&
              call.arguments.contains('build_runner')) {
            throw const CliException(message: 'Injected codegen failure');
          }
        },
      );

      await expectLater(
        CreateCommand(logger: TestLogger(), shellRunner: shell).run(),
        throwsA(isA<CliException>()),
      );

      expect(File('unrelated.txt').readAsStringSync(), 'keep me');
      expect(Directory('demo_app').existsSync(), isFalse);
      expect(sandbox.listSync().map((e) => p.basename(e.path)), [
        'unrelated.txt',
      ]);
    });

    test(
      'preserves a destination created while the scaffold is running',
      () async {
        final shell = TestShellRunner(
          onRun: (call) {
            if (call.executable == 'dart' &&
                call.arguments.contains('build_runner')) {
              Directory('demo_app').createSync();
              File(
                'demo_app/work.txt',
              ).writeAsStringSync('concurrent user work');
            }
          },
        );

        await expectLater(
          CreateCommand(logger: TestLogger(), shellRunner: shell).run(),
          throwsA(isA<CliException>()),
        );

        expect(
          File('demo_app/work.txt').readAsStringSync(),
          'concurrent user work',
        );
        expect(sandbox.listSync().map((e) => p.basename(e.path)), ['demo_app']);
      },
    );

    test(
      'publishes the scaffold after codegen and replaces the widget test',
      () async {
        final shell = TestShellRunner(
          onRun: (call) {
            if (call.arguments.first == 'create') {
              final stage = call.arguments.last;
              Directory(p.join(stage, 'test')).createSync();
              File(
                p.join(stage, 'test', 'widget_test.dart'),
              ).writeAsStringSync('MyApp');
            }
            if (call.executable == 'dart' &&
                call.arguments.contains('build_runner')) {
              expect(Directory('demo_app').existsSync(), isFalse);
              expect(
                File(p.join(call.workingDirectory!, '.env')).existsSync(),
                isTrue,
              );
            }
          },
        );

        expect(
          await CreateCommand(logger: TestLogger(), shellRunner: shell).run(),
          0,
        );

        final test = File('demo_app/test/widget_test.dart').readAsStringSync();
        expect(test, contains('const App()'));
        expect(test, contains('Status: success'));
        expect(test, isNot(contains('MyApp')));
        expect(File('demo_app/.env.example').existsSync(), isTrue);
        expect(
          File('demo_app/.gitignore').readAsStringSync(),
          contains('!.env.example'),
        );
        expect(
          Directory(
            'demo_app/lib/features/home/presentation/providers',
          ).existsSync(),
          isFalse,
        );
        expect(File('demo_app/lib/main_dev.dart').existsSync(), isFalse);
        expect(shell.calls.last.arguments, ['format', 'lib', 'test']);
        expect(sandbox.listSync().map((e) => p.basename(e.path)), ['demo_app']);
      },
    );
  });

  group('Feature dependency detection', () {
    test('ignores comments and dev dependencies', () async {
      pubspec('''
# flutter_bloc and flutter_riverpod may be added later.
dependencies: {}
dev_dependencies:
  flutter_bloc: any
  flutter_riverpod: any''');

      expect(await generate(['auth']), 0);

      final page = File(
        'lib/features/auth/presentation/pages/auth_page.dart',
      ).readAsStringSync();
      expect(page, contains('extends StatelessWidget'));
      expect(page, isNot(contains('BlocProvider')));
      expect(
        Directory('lib/features/auth/presentation/bloc').existsSync(),
        isFalse,
      );
      expect(
        Directory('lib/features/auth/presentation/providers').existsSync(),
        isFalse,
      );
    });

    for (final version in ['^2.6.1', '^3.0.0']) {
      test('wires a manual notifier for Riverpod $version', () async {
        pubspec('dependencies:\n  flutter_riverpod: $version');

        expect(await generate(['auth']), 0);

        final provider = File(
          'lib/features/auth/presentation/providers/auth_provider.dart',
        ).readAsStringSync();
        final page = File(
          'lib/features/auth/presentation/pages/auth_page.dart',
        ).readAsStringSync();
        expect(provider, contains('extends Notifier<AuthState>'));
        expect(provider, contains('NotifierProvider<AuthNotifier, AuthState>'));
        expect(provider, isNot(contains('StateNotifier')));
        expect(page, contains('extends ConsumerWidget'));
        expect(page, contains('ref.watch(authProvider)'));
        expect(
          Directory('lib/features/auth/presentation/bloc').existsSync(),
          isFalse,
        );
      });
    }

    test('requires an explicit choice if both packages are installed', () async {
      pubspec(
        'dependencies:\n  flutter_bloc: any\n  flutter_riverpod: any\n  equatable: any',
      );

      await expectLater(generate(['auth']), throwsA(isA<CliException>()));
      expect(Directory('lib/features').existsSync(), isFalse);

      expect(await generate(['auth', '--state-management', 'riverpod']), 0);
      expect(
        File(
          'lib/features/auth/presentation/providers/auth_provider.dart',
        ).existsSync(),
        isTrue,
      );
      expect(
        Directory('lib/features/auth/presentation/bloc').existsSync(),
        isFalse,
      );
    });

    test(
      'does not create a broken BLoC feature when equatable is missing',
      () async {
        pubspec('dependencies:\n  flutter_bloc: any');

        await expectLater(generate(['auth']), throwsA(isA<CliException>()));
        expect(Directory('lib/features').existsSync(), isFalse);
      },
    );

    test(
      'wires BLoC and preserves an existing feature without force',
      () async {
        pubspec('dependencies:\n  flutter_bloc: any\n  equatable: any');
        expect(await generate(['auth']), 0);
        final page = File(
          'lib/features/auth/presentation/pages/auth_page.dart',
        );
        expect(
          page.readAsStringSync(),
          contains('BlocBuilder<AuthBloc, AuthState>'),
        );
        page.writeAsStringSync('user page');

        await expectLater(generate(['auth']), throwsA(isA<CliException>()));
        expect(page.readAsStringSync(), 'user page');

        expect(await generate(['auth', '--force']), 0);
        expect(
          page.readAsStringSync(),
          contains('BlocBuilder<AuthBloc, AuthState>'),
        );
      },
    );

    test('reports malformed YAML before writing files', () async {
      pubspec('dependencies: [');
      await expectLater(generate(['auth']), throwsA(isA<CliException>()));
      expect(Directory('lib/features').existsSync(), isFalse);
    });

    test('rejects a selected package that is not installed', () async {
      pubspec('dependencies:\n  flutter_riverpod: any');
      await expectLater(
        generate(['auth', '--state-management', 'bloc']),
        throwsA(isA<CliException>()),
      );
      expect(Directory('lib/features').existsSync(), isFalse);
    });
  });

  test('empty template cleanup does not follow symbolic links', () {
    final feature = Directory('feature')..createSync();
    final outside = Directory('outside')..createSync();
    final outsideFile = File(p.join(outside.path, 'keep.dart'))
      ..writeAsStringSync('');
    Link(p.join(feature.path, 'linked')).createSync(outside.absolute.path);

    FileManager.removeEmptyDartTemplates(feature);

    expect(outsideFile.existsSync(), isTrue);
    expect(Link(p.join(feature.path, 'linked')).existsSync(), isTrue);
  });

  test('distributed bundles match their source bricks', () {
    for (final entry in {
      'feature': featureBundle,
      'project_structure': projectStructureBundle,
    }.entries) {
      final source = createBundle(
        Directory(
          p.join(
            repository.path,
            'lib',
            'src',
            'templates',
            'bricks',
            entry.key,
          ),
        ),
      );
      final bundledFiles = {
        for (final file in entry.value.files) file.path: file.data,
      };
      final sourceFiles = {
        for (final file in source.files) file.path: file.data,
      };
      expect(bundledFiles, sourceFiles, reason: '${entry.key} bundle is stale');
    }
  });
}
