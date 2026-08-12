import 'package:mason_logger/mason_logger.dart';
import 'package:setup_my_flutter/src/commands/create_command.dart';

Future<void> main(List<String> arguments) async {
  final logger = Logger();
  final command = CreateCommand(logger: logger);
  await command.run();
}
