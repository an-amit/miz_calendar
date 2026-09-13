/// Pure mathematical algorithms for Julian Day Number (JDN) conversions.
///
/// Serves as the immutable astronomical bridge between calendar systems.
library;

import '../models/gregorian_date.dart';

abstract final class JulianDayNumber {
  JulianDayNumber._();

  /// Converts a Gregorian date (year, month, day) to a Julian Day Number (JDN).
  ///
  /// Uses the Fliegel & Van Flandern standard integer algorithm for the
  /// proleptic Gregorian calendar.
  static int fromGregorian(int year, int month, int day) {
    final a = (14 - month) ~/ 12;
    final y = year + 4800 - a;
    final m = month + 12 * a - 3;
    return day +
        (153 * m + 2) ~/ 5 +
        365 * y +
        y ~/ 4 -
        y ~/ 100 +
        y ~/ 400 -
        32045;
  }

  /// Converts a [GregorianDate] instance to a Julian Day Number.
  static int fromGregorianDate(GregorianDate date) =>
      fromGregorian(date.year, date.month, date.day);

  /// Converts a Julian Day Number back to a [GregorianDate].
  static GregorianDate toGregorian(int jdn) {
    final a = jdn + 32044;
    final b = (4 * a + 3) ~/ 146097;
    final c = a - (146097 * b) ~/ 4;
    final d = (4 * c + 3) ~/ 1461;
    final e = c - (1461 * d) ~/ 4;
    final m = (5 * e + 2) ~/ 153;
    final day = e - (153 * m + 2) ~/ 5 + 1;
    final month = m + 3 - 12 * (m ~/ 10);
    final year = 100 * b + d - 4800 + m ~/ 10;
    return GregorianDate(year, month, day);
  }
}
