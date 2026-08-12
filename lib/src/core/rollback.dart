import 'dart:io';

import 'package:mason_logger/mason_logger.dart';

class Rollback {
  Rollback({required this.logger});

  final Logger logger;
  final List<Directory> _trackedDirectories = [];

  void track(Directory directory) {
    _trackedDirectories.add(directory);
  }

  Future<void> execute() async {
    if (_trackedDirectories.isEmpty) return;

    final progress = logger.progress('Rolling back changes');

    for (final dir in _trackedDirectories.reversed) {
      if (dir.existsSync()) {
        try {
          dir.deleteSync(recursive: true);
        } catch (e) {
          logger.err('  Failed to delete: ${dir.path}');
        }
      }
    }

    progress.complete('Rollback complete');
    _trackedDirectories.clear();
  }

  void clear() {
    _trackedDirectories.clear();
  }
}
