/// Application settings state and provider.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Immutable snapshot of user-configurable app settings.
class AppSettings {
  const AppSettings({
    this.locale = const Locale('en'),
    this.themeMode = ThemeMode.system,
  });

  final Locale locale;
  final ThemeMode themeMode;

  AppSettings copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) =>
      AppSettings(
        locale: locale ?? this.locale,
        themeMode: themeMode ?? this.themeMode,
      );
}

/// Notifier that exposes [AppSettings] and allows updating them.
class SettingsNotifier extends Notifier<AppSettings> {
  @override
  AppSettings build() =>
      // TODO(phase9): load persisted settings from SettingsDao.
      const AppSettings();

  /// Update the app locale.
  void setLocale(Locale locale) => state = state.copyWith(locale: locale);

  /// Update the theme mode.
  void setThemeMode(ThemeMode mode) =>
      state = state.copyWith(themeMode: mode);
}

/// Provider for [AppSettings].
final settingsProvider =
    NotifierProvider<SettingsNotifier, AppSettings>(SettingsNotifier.new);
