import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = _buildThemeFromColorScheme(
    ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF5722),
    ),
  );

  static final darkTheme = _buildThemeFromColorScheme(
    ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF5722),
      brightness: Brightness.dark,
    ),
  );

  static ThemeData _buildThemeFromColorScheme(ColorScheme colorScheme) {
    return ThemeData.from(
      colorScheme: colorScheme,
    ).copyWith(
      cardTheme: CardTheme(
        elevation: 8,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
