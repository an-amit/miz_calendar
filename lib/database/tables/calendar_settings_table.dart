import 'package:drift/drift.dart';

/// Stores Hijri/Gregorian calendar configuration.
class CalendarSettingsTable extends Table {
  @override
  String get tableName => 'calendar_settings';

  IntColumn get id => integer().autoIncrement()();

  /// Hijri calculation method:
  /// UMM_AL_QURA | TABULAR_CIVIL | TABULAR_ASTRONOMICAL
  TextColumn get hijriMethod =>
      text().withDefault(const Constant('UMM_AL_QURA'))();

  /// User-configured Hijri adjustment: -2 to +2
  IntColumn get hijriAdjustment => integer().withDefault(const Constant(0))();

  /// Primary calendar to display: GREGORIAN | HIJRI | DUAL
  TextColumn get primaryCalendar =>
      text().withDefault(const Constant('GREGORIAN'))();
}
