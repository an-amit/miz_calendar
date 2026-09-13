import 'package:drift/drift.dart';

/// Stores notification preferences.
class NotificationSettingsTable extends Table {
  @override
  String get tableName => 'notification_settings';

  IntColumn get id => integer().autoIncrement()();

  BoolColumn get eventReminders =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get islamicEventReminders =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get dailyReminder =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get prayerReminders =>
      boolean().withDefault(const Constant(false))();

  /// Time for the daily reminder in HH:mm format.
  TextColumn get dailyReminderTime =>
      text().withDefault(const Constant('07:00'))();
}
