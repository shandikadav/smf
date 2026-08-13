bool isValidPackageName(String name) {
  if (name.length < 2) return false;

  final regex = RegExp(r'^[a-z][a-z0-9_]*$');
  if (!regex.hasMatch(name)) return false;

  const reserved = <String>{
    'abstract',
    'as',
    'assert',
    'async',
    'await',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'covariant',
    'default',
    'deferred',
    'do',
    'dynamic',
    'else',
    'enum',
    'export',
    'extends',
    'extension',
    'external',
    'factory',
    'false',
    'final',
    'finally',
    'for',
    'function',
    'get',
    'hide',
    'if',
    'implements',
    'import',
    'in',
    'interface',
    'is',
    'late',
    'library',
    'mixin',
    'new',
    'null',
    'of',
    'on',
    'operator',
    'part',
    'required',
    'rethrow',
    'return',
    'sealed',
    'set',
    'show',
    'static',
    'super',
    'switch',
    'sync',
    'this',
    'throw',
    'true',
    'try',
    'type',
    'typedef',
    'var',
    'void',
    'when',
    'while',
    'with',
    'yield',
    'test',
    'flutter',
  };

  if (reserved.contains(name)) return false;

  return true;
}

extension StringCasing on String {
  String toSnakeCase() {
    return replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) {
        final char = match.group(0)!.toLowerCase();
        return match.start == 0 ? char : '_$char';
      },
    ).replaceAll(RegExp(r'[-\s]+'), '_').toLowerCase();
  }

  String toPascalCase() {
    return split(RegExp(r'[_\-\s]+'))
        .where((s) => s.isNotEmpty)
        .map((s) => s[0].toUpperCase() + s.substring(1).toLowerCase())
        .join();
  }

  String toCamelCase() {
    final pascal = toPascalCase();
    if (pascal.isEmpty) return pascal;
    return pascal[0].toLowerCase() + pascal.substring(1);
  }
}
