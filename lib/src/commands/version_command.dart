import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

const String smfVersion = '2.0.0';

class VersionCommand extends Command<int> {
  VersionCommand({required this.logger});

  final Logger logger;

  @override
  String get name => 'version';

  @override
  List<String> get aliases => ['--version', '-v'];

  @override
  String get description => 'Print the current version of SMF.';

  @override
  Future<int> run() async {
    logger.info('smf version $smfVersion');
    return 0;
  }
}
