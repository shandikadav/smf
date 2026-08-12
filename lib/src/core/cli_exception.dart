class CliException implements Exception {
  const CliException({
    required this.message,
    this.mitigation,
  });

  final String message;
  final String? mitigation;

  @override
  String toString() {
    final buffer = StringBuffer('[✗] $message');
    if (mitigation != null) {
      buffer.writeln();
      buffer.write('    → $mitigation');
    }
    return buffer.toString();
  }
}
