import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason/mason.dart' hide Logger;
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;

import '../core/cli_exception.dart';
import '../templates/bundles/feature_bundle.dart';
import '../utils/file_manager.dart';
import '../utils/string_utils.dart';

class GenerateFeatureCommand extends Command<int> {
  GenerateFeatureCommand({required this.logger}) {
    argParser.addFlag(
      'force',
      abbr: 'f',
      help: 'Overwrite existing feature directory if it exists.',
      negatable: false,
    );
  }

  final Logger logger;

  @override
  String get name => 'feature';

  @override
  String get description =>
      'Generate a new feature with Feature-First folder structure.';

  @override
  Future<int> run() async {
    final args = argResults!;
    final force = args['force'] as bool;

    final rest = args.rest;
    String featureName;

    if (rest.isEmpty) {
      featureName = logger.prompt(
        '${lightCyan.wrap('?')} Feature name (snake_case):',
      );
    } else {
      featureName = rest.first;
    }

    if (!isValidPackageName(featureName)) {
      throw const CliException(
        message: 'Invalid feature name.',
        mitigation:
            'Use lowercase letters, numbers, and underscores only (snake_case). '
            'Must start with a letter and be at least 2 characters.',
      );
    }

    final featuresDir = p.join(Directory.current.path, 'lib', 'features');
    final featureDir = p.join(featuresDir, featureName);

    if (FileManager.directoryExists(featureDir) && !force) {
      throw CliException(
        message: 'Feature "$featureName" already exists.',
        mitigation:
            'Use --force flag to overwrite, or choose a different name.',
      );
    }

    final pubspecFile = File(p.join(Directory.current.path, 'pubspec.yaml'));
    if (!pubspecFile.existsSync()) {
      throw const CliException(
        message: 'No pubspec.yaml found in current directory.',
        mitigation: 'Run this command from the root of your Flutter project.',
      );
    }

    final pubspecContent = pubspecFile.readAsStringSync();
    final useBloc = pubspecContent.contains('flutter_bloc');
    final useRiverpod = pubspecContent.contains('flutter_riverpod');

    if (!useBloc && !useRiverpod) {
      logger.warn(
        'No state management detected in pubspec.yaml. '
        'Generating without BLoC or Riverpod files.',
      );
    }

    final progress = logger.progress('Generating feature "$featureName"');

    try {
      final generator = await MasonGenerator.fromBundle(featureBundle);

      final targetDir = Directory(featuresDir);
      FileManager.ensureDirectory(featuresDir);

      final target = DirectoryGeneratorTarget(targetDir);

      await generator.generate(
        target,
        vars: <String, dynamic>{
          'feature_name': featureName,
          'use_bloc': useBloc,
          'use_riverpod': useRiverpod,
        },
        fileConflictResolution: force
            ? FileConflictResolution.overwrite
            : FileConflictResolution.skip,
      );

      progress.complete('Feature "$featureName" generated');

      logger.info('');
      logger.success('[✓] Feature "$featureName" created at:');
      logger.info('    lib/features/$featureName/');
      logger.info('');

      return ExitCode.success.code;
    } catch (e) {
      progress.fail('Failed to generate feature "$featureName"');
      if (e is CliException) rethrow;
      throw CliException(
        message: 'Failed to generate feature "$featureName".',
        mitigation: e.toString(),
      );
    }
  }
}
