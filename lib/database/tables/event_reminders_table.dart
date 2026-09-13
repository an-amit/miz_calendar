import 'package:drift/drift.dart';

import '../tables/events_table.dart';

/// Stores reminders linked to personal events.
class EventRemindersTable extends Table {
  @override
  String get tableName => 'event_reminders';

  /// UUID primary key.
  TextColumn get id => text()();

  /// Foreign key to [EventsTable].
  TextColumn get eventId =>
      text().references(EventsTable, #id, onDelete: KeyAction.cascade)();

  /// Minutes before the event to fire the reminder.
  IntColumn get minutesBefore => integer()();

  /// The platform notification ID for this reminder.
  IntColumn get notificationId => integer()();

  /// Whether this reminder is enabled.
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
