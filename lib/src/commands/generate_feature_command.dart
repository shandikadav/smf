import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason/mason.dart' hide Logger;
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

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
    argParser.addOption(
      'state-management',
      allowed: ['bloc', 'riverpod'],
      help: 'Select state management when both packages are installed.',
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

    final YamlMap pubspec;
    try {
      final document = loadYaml(pubspecFile.readAsStringSync());
      if (document is! YamlMap) {
        throw const FormatException('Expected a YAML mapping.');
      }
      pubspec = document;
    } on FormatException catch (e) {
      throw CliException(
        message: 'Invalid pubspec.yaml.',
        mitigation: e.toString(),
      );
    }

    final dependencies = pubspec['dependencies'];
    if (dependencies != null && dependencies is! YamlMap) {
      throw const CliException(
        message: 'Invalid dependencies in pubspec.yaml.',
        mitigation: 'The dependencies section must be a YAML mapping.',
      );
    }
    final hasBloc =
        dependencies is YamlMap && dependencies.containsKey('flutter_bloc');
    final hasRiverpod =
        dependencies is YamlMap && dependencies.containsKey('flutter_riverpod');
    final selection = args['state-management'] as String?;

    if (hasBloc && hasRiverpod && selection == null) {
      throw const CliException(
        message: 'Both BLoC and Riverpod are installed.',
        mitigation:
            'Choose --state-management bloc or --state-management riverpod.',
      );
    }
    if ((selection == 'bloc' && !hasBloc) ||
        (selection == 'riverpod' && !hasRiverpod)) {
      throw CliException(
        message: 'The selected state management package is not installed.',
        mitigation:
            'Add ${selection == 'bloc' ? 'flutter_bloc' : 'flutter_riverpod'} '
            'to dependencies in pubspec.yaml first.',
      );
    }
    final useBloc = hasBloc && selection != 'riverpod';
    final useRiverpod = hasRiverpod && selection != 'bloc';

    if (useBloc && !dependencies.containsKey('equatable')) {
      throw const CliException(
        message: 'The BLoC template requires equatable.',
        mitigation:
            'Run flutter pub add equatable, then generate the feature again.',
      );
    }

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

      FileManager.removeEmptyDartTemplates(Directory(featureDir));

      progress.complete('Feature "$featureName" generated');

      logger.info('');
      logger.success('[✓] Feature "$featureName" created at:');
      logger.info('    lib/features/$featureName/');
      logger.info('Add ${featureName.toPascalCase()}Page to your router.');
      if (useRiverpod) {
        logger.info('Ensure ProviderScope wraps your app.');
      }
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
