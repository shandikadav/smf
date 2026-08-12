import 'dart:convert';
import 'dart:io';
import 'package:mason/mason.dart';

void main() {
  final bricks = {
    'project_structure': 'lib/src/templates/bricks/project_structure',
    'feature': 'lib/src/templates/bricks/feature',
  };

  final outputDir = Directory('lib/src/templates/bundles');
  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  for (final entry in bricks.entries) {
    final name = entry.key;
    final path = entry.value;
    final brickDir = Directory(path);

    if (!brickDir.existsSync()) {
      print('[✗] Brick not found: $path');
      continue;
    }

    final bundle = createBundle(brickDir);
    final json = bundle.toJson();
    final jsonString = const JsonEncoder.withIndent('  ').convert(json);

    final outputFile = File('${outputDir.path}/${name}_bundle.dart');
    outputFile.writeAsStringSync(
      "import 'package:mason/mason.dart';\n"
      '\n'
      'final ${_toCamelCase(name)}Bundle = MasonBundle.fromJson(\n'
      '$jsonString\n'
      ');\n',
    );

    print('[✓] Bundled: $name → ${outputFile.path}');
  }
}

String _toCamelCase(String input) {
  final parts = input.split('_');
  return parts.first +
      parts.skip(1).map((s) => s[0].toUpperCase() + s.substring(1)).join();
}
