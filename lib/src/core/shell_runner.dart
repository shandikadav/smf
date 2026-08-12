import 'dart:io';

import 'package:mason_logger/mason_logger.dart';

import 'cli_exception.dart';

class ShellResult {
  const ShellResult({
    required this.exitCode,
    required this.stdout,
    required this.stderr,
  });

  final int exitCode;
  final String stdout;
  final String stderr;

  bool get isSuccess => exitCode == 0;
}

class ShellRunner {
  ShellRunner({required this.logger});

  final Logger logger;

  Future<ShellResult> run(
    String executable,
    List<String> arguments, {
    String? workingDirectory,
    bool throwOnError = true,
    String? description,
  }) async {
    final command = '$executable ${arguments.join(' ')}';
    final desc = description ?? command;

    final progress = logger.progress(desc);

    try {
      final result = await Process.run(
        executable,
        arguments,
        workingDirectory: workingDirectory,
        runInShell: true,
      );

      final shellResult = ShellResult(
        exitCode: result.exitCode,
        stdout: result.stdout.toString().trim(),
        stderr: result.stderr.toString().trim(),
      );

      if (shellResult.isSuccess) {
        progress.complete(desc);
      } else {
        progress.fail(desc);
        if (throwOnError) {
          throw CliException(
            message: 'Command failed: $command',
            mitigation: shellResult.stderr.isNotEmpty
                ? shellResult.stderr
                : 'Check that "$executable" is installed and available in PATH.',
          );
        }
      }

      return shellResult;
    } catch (e) {
      if (e is CliException) rethrow;
      progress.fail(desc);
      throw CliException(
        message: 'Failed to execute: $command',
        mitigation:
            'Ensure "$executable" is installed and available in your PATH.',
      );
    }
  }
}
