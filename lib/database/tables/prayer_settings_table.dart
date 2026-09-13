import 'package:drift/drift.dart';

/// Stores prayer calculation configuration.
class PrayerSettingsTable extends Table {
  @override
  String get tableName => 'prayer_settings';

  IntColumn get id => integer().autoIncrement()();

  /// Calculation method name (e.g. MWL, ISNA, UMM_AL_QURA).
  TextColumn get calculationMethod =>
      text().withDefault(const Constant('MWL'))();

  /// Asr method: STANDARD | HANAFI
  TextColumn get asrMethod =>
      text().withDefault(const Constant('STANDARD'))();

  /// High latitude rule: MIDDLE_OF_NIGHT | ONE_SEVENTH | ANGLE_BASED
  TextColumn get highLatitudeRule =>
      text().withDefault(const Constant('MIDDLE_OF_NIGHT'))();

  /// Whether the prayer feature is enabled.
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
}
