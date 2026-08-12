import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:setup_my_flutter/src/commands/create_command.dart';
import 'package:setup_my_flutter/src/commands/generate_command.dart';
import 'package:setup_my_flutter/src/core/cli_exception.dart';

Future<void> main(List<String> arguments) async {
  final logger = Logger();

  final runner = CommandRunner<int>(
    'smf',
    '🚀 Setup My Flutter — Scaffold Flutter projects with Feature-First architecture.',
  )
    ..addCommand(CreateCommand(logger: logger))
    ..addCommand(GenerateCommand(logger: logger));

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
