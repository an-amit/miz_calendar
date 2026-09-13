/// Orchestrator for calendar conversions implementing the domain pipeline:
/// Instant → TimeZone → LocalDateTime → GregorianDate → HijriDate
library;

import '../engines/calendar_engine.dart';
import '../models/calendar_date.dart';
import '../models/gregorian_date.dart';
import '../models/hijri_date.dart';
import '../models/instant.dart';
import '../models/time_zone.dart';

final class CalendarConverter {
  const CalendarConverter({required this.engine});

  /// The active [HijriCalendarEngine] used for Hijri conversions.
  final HijriCalendarEngine engine;

  /// Converts an [Instant] in a given [TimeZone] to its corresponding [CalendarDate].
  ///
  /// Flow: Instant → TimeZone → LocalDateTime → GregorianDate → HijriDate
  CalendarDate instantToCalendarDate(Instant instant, TimeZone timeZone) {
    // 1. Instant + TimeZone → LocalDateTime
    final localDateTime = instant.toLocalDateTime(timeZone);

    // 2. LocalDateTime → GregorianDate
    final gregorian = GregorianDate(
      localDateTime.date.year,
      localDateTime.date.month,
      localDateTime.date.day,
    );

    // 3. GregorianDate → HijriDate via active engine
    final hijri = engine.fromGregorian(gregorian);

    return CalendarDate(
      gregorian: gregorian,
      hijri: hijri,
    );
  }

  /// Converts a [GregorianDate] directly to dual [CalendarDate].
  CalendarDate fromGregorian(GregorianDate date) => CalendarDate(
        gregorian: date,
        hijri: engine.fromGregorian(date),
      );

  /// Converts a [HijriDate] directly to dual [CalendarDate].
  CalendarDate fromHijri(HijriDate date) => CalendarDate(
        gregorian: engine.toGregorian(date),
        hijri: date,
      );

  /// Converts today's local date to [CalendarDate].
  CalendarDate today({TimeZone? timeZone}) {
    final tz = timeZone ?? TimeZone.current();
    return instantToCalendarDate(Instant.now(), tz);
  }
}
