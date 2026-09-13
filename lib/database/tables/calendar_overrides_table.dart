import 'package:drift/drift.dart';

/// Stores official Hijri date overrides (for future API-sourced data).
///
/// Allows replacing a calculated Hijri date with an officially confirmed date
/// without modifying the calendar engine.
class CalendarOverridesTable extends Table {
  @override
  String get tableName => 'calendar_overrides';

  IntColumn get id => integer().autoIncrement()();

  /// Gregorian date being overridden (YYYY-MM-DD).
  TextColumn get gregorianDate => text()();

  /// Override Hijri year.
  IntColumn get hijriYear => integer()();

  /// Override Hijri month (1–12).
  IntColumn get hijriMonth => integer()();

  /// Override Hijri day (1–30).
  IntColumn get hijriDay => integer()();

  /// Source: OFFICIAL | REGIONAL | OBSERVED
  TextColumn get source => text().withDefault(const Constant('OFFICIAL'))();

  /// Optional ISO 3166-1 alpha-2 region code.
  TextColumn get region => text().nullable()();

  /// When this override was received/stored (Unix ms).
  IntColumn get createdAt => integer()();
}
