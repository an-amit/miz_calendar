/// Tabular Astronomical Islamic calendar engine.
///
/// Implements the 30-year cyclic arithmetic calendar with astronomical leap year
/// placement (years 2, 5, 7, 10, 13, 15, 18, 21, 24, 26, 29).
library;

import '../algorithms/julian_day_number.dart';
import '../algorithms/tabular_islamic_algorithm.dart';
import '../models/gregorian_date.dart';
import '../models/hijri_date.dart';
import 'calendar_engine.dart';

final class TabularAstronomicalEngine implements HijriCalendarEngine {
  const TabularAstronomicalEngine();

  static const String engineId = 'TABULAR_ASTRONOMICAL';

  @override
  String get id => engineId;

  @override
  String get displayName => 'Tabular (Astronomical)';

  @override
  HijriDate fromGregorian(GregorianDate date) {
    final jdn = JulianDayNumber.fromGregorianDate(date);
    return TabularIslamicAlgorithm.fromJdn(
      jdn,
      isAstronomical: true,
      method: engineId,
    );
  }

  @override
  GregorianDate toGregorian(HijriDate date) {
    final jdn = TabularIslamicAlgorithm.toJdn(
      date.year,
      date.month,
      date.day,
      isAstronomical: true,
    );
    return JulianDayNumber.toGregorian(jdn);
  }

  @override
  int daysInMonth(int year, int month) =>
      TabularIslamicAlgorithm.daysInMonth(year, month, isAstronomical: true);

  @override
  bool isLeapYear(int year) =>
      TabularIslamicAlgorithm.isLeapYear(year, isAstronomical: true);
}
