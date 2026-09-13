import 'package:drift/drift.dart';

/// Stores per-user app-level settings (language, theme).
class UserSettingsTable extends Table {
  @override
  String get tableName => 'user_settings';

  IntColumn get id => integer().autoIncrement()();

  /// BCP 47 language code: 'en' | 'ar'
  TextColumn get languageCode =>
      text().withDefault(const Constant('en'))();

  /// Theme mode: 'system' | 'light' | 'dark'
  TextColumn get themeMode =>
      text().withDefault(const Constant('system'))();
}
