/// Umm al-Qura calculation engine adapter.
///
/// Wraps the third-party `hijri` library behind the domain [HijriCalendarEngine]
/// interface, completely isolating the rest of the application from external types.
library;

import 'package:hijri/hijri_calendar.dart';

import '../../core/errors/app_exception.dart';
import '../models/gregorian_date.dart';
import '../models/hijri_date.dart';
import 'calendar_engine.dart';

final class UmmAlQuraEngine implements HijriCalendarEngine {
  const UmmAlQuraEngine();

  static const String engineId = 'UMM_AL_QURA';

  @override
  String get id => engineId;

  @override
  String get displayName => 'Umm al-Qura';

  @override
  HijriDate fromGregorian(GregorianDate date) {
    try {
      final calendar = HijriCalendar.fromDate(
        DateTime(date.year, date.month, date.day),
      );
      return HijriDate(
        year: calendar.hYear,
        month: calendar.hMonth,
        day: calendar.hDay,
        region: 'SA',
      );
    } on Exception catch (e) {
      throw CalendarCalculationException(
        'Failed to convert Gregorian $date to Umm al-Qura Hijri date',
        cause: e,
      );
    }
  }

  @override
  GregorianDate toGregorian(HijriDate date) {
    try {
      final gregorianDt = HijriCalendar().hijriToGregorian(
        date.year,
        date.month,
        date.day,
      );
      return GregorianDate(
        gregorianDt.year,
        gregorianDt.month,
        gregorianDt.day,
      );
    } on Exception catch (e) {
      throw CalendarCalculationException(
        'Failed to convert Hijri $date to Gregorian date using Umm al-Qura',
        cause: e,
      );
    }
  }

  @override
  int daysInMonth(int year, int month) {
    try {
      return HijriCalendar().getDaysInMonth(year, month);
    } on Exception catch (e) {
      throw CalendarCalculationException(
        'Failed to query days in Hijri month ($year-$month)',
        cause: e,
      );
    }
  }

  @override
  bool isLeapYear(int year) {
    try {
      // In Umm al-Qura lunar calendar, a leap year has 355 days (Dhul-Hijja has 30 days).
      return daysInMonth(year, 12) == 30;
    } on Exception catch (e) {
      throw CalendarCalculationException(
        'Failed to determine leap year for Hijri year $year',
        cause: e,
      );
    }
  }
}
