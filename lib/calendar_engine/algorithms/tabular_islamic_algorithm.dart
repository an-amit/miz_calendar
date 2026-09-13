/// Pure mathematical algorithm for the Tabular Islamic calendar.
///
/// Implements the 30-year cyclical arithmetic calendar without any external dependencies.
library;

import '../models/hijri_date.dart';

enum TabularEpoch {
  /// Civil epoch (Thursday, 15 July 622 CE astronomical / 16 July 622 civil, JDN 1948440).
  civil,

  /// Astronomical epoch (Friday, 16 July 622 CE, JDN 1948439).
  astronomical,
}

abstract final class TabularIslamicAlgorithm {
  TabularIslamicAlgorithm._();

  /// Civil Islamic epoch Julian Day Number (1 Muharram 1 AH).
  static const int kCivilEpochJdn = 1948440;

  /// Astronomical Islamic epoch Julian Day Number.
  static const int kAstronomicalEpochJdn = 1948439;

  /// Standard 30-year cycle leap year positions for Civil (Kuwaiti) convention:
  /// Years 2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29.
  static const Set<int> kCivilLeapYears = {
    2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29,
  };

  /// Standard 30-year cycle leap year positions for Astronomical convention:
  /// Years 2, 5, 7, 10, 13, 15, 18, 21, 24, 26, 29 (year 15 replaces 16).
  static const Set<int> kAstronomicalLeapYears = {
    2, 5, 7, 10, 13, 15, 18, 21, 24, 26, 29,
  };

  /// Returns whether a given Hijri year is a leap year.
  static bool isLeapYear(int year, {bool isAstronomical = false}) {
    final yearInCycle = ((year - 1) % 30) + 1;
    final leapSet = isAstronomical ? kAstronomicalLeapYears : kCivilLeapYears;
    return leapSet.contains(yearInCycle);
  }

  /// Returns number of days in a given Hijri month (1..12).
  static int daysInMonth(int year, int month, {bool isAstronomical = false}) {
    if (month % 2 != 0) return 30; // Months 1, 3, 5, 7, 9, 11
    if (month == 12) {
      return isLeapYear(year, isAstronomical: isAstronomical) ? 30 : 29;
    }
    return 29; // Months 2, 4, 6, 8, 10
  }

  /// Converts a Julian Day Number (JDN) to a Tabular Hijri date.
  static HijriDate fromJdn(
    int jdn, {
    bool isAstronomical = false,
    HijriDateSource source = HijriDateSource.calculated,
    String method = 'TABULAR_CIVIL',
  }) {
    final epoch = isAstronomical ? kAstronomicalEpochJdn : kCivilEpochJdn;
    var daysSinceEpoch = jdn - epoch;

    if (daysSinceEpoch < 0) {
      // Proleptic calculation before 1 AH
      var year = 1;
      while (daysSinceEpoch < 0) {
        year--;
        final daysInYear = isLeapYear(year, isAstronomical: isAstronomical) ? 355 : 354;
        daysSinceEpoch += daysInYear;
      }
      var month = 1;
      while (true) {
        final dim = daysInMonth(year, month, isAstronomical: isAstronomical);
        if (daysSinceEpoch < dim) break;
        daysSinceEpoch -= dim;
        month++;
      }
      return HijriDate(
        year: year,
        month: month,
        day: daysSinceEpoch + 1,
        source: source,
        method: method,
      );
    }

    // Cycles of 30 years (10631 days)
    final cycles = daysSinceEpoch ~/ 10631;
    var remainingDays = daysSinceEpoch % 10631;

    var yearInCycle = 1;
    while (yearInCycle <= 30) {
      final daysInYear = isLeapYear(yearInCycle, isAstronomical: isAstronomical) ? 355 : 354;
      if (remainingDays < daysInYear) break;
      remainingDays -= daysInYear;
      yearInCycle++;
    }

    final year = cycles * 30 + yearInCycle;

    var month = 1;
    while (month <= 12) {
      final dim = daysInMonth(year, month, isAstronomical: isAstronomical);
      if (remainingDays < dim) break;
      remainingDays -= dim;
      month++;
    }

    final day = remainingDays + 1;

    return HijriDate(
      year: year,
      month: month,
      day: day,
      source: source,
      method: method,
    );
  }

  /// Converts a Tabular Hijri date to Julian Day Number (JDN).
  static int toJdn(int year, int month, int day, {bool isAstronomical = false}) {
    final epoch = isAstronomical ? kAstronomicalEpochJdn : kCivilEpochJdn;
    var totalDays = 0;

    if (year >= 1) {
      final cycles = (year - 1) ~/ 30;
      totalDays += cycles * 10631;
      final yearInCycle = ((year - 1) % 30) + 1;
      for (var y = 1; y < yearInCycle; y++) {
        totalDays += isLeapYear(y, isAstronomical: isAstronomical) ? 355 : 354;
      }
    } else {
      for (var y = year; y < 1; y++) {
        totalDays -= isLeapYear(y, isAstronomical: isAstronomical) ? 355 : 354;
      }
    }

    for (var m = 1; m < month; m++) {
      totalDays += daysInMonth(year, m, isAstronomical: isAstronomical);
    }

    totalDays += day - 1;

    return epoch + totalDays;
  }
}
