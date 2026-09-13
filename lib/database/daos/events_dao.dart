import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/event_reminders_table.dart';
import '../tables/events_table.dart';

part 'events_dao.g.dart';

/// Data Access Object for events and their reminders.
@DriftAccessor(tables: [EventsTable, EventRemindersTable])
class EventsDao extends DatabaseAccessor<AppDatabase>
    with _$EventsDaoMixin {
  EventsDao(super.db);

  // ── Events ──────────────────────────────────────────────────────────────

  /// Watch all active events ordered by start date.
  Stream<List<EventsTableData>> watchAllEvents() =>
      (select(eventsTable)
            ..where((e) => e.isActive.equals(true))
            ..orderBy([(e) => OrderingTerm.asc(e.startDate)]))
          .watch();

  /// Fetch events starting on or after [fromDate] (YYYY-MM-DD).
  Future<List<EventsTableData>> getEventsFrom(String fromDate) =>
      (select(eventsTable)
            ..where(
              (e) =>
                  e.isActive.equals(true) &
                  e.startDate.isBiggerOrEqualValue(fromDate),
            )
            ..orderBy([(e) => OrderingTerm.asc(e.startDate)]))
          .get();

  /// Insert or replace an event.
  Future<void> upsertEvent(EventsTableCompanion event) =>
      into(eventsTable).insertOnConflictUpdate(event);

  /// Soft-delete an event.
  Future<void> deleteEvent(String id) =>
      (update(eventsTable)..where((e) => e.id.equals(id))).write(
        EventsTableCompanion(
          isActive: const Value(false),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );

  // ── Reminders ────────────────────────────────────────────────────────────

  /// Watch reminders for a specific event.
  Stream<List<EventRemindersTableData>> watchRemindersForEvent(
    String eventId,
  ) =>
      (select(eventRemindersTable)
            ..where((r) => r.eventId.equals(eventId)))
          .watch();

  /// Insert or replace a reminder.
  Future<void> upsertReminder(
    EventRemindersTableCompanion reminder,
  ) =>
      into(eventRemindersTable).insertOnConflictUpdate(reminder);

  /// Delete a reminder by ID.
  Future<int> deleteReminder(String id) =>
      (delete(eventRemindersTable)..where((r) => r.id.equals(id))).go();
}
