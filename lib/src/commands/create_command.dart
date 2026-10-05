import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason/mason.dart' hide Logger;
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;

import '../core/cli_exception.dart';
import '../core/rollback.dart';
import '../core/shell_runner.dart';
import '../templates/bundles/feature_bundle.dart';
import '../templates/bundles/project_structure_bundle.dart';
import '../utils/file_manager.dart';
import '../utils/string_utils.dart';
import 'presets.dart';

class CreateCommand extends Command<int> {
  CreateCommand({required this.logger, this.shellRunner});

  final Logger logger;
  final ShellRunner? shellRunner;

  @override
  String get name => 'create';

  @override
  String get description =>
      'Create a new Flutter project with Feature-First architecture.';

  @override
  Future<int> run() async {
    final shell = shellRunner ?? ShellRunner(logger: logger);
    final rollback = Rollback(logger: logger);

    try {
      final projectName = logger.prompt(
        '${lightCyan.wrap('?')} Project name (snake_case):',
      );

      if (!isValidPackageName(projectName)) {
        throw const CliException(
          message: 'Invalid project name.',
          mitigation:
              'Use lowercase letters, numbers, and underscores only (snake_case). '
              'Must start with a letter and be at least 2 characters.',
        );
      }

      final destination = p.join(Directory.current.path, projectName);
      _ensureDestinationAvailable(destination, projectName);

      final stateManagement = logger.chooseOne<StateManagement>(
        'Select state management:',
        choices: StateManagement.values,
        display: (sm) => sm.displayName,
      );

      final preset = logger.chooseOne<Preset>(
        'Select project preset:',
        choices: Preset.values,
        display: (p) => p.displayName,
      );

      final useFirebase = logger.confirm(
        'Include Firebase packages?',
        defaultValue: false,
      );

      logger.info('');
      logger.info('${lightCyan.wrap('📋 Summary:')}');
      logger.info('  Project:    $projectName');
      logger.info('  State Mgmt: ${stateManagement.displayName}');
      logger.info('  Preset:     ${preset.displayName}');
      logger.info('  Firebase:   ${useFirebase ? 'Yes' : 'No'}');
      logger.info('');

      final proceed = logger.confirm(
        'Proceed with creation?',
        defaultValue: true,
      );
      if (!proceed) {
        logger.info('Aborted.');
        return ExitCode.success.code;
      }

      final projectDir = Directory.current.createTempSync(
        '.smf_${projectName}_',
      );
      rollback.track(projectDir);

      await shell.run('flutter', [
        'create',
        '--org',
        'com.example',
        '--project-name',
        projectName,
        projectDir.path,
      ], description: 'Creating Flutter project "$projectName"');

      final packages = getPresetPackages(
        preset: preset,
        stateManagement: stateManagement,
        useFirebase: useFirebase,
      );

      if (packages.isNotEmpty) {
        await shell.run(
          'flutter',
          ['pub', 'add', ...packages],
          workingDirectory: projectDir.path,
          description: 'Adding dependencies',
        );
      }

      final devDeps = getDevDependencies(stateManagement: stateManagement);
      if (devDeps.isNotEmpty) {
        await shell.run(
          'flutter',
          ['pub', 'add', '--dev', ...devDeps],
          workingDirectory: projectDir.path,
          description: 'Adding dev dependencies',
        );
      }

      final generator = await MasonGenerator.fromBundle(projectStructureBundle);

      final targetLib = Directory(p.join(projectDir.path, 'lib'));

      if (targetLib.existsSync()) {
        for (final entity in targetLib.listSync()) {
          entity.deleteSync(recursive: true);
        }
      }

      final vars = <String, dynamic>{
        'project_name': projectName,
        'use_bloc': stateManagement == StateManagement.bloc,
        'use_riverpod': stateManagement == StateManagement.riverpod,
        'use_firebase': useFirebase,
        'is_preset_enterprise': preset == Preset.enterprise,
      };

      final target = DirectoryGeneratorTarget(
        Directory(p.join(projectDir.path)),
      );

      await generator.generate(
        target,
        vars: vars,
        fileConflictResolution: FileConflictResolution.overwrite,
      );

      final featureGenerator = await MasonGenerator.fromBundle(featureBundle);

      final featuresDir = Directory(p.join(projectDir.path, 'lib', 'features'));

      final featureTarget = DirectoryGeneratorTarget(featuresDir);

      await featureGenerator.generate(
        featureTarget,
        vars: <String, dynamic>{
          'feature_name': 'home',
          'use_bloc': stateManagement == StateManagement.bloc,
          'use_riverpod': stateManagement == StateManagement.riverpod,
        },
        fileConflictResolution: FileConflictResolution.overwrite,
      );

      FileManager.removeEmptyDartTemplates(targetLib);

      final envFile = File(p.join(projectDir.path, '.env'));
      if (preset == Preset.enterprise) {
        envFile.writeAsStringSync(
          'BASE_URL=https://api.example.com\nAPI_KEY=your_api_key_here\n',
        );
      } else {
        envFile.writeAsStringSync('BASE_URL=https://api.example.com\n');
      }

      envFile.copySync(p.join(projectDir.path, '.env.example'));
      final gitignore = File(p.join(projectDir.path, '.gitignore'));
      final existingIgnore = gitignore.existsSync()
          ? gitignore.readAsStringSync()
          : '';
      gitignore.writeAsStringSync(
        '$existingIgnore\n'
        '# Environment configuration and generated values\n'
        '.env\n'
        '.env.*\n'
        '!.env.example\n'
        '**/*.g.dart\n',
      );

      await shell.run(
        'dart',
        ['run', 'build_runner', 'build'],
        workingDirectory: projectDir.path,
        description: 'Generating environment configuration',
      );

      await shell.run(
        'dart',
        ['format', 'lib', 'test'],
        workingDirectory: projectDir.path,
        description: 'Formatting generated code',
      );

      _ensureDestinationAvailable(destination, projectName);
      projectDir.renameSync(destination);

      rollback.clear();
      logger.info('');
      logger.success('[✓] Project "$projectName" created successfully!');
      logger.info('');
      logger.info('Next steps:');
      logger.info('  cd $projectName');
      logger.info('  flutter run');
      logger.info('');

      return ExitCode.success.code;
    } on CliException {
      await rollback.execute();
      rethrow;
    } catch (e) {
      await rollback.execute();
      throw CliException(
        message: 'An unexpected error occurred during project creation.',
        mitigation: e.toString(),
      );
    }
  }

  void _ensureDestinationAvailable(String path, String projectName) {
    if (FileSystemEntity.typeSync(path, followLinks: false) !=
        FileSystemEntityType.notFound) {
      throw CliException(
        message: 'Project destination "$projectName" already exists.',
        mitigation: 'Choose a different name or move the existing path first.',
      );
    }
  }
}
