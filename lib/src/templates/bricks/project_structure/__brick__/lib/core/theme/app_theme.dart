import 'package:flutter/material.dart';

/// Application theme configuration.
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: Colors.deepPurple,
      useMaterial3: true,
      brightness: Brightness.light,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: Colors.deepPurple,
      useMaterial3: true,
      brightness: Brightness.dark,
    );
  }
}
