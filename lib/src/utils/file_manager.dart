import 'dart:io';

class FileManager {
  static bool directoryExists(String path) {
    return Directory(path).existsSync();
  }

  static Directory ensureDirectory(String path) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    return dir;
  }

  static void deleteDirectory(String path) {
    final dir = Directory(path);
    if (dir.existsSync()) {
      dir.deleteSync(recursive: true);
    }
  }

  static bool fileExists(String path) {
    return File(path).existsSync();
  }

  static File writeFile(String path, String content) {
    final file = File(path);
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(content);
    return file;
  }

  /// Removes empty Dart files left by disabled template sections.
  static void removeEmptyDartTemplates(Directory directory) {
    if (!directory.existsSync()) return;
    for (final entity in directory.listSync(followLinks: false)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        if (entity.readAsStringSync().trim().isEmpty) entity.deleteSync();
      } else if (entity is Directory) {
        removeEmptyDartTemplates(entity);
        if (entity.listSync().isEmpty) entity.deleteSync();
      }
    }
  }
}
