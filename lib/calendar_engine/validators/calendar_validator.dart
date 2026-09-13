/// Validation logic for calendar dates and configuration parameters.
library;

import '../../core/errors/app_exception.dart';
import '../../core/result/result.dart';
import '../models/gregorian_date.dart';
import '../models/hijri_date.dart';

abstract final class CalendarValidator {
  CalendarValidator._();

  /// Validates whether a Gregorian date components form a legitimate civil date.
  static Result<GregorianDate, CalendarCalculationException> validateGregorian(
    int year,
    int month,
    int day,
  ) {
    if (year < 1 || year > 9999) {
      return const Err(
        CalendarCalculationException('Year must be between 1 and 9999'),
      );
    }
    if (month < 1 || month > 12) {
      return const Err(
        CalendarCalculationException('Month must be between 1 and 12'),
      );
    }
    final tempDate = GregorianDate(year, month, 1);
    final maxDays = tempDate.daysInMonth;
    if (day < 1 || day > maxDays) {
      return Err(
        CalendarCalculationException(
          'Day must be between 1 and $maxDays for $year-$month',
        ),
      );
    }
    return Ok(GregorianDate(year, month, day));
  }

  /// Validates Hijri date components.
  static Result<HijriDate, InvalidHijriDateException> validateHijri({
    required int year,
    required int month,
    required int day,
    int maxDaysInMonth = 30,
    HijriDateSource source = HijriDateSource.calculated,
    String method = 'UMM_AL_QURA',
  }) {
    if (year < 1 || year > 2500) {
      return const Err(
        InvalidHijriDateException('Hijri year must be between 1 and 2500'),
      );
    }
    if (month < 1 || month > 12) {
      return const Err(
        InvalidHijriDateException('Hijri month must be between 1 and 12'),
      );
    }
    if (day < 1 || day > maxDaysInMonth) {
      return Err(
        InvalidHijriDateException(
          'Hijri day must be between 1 and $maxDaysInMonth for month $month in year $year',
        ),
      );
    }
    return Ok(
      HijriDate(
        year: year,
        month: month,
        day: day,
        source: source,
        method: method,
      ),
    );
  }

  /// Validates Hijri adjustment.
  static bool isValidAdjustment(int days) => days >= -2 && days <= 2;
}
