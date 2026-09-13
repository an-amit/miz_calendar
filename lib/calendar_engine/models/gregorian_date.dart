/// Domain model representing a Gregorian civil calendar date.
///
/// Disconnected from specific timezones or instants — represents purely
/// a calendar day (e.g. 2026-09-11).
library;

import 'package:meta/meta.dart';

@immutable
final class GregorianDate implements Comparable<GregorianDate> {
  const GregorianDate(this.year, this.month, this.day)
      : assert(month >= 1 && month <= 12, 'Month must be between 1 and 12'),
        assert(day >= 1 && day <= 31, 'Day must be between 1 and 31');

  /// Creates a [GregorianDate] from Dart's [DateTime].
  factory GregorianDate.fromDateTime(DateTime dateTime) =>
      GregorianDate(dateTime.year, dateTime.month, dateTime.day);

  final int year;
  final int month;
  final int day;

  /// Returns weekday (1 = Monday, 7 = Sunday) matching ISO-8601.
  int get weekday => toDateTime().weekday;

  /// Whether this Gregorian year is a leap year.
  bool get isLeapYear =>
      (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

  /// Number of days in this date's month.
  int get daysInMonth => switch (month) {
        1 || 3 || 5 || 7 || 8 || 10 || 12 => 31,
        4 || 6 || 9 || 11 => 30,
        2 => isLeapYear ? 29 : 28,
        _ => 30,
      };

  /// Converts to local [DateTime] at start of day (midnight).
  DateTime toDateTime() => DateTime(year, month, day);

  /// Adds [days] days and returns the new [GregorianDate].
  GregorianDate addDays(int days) {
    if (days == 0) return this;
    final dt = toDateTime().add(Duration(days: days));
    return GregorianDate(dt.year, dt.month, dt.day);
  }

  /// Subtracts [days] days and returns the new [GregorianDate].
  GregorianDate subtractDays(int days) => addDays(-days);

  /// Returns difference in days between this and [other].
  int differenceInDays(GregorianDate other) =>
      toDateTime().difference(other.toDateTime()).inDays;

  /// ISO 8601 formatted date string: YYYY-MM-DD.
  String toIso8601String() {
    final y = year.toString().padLeft(4, '0');
    final m = month.toString().padLeft(2, '0');
    final d = day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  @override
  int compareTo(GregorianDate other) {
    if (year != other.year) return year.compareTo(other.year);
    if (month != other.month) return month.compareTo(other.month);
    return day.compareTo(other.day);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GregorianDate &&
          runtimeType == other.runtimeType &&
          year == other.year &&
          month == other.month &&
          day == other.day;

  @override
  int get hashCode => Object.hash(year, month, day);

  @override
  String toString() => toIso8601String();
}
