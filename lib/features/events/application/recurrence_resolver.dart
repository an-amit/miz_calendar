/// Evaluates event occurrences against calendar dates for Gregorian and Hijri recurrence.
library;

import '../../../calendar_engine/calendar_engine.dart';
import '../domain/personal_event.dart';
import '../domain/recurrence.dart';

abstract final class RecurrenceResolver {
  RecurrenceResolver._();

  /// Determines whether [event] occurs on [targetDate].
  static bool occursOnDate(
    PersonalEvent event,
    CalendarDate targetDate, {
    HijriCalendarEngine engine = const UmmAlQuraEngine(),
  }) {
    if (!event.isActive) return false;

    final eventStartGregorian = GregorianDate(
      event.startDate.year,
      event.startDate.month,
      event.startDate.day,
    );

    // Event cannot occur before its inception date
    if (targetDate.gregorian.compareTo(eventStartGregorian) < 0) {
      return false;
    }

    // Single occurrence (no recurrence)
    if (!event.recurrence.isRecurring) {
      return targetDate.gregorian == eventStartGregorian;
    }

    // Hijri-based recurrence
    if (event.calendarType == EventCalendarType.hijri) {
      final rec = event.recurrence;
      final targetHijri = targetDate.hijri;

      switch (rec.frequency) {
        case RecurrenceFrequency.yearly:
          // Must match the scheduled Hijri month and day
          final eventHijri = engine.fromGregorian(eventStartGregorian);
          final hMonth = rec.hijriMonth ?? eventHijri.month;
          final hDay = rec.hijriDay ?? eventHijri.day;
          return targetHijri.month == hMonth && targetHijri.day == hDay;

        case RecurrenceFrequency.monthly:
          // Must match the scheduled Hijri day of each month
          final eventHijri = engine.fromGregorian(eventStartGregorian);
          final hDay = rec.hijriDay ?? eventHijri.day;
          return targetHijri.day == hDay;

        case RecurrenceFrequency.daily:
          final diffDays = targetDate.gregorian.toDateTime()
              .difference(eventStartGregorian.toDateTime())
              .inDays;
          return diffDays >= 0 && (diffDays % rec.interval == 0);

        case RecurrenceFrequency.weekly:
          final eventWeekday = eventStartGregorian.weekday;
          if (targetDate.gregorian.weekday != eventWeekday) return false;
          final diffWeeks = (targetDate.gregorian.toDateTime()
                      .difference(eventStartGregorian.toDateTime())
                      .inDays /
                  7)
              .floor();
          return diffWeeks >= 0 && (diffWeeks % rec.interval == 0);

        case RecurrenceFrequency.none:
          return targetDate.gregorian == eventStartGregorian;
      }
    }

    // Gregorian-based recurrence
    final rec = event.recurrence;
    final gTarget = targetDate.gregorian;

    switch (rec.frequency) {
      case RecurrenceFrequency.daily:
        final diffDays = gTarget.toDateTime()
            .difference(eventStartGregorian.toDateTime())
            .inDays;
        return diffDays >= 0 && (diffDays % rec.interval == 0);

      case RecurrenceFrequency.weekly:
        if (gTarget.weekday != eventStartGregorian.weekday) return false;
        final diffWeeks = (gTarget.toDateTime()
                    .difference(eventStartGregorian.toDateTime())
                    .inDays /
                7)
            .floor();
        return diffWeeks >= 0 && (diffWeeks % rec.interval == 0);

      case RecurrenceFrequency.monthly:
        // Same day of month
        if (gTarget.day != eventStartGregorian.day) return false;
        final monthsDiff =
            (gTarget.year - eventStartGregorian.year) * 12 +
            (gTarget.month - eventStartGregorian.month);
        return monthsDiff >= 0 && (monthsDiff % rec.interval == 0);

      case RecurrenceFrequency.yearly:
        // Same month and day
        if (gTarget.month != eventStartGregorian.month ||
            gTarget.day != eventStartGregorian.day) {
          return false;
        }
        final yearsDiff = gTarget.year - eventStartGregorian.year;
        return yearsDiff >= 0 && (yearsDiff % rec.interval == 0);

      case RecurrenceFrequency.none:
        return gTarget == eventStartGregorian;
    }
  }
}
