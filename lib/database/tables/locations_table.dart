import 'package:drift/drift.dart';

/// Stores the user's cached location for prayer time calculations.
class LocationsTable extends Table {
  @override
  String get tableName => 'locations';

  IntColumn get id => integer().autoIncrement()();

  /// WGS-84 latitude.
  RealColumn get latitude => real()();

  /// WGS-84 longitude.
  RealColumn get longitude => real()();

  /// IANA timezone ID (e.g. 'Asia/Kolkata').
  TextColumn get timezone => text()();

  /// Human-readable city name.
  TextColumn get city => text()();

  /// ISO 3166-1 alpha-2 country code.
  TextColumn get country => text()();

  /// Source: GPS | MANUAL
  TextColumn get source => text().withDefault(const Constant('MANUAL'))();

  /// Timestamp of last update (Unix ms).
  IntColumn get updatedAt => integer()();
}
