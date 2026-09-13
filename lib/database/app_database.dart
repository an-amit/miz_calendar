/// Drift database definition — the single source of truth for SQLite schema.
library;

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'daos/events_dao.dart';
import 'daos/settings_dao.dart';
import 'tables/calendar_overrides_table.dart';
import 'tables/calendar_settings_table.dart';
import 'tables/event_reminders_table.dart';
import 'tables/events_table.dart';
import 'tables/locations_table.dart';
import 'tables/notification_settings_table.dart';
import 'tables/prayer_settings_table.dart';
import 'tables/user_settings_table.dart';

part 'app_database.g.dart';

/// The Drift-managed SQLite database for Mīzān Calendar.
@DriftDatabase(
  tables: [
    EventsTable,
    EventRemindersTable,
    UserSettingsTable,
    CalendarSettingsTable,
    PrayerSettingsTable,
    NotificationSettingsTable,
    LocationsTable,
    CalendarOverridesTable,
  ],
  daos: [
    EventsDao,
    SettingsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'miz_calendar'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedDefaultSettings();
        },
        onUpgrade: (m, from, to) async {
          // Future migrations go here.
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
          await customStatement('PRAGMA journal_mode = WAL');
        },
      );

  Future<void> _seedDefaultSettings() async {
    await into(userSettingsTable).insert(
      UserSettingsTableCompanion.insert(
        languageCode: const Value('en'),
        themeMode: const Value('system'),
      ),
    );
    await into(calendarSettingsTable).insert(
      CalendarSettingsTableCompanion.insert(
        hijriMethod: const Value('UMM_AL_QURA'),
        hijriAdjustment: const Value(0),
        primaryCalendar: const Value('GREGORIAN'),
      ),
    );
    await into(prayerSettingsTable).insert(
      PrayerSettingsTableCompanion.insert(
        calculationMethod: const Value('MWL'),
        asrMethod: const Value('STANDARD'),
        highLatitudeRule: const Value('MIDDLE_OF_NIGHT'),
        enabled: const Value(true),
      ),
    );
    await into(notificationSettingsTable).insert(
      NotificationSettingsTableCompanion.insert(
        eventReminders: const Value(true),
        islamicEventReminders: const Value(true),
        dailyReminder: const Value(false),
        prayerReminders: const Value(false),
        dailyReminderTime: const Value('07:00'),
      ),
    );
  }
}

/// Riverpod provider for the [AppDatabase].
/// Overridden in main.dart with the real instance.
final appDatabaseProvider = Provider<AppDatabase>(
  (_) => throw UnimplementedError('appDatabaseProvider not overridden'),
);
