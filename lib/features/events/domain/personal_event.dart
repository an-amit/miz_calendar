/// Domain entity representing a user personal event.
library;

import 'package:meta/meta.dart';

import 'recurrence.dart';

/// The calendar system in which the event was scheduled.
enum EventCalendarType {
  gregorian,
  hijri;

  static EventCalendarType fromString(String? value) =>
      value?.toUpperCase() == 'HIJRI'
          ? EventCalendarType.hijri
          : EventCalendarType.gregorian;

  String toDbString() => name.toUpperCase();
}

/// A personal event created by the user.
@immutable
class PersonalEvent {
  const PersonalEvent({
    required this.id,
    required this.title,
    required this.startDate,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.calendarType = EventCalendarType.gregorian,
    this.endDate,
    this.isAllDay = true,
    this.recurrence = const EventRecurrence(),
    this.reminderMinutes,
    this.colorValue,
    this.isActive = true,
  });

  /// Unique UUID primary key.
  final String id;

  /// Event title.
  final String title;

  /// Optional event notes or details.
  final String? description;

  /// Calendar system selected when creating this event.
  final EventCalendarType calendarType;

  /// Date and time when the event begins.
  final DateTime startDate;

  /// Optional date and time when the event concludes.
  final DateTime? endDate;

  /// Whether this is a full-day event without specific clock times.
  final bool isAllDay;

  /// Recurrence rule.
  final EventRecurrence recurrence;

  /// Minutes before event to trigger reminder (e.g. 15, 60, 1440).
  final int? reminderMinutes;

  /// Optional custom color (ARGB int).
  final int? colorValue;

  /// Whether the event is active (false if soft-deleted).
  final bool isActive;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  PersonalEvent copyWith({
    String? id,
    String? title,
    String? description,
    EventCalendarType? calendarType,
    DateTime? startDate,
    DateTime? endDate,
    bool? isAllDay,
    EventRecurrence? recurrence,
    int? reminderMinutes,
    int? colorValue,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      PersonalEvent(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        calendarType: calendarType ?? this.calendarType,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        isAllDay: isAllDay ?? this.isAllDay,
        recurrence: recurrence ?? this.recurrence,
        reminderMinutes: reminderMinutes ?? this.reminderMinutes,
        colorValue: colorValue ?? this.colorValue,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalEvent &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
