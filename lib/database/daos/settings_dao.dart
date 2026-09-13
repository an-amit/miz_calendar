import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/calendar_settings_table.dart';
import '../tables/locations_table.dart';
import '../tables/notification_settings_table.dart';
import '../tables/prayer_settings_table.dart';
import '../tables/user_settings_table.dart';

part 'settings_dao.g.dart';

/// Data Access Object for all settings tables.
@DriftAccessor(tables: [
  UserSettingsTable,
  CalendarSettingsTable,
  PrayerSettingsTable,
  NotificationSettingsTable,
  LocationsTable,
])
class SettingsDao extends DatabaseAccessor<AppDatabase>
    with _$SettingsDaoMixin {
  SettingsDao(super.db);

  // ── User Settings ────────────────────────────────────────────────────────

  Stream<UserSettingsTableData?> watchUserSettings() =>
      (select(userSettingsTable)..where((s) => s.id.equals(1)))
          .watchSingleOrNull();

  Future<void> updateUserSettings(UserSettingsTableCompanion data) =>
      (update(userSettingsTable)..where((s) => s.id.equals(1))).write(data);

  // ── Calendar Settings ────────────────────────────────────────────────────

  Stream<CalendarSettingsTableData?> watchCalendarSettings() =>
      (select(calendarSettingsTable)..where((s) => s.id.equals(1)))
          .watchSingleOrNull();

  Future<void> updateCalendarSettings(
    CalendarSettingsTableCompanion data,
  ) =>
      (update(calendarSettingsTable)..where((s) => s.id.equals(1)))
          .write(data);

  // ── Prayer Settings ──────────────────────────────────────────────────────

  Stream<PrayerSettingsTableData?> watchPrayerSettings() =>
      (select(prayerSettingsTable)..where((s) => s.id.equals(1)))
          .watchSingleOrNull();

  Future<void> updatePrayerSettings(PrayerSettingsTableCompanion data) =>
      (update(prayerSettingsTable)..where((s) => s.id.equals(1))).write(data);

  // ── Notification Settings ────────────────────────────────────────────────

  Stream<NotificationSettingsTableData?> watchNotificationSettings() =>
      (select(notificationSettingsTable)..where((s) => s.id.equals(1)))
          .watchSingleOrNull();

  Future<void> updateNotificationSettings(
    NotificationSettingsTableCompanion data,
  ) =>
      (update(notificationSettingsTable)..where((s) => s.id.equals(1)))
          .write(data);

  // ── Location ─────────────────────────────────────────────────────────────

  Stream<LocationsTableData?> watchCurrentLocation() =>
      (select(locationsTable)
            ..orderBy([(l) => OrderingTerm.desc(l.updatedAt)])
            ..limit(1))
          .watchSingleOrNull();

  Future<void> upsertLocation(LocationsTableCompanion location) =>
      into(locationsTable).insertOnConflictUpdate(location);
}
