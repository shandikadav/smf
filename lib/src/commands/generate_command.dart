import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import 'generate_feature_command.dart';

class GenerateCommand extends Command<int> {
  GenerateCommand({required Logger logger}) {
    addSubcommand(GenerateFeatureCommand(logger: logger));
  }

  @override
  String get name => 'generate';

  @override
  String get description => 'Generate project components (features, etc.).';
}
