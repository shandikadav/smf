import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;
import 'package:setup_my_flutter/setup_my_flutter.dart';

class ScaffoldLogger extends Logger {
  ScaffoldLogger(this.projectName, this.stateManagement, this.preset);

  final String projectName;
  final StateManagement stateManagement;
  final Preset preset;

  @override
  String prompt(String? message, {Object? defaultValue, bool hidden = false}) =>
      projectName;

  @override
  T chooseOne<T extends Object?>(
    String? message, {
    required List<T> choices,
    T? defaultValue,
    String Function(T choice)? display,
  }) => (message!.contains('state management') ? stateManagement : preset) as T;

  @override
  bool confirm(String? message, {bool defaultValue = false}) =>
      !message!.contains('Firebase');
}

class VerificationShell extends ShellRunner {
  VerificationShell({required super.logger, required this.offline});

  final bool offline;

  @override
  Future<ShellResult> run(
    String executable,
    List<String> arguments, {
    String? workingDirectory,
    bool throwOnError = true,
    String? description,
  }) {
    final canRunOffline =
        executable == 'flutter' &&
        (arguments.first == 'create' ||
            (arguments.first == 'pub' && arguments[1] == 'add'));
    return super.run(
      executable,
      [...arguments, if (offline && canRunOffline) '--offline'],
      workingDirectory: workingDirectory,
      throwOnError: throwOnError,
      description: description,
    );
  }
}

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addFlag('offline', negatable: false, help: 'Use cached dependencies.')
    ..addFlag('keep', negatable: false, help: 'Keep the temporary projects.')
    ..addOption(
      'preset',
      allowed: Preset.values.map((preset) => preset.name).toList(),
      help: 'Verify only the selected preset.',
    )
    ..addFlag('help', abbr: 'h', negatable: false);
  final options = parser.parse(arguments);
  if (options['help'] as bool) {
    stdout.writeln(
      'Verify generated projects with Flutter analyzer and widget tests.',
    );
    stdout.writeln(parser.usage);
    return;
  }
  final offline = options['offline'] as bool;
  final selectedPreset = options['preset'] as String?;
  final original = Directory.current;
  final root = Directory.systemTemp.createTempSync('smf-verify-');
  final logger = Logger();
  final shell = VerificationShell(logger: logger, offline: offline);
  final results = <Map<String, Object?>>[];
  var failed = false;

  Future<void> checkProject(String name, Directory project) async {
    final result = <String, Object?>{'case': name};
    for (final command in ['analyze', 'test']) {
      final check = await Process.run('flutter', [
        command,
        '--no-pub',
      ], workingDirectory: project.path);
      File(
        p.join(root.path, '${name}_$command.log'),
      ).writeAsStringSync('${check.stdout}\n${check.stderr}');
      result[command] = check.exitCode;
      logger.info('$name: flutter $command → ${check.exitCode}');
      if (check.exitCode != 0) {
        failed = true;
        logger.err('${check.stdout}\n${check.stderr}');
      }
    }
    results.add(result);
  }

  Future<void> generateFeature() async {
    final runner = CommandRunner<int>('smf', 'Verify generated features')
      ..addCommand(GenerateFeatureCommand(logger: logger));
    await runner.run(['feature', 'user_profile']);
  }

  logger.info('Verification projects: ${root.path}');
  try {
    for (final stateManagement in StateManagement.values) {
      for (final preset in Preset.values) {
        if (selectedPreset != null && preset.name != selectedPreset) continue;
        Directory.current = root;
        final name = 'verify_${stateManagement.name}_${preset.name}';
        try {
          await CreateCommand(
            logger: ScaffoldLogger(name, stateManagement, preset),
            shellRunner: shell,
          ).run();
          final project = Directory(p.join(root.path, name));
          Directory.current = project;
          await generateFeature();
          await checkProject(name, project);
        } catch (e) {
          failed = true;
          logger.err('$name: $e');
          results.add({'case': name, 'error': '$e'});
        }
      }
    }

    final riverpod = Directory(p.join(root.path, 'verify_riverpod_mvp'));
    if (riverpod.existsSync()) {
      Directory.current = riverpod;
      try {
        await shell.run(
          'flutter',
          ['pub', 'add', 'flutter_riverpod:^2.6.1'],
          workingDirectory: riverpod.path,
          description: 'Checking existing Riverpod 2 projects',
        );
        final runner = CommandRunner<int>('smf', 'Verify Riverpod 2 features')
          ..addCommand(GenerateFeatureCommand(logger: logger));
        await runner.run(['feature', 'legacy_account']);
        await checkProject('riverpod_2_compatibility', riverpod);
      } catch (e) {
        failed = true;
        logger.err('Riverpod 2 compatibility: $e');
        results.add({'case': 'riverpod_2_compatibility', 'error': '$e'});
      }
    }
  } finally {
    Directory.current = original;
    File(
      p.join(root.path, 'results.json'),
    ).writeAsStringSync(const JsonEncoder.withIndent('  ').convert(results));
    if (failed || options['keep'] as bool) {
      logger.info('Saved verification logs: ${root.path}');
    } else {
      root.deleteSync(recursive: true);
    }
  }
  exitCode = failed ? 1 : 0;
}
