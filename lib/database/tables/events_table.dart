import 'package:drift/drift.dart';

/// Stores personal events (Gregorian and Hijri recurring).
class EventsTable extends Table {
  @override
  String get tableName => 'events';

  /// UUID primary key.
  TextColumn get id => text()();

  /// Event title.
  TextColumn get title => text().withLength(min: 1, max: 200)();

  /// Optional description.
  TextColumn get description => text().nullable()();

  /// Type: PERSONAL | ISLAMIC
  TextColumn get eventType => text().withDefault(const Constant('PERSONAL'))();

  /// Calendar system: GREGORIAN | HIJRI
  TextColumn get calendarType =>
      text().withDefault(const Constant('GREGORIAN'))();

  /// ISO 8601 date string for the start (YYYY-MM-DD).
  TextColumn get startDate => text()();

  /// ISO 8601 date string for the end (YYYY-MM-DD). Nullable for single-day.
  TextColumn get endDate => text().nullable()();

  /// JSON-encoded recurrence rule. Null if no recurrence.
  TextColumn get recurrenceJson => text().nullable()();

  /// Whether this event is active.
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  /// Creation timestamp (Unix ms).
  IntColumn get createdAt => integer()();

  /// Last update timestamp (Unix ms).
  IntColumn get updatedAt => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
