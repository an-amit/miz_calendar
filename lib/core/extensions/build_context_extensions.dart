/// Extension methods on [BuildContext].
library;

import 'package:flutter/material.dart';

import '../../localization/generated/app_localizations.dart';

extension BuildContextExtensions on BuildContext {
  /// Shorthand for [AppLocalizations.of].
  AppLocalizations get l10n => AppLocalizations.of(this);

  /// Shorthand for [Theme.of].
  ThemeData get theme => Theme.of(this);

  /// Shorthand for [Theme.of].colorScheme.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Shorthand for [Theme.of].textTheme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Shorthand for [MediaQuery.of].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Screen size.
  Size get screenSize => MediaQuery.of(this).size;

  /// Whether the current locale is RTL.
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;

  /// Dismisses the keyboard if it is shown.
  void dismissKeyboard() => FocusScope.of(this).unfocus();

  /// Shows a [SnackBar].
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
