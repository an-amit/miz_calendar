/// Domain entity representing a canonical Islamic occasion or holiday.
library;

import 'package:meta/meta.dart';

import '../../../calendar_engine/calendar_engine.dart';
import 'event_day_boundary.dart';

/// Definition of a canonical Islamic event in the lunar Hijri calendar.
@immutable
class IslamicEvent {
  const IslamicEvent({
    required this.id,
    required this.nameKey,
    required this.descriptionKey,
    required this.hijriMonth,
    required this.hijriDay,
    this.durationDays = 1,
    this.isMajor = false,
    this.dayBoundary = EventDayBoundary.calendarDay,
  });

  /// Unique identifier (e.g. 'eid_al_fitr').
  final String id;

  /// Localization key for the title.
  final String nameKey;

  /// Localization key for the description.
  final String descriptionKey;

  /// Hijri month (1–12).
  final int hijriMonth;

  /// Hijri day of month (1–30).
  final int hijriDay;

  /// Length of observance in days.
  final int durationDays;

  /// Whether this is one of the premier Islamic celebrations.
  final bool isMajor;

  /// Day boundary rule.
  final EventDayBoundary dayBoundary;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IslamicEvent &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

/// An occurrence of an [IslamicEvent] resolved for a specific year and calendar dates.
@immutable
class ResolvedIslamicEvent {
  const ResolvedIslamicEvent({
    required this.event,
    required this.hijriDate,
    required this.gregorianDate,
    this.dayIndex = 0,
  });

  /// The underlying Islamic event definition.
  final IslamicEvent event;

  /// The specific Hijri date for this occurrence.
  final HijriDate hijriDate;

  /// The corresponding Gregorian date.
  final GregorianDate gregorianDate;

  /// Day index for multi-day events (0-indexed).
  final int dayIndex;

  /// Whether this is the first day of a multi-day observance.
  bool get isFirstDay => dayIndex == 0;
}
