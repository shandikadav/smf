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
}
