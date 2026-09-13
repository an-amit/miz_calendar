/// Material 3 theme configuration for Mīzān Calendar.
library;

import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Provides light and dark [ThemeData] for the application.
abstract final class AppTheme {
  AppTheme._();

  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: kColorSeed,
    surface: kColorSurfaceLight,
    error: kColorError,
  );

  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: kColorSeed,
    brightness: Brightness.dark,
    surface: kColorSurfaceDark,
    error: kColorError,
  );

  /// The light theme.
  static ThemeData get light => _buildTheme(_lightColorScheme);

  /// The dark theme.
  static ThemeData get dark => _buildTheme(_darkColorScheme);

  static ThemeData _buildTheme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.surface,

        // AppBar
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 2,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          titleTextStyle: TextStyle(
            color: colorScheme.onSurface,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        // Bottom navigation
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: colorScheme.primaryContainer,
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),

        // Cards
        cardTheme: CardThemeData(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: colorScheme.surfaceContainerLow,
        ),

        // Dialogs
        dialogTheme: DialogThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // FAB
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),

        // Input fields
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: colorScheme.surfaceContainerHighest.withAlpha(128),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      );
}
