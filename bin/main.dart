import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:setup_my_flutter/src/commands/create_command.dart';
import 'package:setup_my_flutter/src/commands/generate_command.dart';
import 'package:setup_my_flutter/src/commands/version_command.dart';
import 'package:setup_my_flutter/src/core/cli_exception.dart';

Future<void> main(List<String> arguments) async {
  final logger = Logger();

  final runner = CommandRunner<int>(
    'smf',
    '🚀 Setup My Flutter — Scaffold Flutter projects with Feature-First architecture.',
  )
    ..argParser.addFlag(
      'version',
      abbr: 'v',
      negatable: false,
      help: 'Print the current SMF version.',
    )
    ..addCommand(CreateCommand(logger: logger))
    ..addCommand(GenerateCommand(logger: logger))
    ..addCommand(VersionCommand(logger: logger));

  // Handle global --version / -v flag before delegating to CommandRunner.
  if (arguments.contains('--version') || arguments.contains('-v')) {
    logger.info('smf version $smfVersion');
    exit(0);
  }

  try {
    final exitCode = await runner.run(arguments);
    exit(exitCode ?? 0);
  } on CliException catch (e) {
    logger.err(e.toString());
    exit(1);
  } on UsageException catch (e) {
    logger.err(e.toString());
    exit(64);
  } catch (e) {
    logger.err('[✗] An unexpected error occurred.');
    logger.detail(e.toString());
    exit(1);
  }
}
