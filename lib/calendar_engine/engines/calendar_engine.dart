/// Abstract interface for all Hijri calendar calculation engines.
///
/// Ensures the application domain logic is decoupled from any specific
/// mathematical algorithm or third-party calculation package.
library;

import '../models/gregorian_date.dart';
import '../models/hijri_date.dart';

abstract interface class HijriCalendarEngine {
  /// Converts a [GregorianDate] to a [HijriDate] using this engine's methodology.
  HijriDate fromGregorian(GregorianDate date);

  /// Converts a [HijriDate] back to a [GregorianDate].
  GregorianDate toGregorian(HijriDate date);

  /// Returns the number of days in the specified Hijri month (1..12).
  int daysInMonth(int year, int month);

  /// Returns whether the specified Hijri year is a leap year.
  bool isLeapYear(int year);

  /// Unique identifier of the engine (e.g. 'UMM_AL_QURA', 'TABULAR_CIVIL').
  String get id;

  /// User-facing display name of this engine.
  String get displayName;
}
