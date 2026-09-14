/// Repository interface and implementation for user personal events.
library;

import 'package:drift/drift.dart';

import '../../../database/app_database.dart';
import '../../../database/daos/events_dao.dart';
import '../domain/event_reminder.dart';
import '../domain/personal_event.dart';
import '../domain/recurrence.dart';

abstract interface class EventRepository {
  /// Stream of all active personal events ordered by start date.
  Stream<List<PersonalEvent>> watchAllEvents();

  /// Fetches all active personal events.
  Future<List<PersonalEvent>> getAllActiveEvents();

  /// Gets a single event by ID, or null if not found.
  Future<PersonalEvent?> getEventById(String id);

  /// Creates or updates a personal event.
  Future<void> saveEvent(PersonalEvent event);

  /// Soft-deletes a personal event.
  Future<void> deleteEvent(String id);

  /// Inserts or updates a reminder for an event.
  Future<void> saveReminder(EventReminder reminder);

  /// Deletes a reminder by ID.
  Future<void> deleteReminder(String id);

  /// Stream of reminders for an event.
  Stream<List<EventReminder>> watchRemindersForEvent(String eventId);
}

class EventRepositoryImpl implements EventRepository {
  const EventRepositoryImpl(this._dao);

  final EventsDao _dao;

  @override
  Stream<List<PersonalEvent>> watchAllEvents() =>
      _dao.watchAllEvents().map((rows) => rows.map(_mapRowToEvent).toList());

  @override
  Future<List<PersonalEvent>> getAllActiveEvents() async {
    final rows = await _dao.getEventsFrom('');
    return rows.map(_mapRowToEvent).toList();
  }

  @override
  Future<PersonalEvent?> getEventById(String id) async {
    final all = await getAllActiveEvents();
    try {
      return all.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveEvent(PersonalEvent event) async {
    final companion = EventsTableCompanion(
      id: Value(event.id),
      title: Value(event.title),
      description: Value(event.description),
      eventType: const Value('PERSONAL'),
      calendarType: Value(event.calendarType.toDbString()),
      startDate: Value(event.startDate.toIso8601String()),
      endDate: Value(event.endDate?.toIso8601String()),
      recurrenceJson: Value(
        event.recurrence.isRecurring ? event.recurrence.toJsonString() : null,
      ),
      isActive: Value(event.isActive),
      createdAt: Value(event.createdAt.millisecondsSinceEpoch),
      updatedAt: Value(event.updatedAt.millisecondsSinceEpoch),
    );

    await _dao.upsertEvent(companion);

    // Save reminder if specified
    if (event.reminderMinutes != null) {
      final reminderCompanion = EventRemindersTableCompanion(
        id: Value('${event.id}_rem'),
        eventId: Value(event.id),
        minutesBefore: Value(event.reminderMinutes!),
        notificationId: Value(event.id.hashCode.abs() % 1000000),
        isEnabled: const Value(true),
      );
      await _dao.upsertReminder(reminderCompanion);
    }
  }

  @override
  Future<void> deleteEvent(String id) => _dao.deleteEvent(id);

  @override
  Future<void> saveReminder(EventReminder reminder) async {
    final companion = EventRemindersTableCompanion(
      id: Value(reminder.id),
      eventId: Value(reminder.eventId),
      minutesBefore: Value(reminder.minutesBefore),
      notificationId: Value(reminder.notificationId),
      isEnabled: Value(reminder.isEnabled),
    );
    await _dao.upsertReminder(companion);
  }

  @override
  Future<void> deleteReminder(String id) => _dao.deleteReminder(id);

  @override
  Stream<List<EventReminder>> watchRemindersForEvent(String eventId) =>
      _dao.watchRemindersForEvent(eventId).map(
            (rows) => rows
                .map(
                  (r) => EventReminder(
                    id: r.id,
                    eventId: r.eventId,
                    minutesBefore: r.minutesBefore,
                    notificationId: r.notificationId,
                    isEnabled: r.isEnabled,
                  ),
                )
                .toList(),
          );

  PersonalEvent _mapRowToEvent(EventsTableData row) {
    DateTime parsedStart;
    try {
      parsedStart = DateTime.parse(row.startDate);
    } catch (_) {
      parsedStart = DateTime.fromMillisecondsSinceEpoch(row.createdAt);
    }

    DateTime? parsedEnd;
    if (row.endDate != null) {
      try {
        parsedEnd = DateTime.parse(row.endDate!);
      } catch (_) {
        parsedEnd = null;
      }
    }

    return PersonalEvent(
      id: row.id,
      title: row.title,
      startDate: parsedStart,
      createdAt: DateTime.fromMillisecondsSinceEpoch(row.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(row.updatedAt),
      description: row.description,
      calendarType: EventCalendarType.fromString(row.calendarType),
      endDate: parsedEnd,
      recurrence: EventRecurrence.fromJsonString(row.recurrenceJson),
      isActive: row.isActive,
    );
  }
}
