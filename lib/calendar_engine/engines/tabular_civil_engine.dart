/// Tabular Civil (Kuwaiti / Arithmetical) Islamic calendar engine.
///
/// Implements the 30-year cyclic arithmetic calendar using pure mathematics
/// without any external dependencies.
library;

import '../algorithms/julian_day_number.dart';
import '../algorithms/tabular_islamic_algorithm.dart';
import '../models/gregorian_date.dart';
import '../models/hijri_date.dart';
import 'calendar_engine.dart';

final class TabularCivilEngine implements HijriCalendarEngine {
  const TabularCivilEngine();

  static const String engineId = 'TABULAR_CIVIL';

  @override
  String get id => engineId;

  @override
  String get displayName => 'Tabular (Civil)';

  @override
  HijriDate fromGregorian(GregorianDate date) {
    final jdn = JulianDayNumber.fromGregorianDate(date);
    return TabularIslamicAlgorithm.fromJdn(jdn);
  }

  @override
  GregorianDate toGregorian(HijriDate date) {
    final jdn = TabularIslamicAlgorithm.toJdn(
      date.year,
      date.month,
      date.day,
    );
    return JulianDayNumber.toGregorian(jdn);
  }

  @override
  int daysInMonth(int year, int month) =>
      TabularIslamicAlgorithm.daysInMonth(year, month);

  @override
  bool isLeapYear(int year) =>
      TabularIslamicAlgorithm.isLeapYear(year);
}
