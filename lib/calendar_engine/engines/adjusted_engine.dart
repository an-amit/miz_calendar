/// Decorator engine that applies a user-configured Hijri adjustment (±2 days)
/// over an underlying [HijriCalendarEngine].
library;

import '../adjustments/hijri_adjustment.dart';
import '../models/gregorian_date.dart';
import '../models/hijri_date.dart';
import 'calendar_engine.dart';

final class AdjustedEngine implements HijriCalendarEngine {
  const AdjustedEngine({
    required this.baseEngine,
    required this.adjustment,
  });

  /// The underlying engine being decorated.
  final HijriCalendarEngine baseEngine;

  /// The adjustment to apply (-2 to +2 days).
  final HijriAdjustment adjustment;

  @override
  String get id => '${baseEngine.id}_ADJUSTED_${adjustment.days}';

  @override
  String get displayName =>
      '${baseEngine.displayName} (${adjustment}d)';

  @override
  HijriDate fromGregorian(GregorianDate date) {
    if (!adjustment.hasAdjustment) {
      return baseEngine.fromGregorian(date);
    }
    // Shift Gregorian date by adjustment days to compute the shifted Hijri date
    final shiftedGregorian = date.addDays(adjustment.days);
    final baseHijri = baseEngine.fromGregorian(shiftedGregorian);

    return baseHijri.copyWith(
      source: HijriDateSource.userAdjusted,
      metadata: {
        ...baseHijri.metadata,
        'adjustment': adjustment.days,
        'baseMethod': baseEngine.id,
      },
    );
  }

  @override
  GregorianDate toGregorian(HijriDate date) {
    if (!adjustment.hasAdjustment) {
      return baseEngine.toGregorian(date);
    }
    // Convert through base engine, then invert the shift
    final baseGregorian = baseEngine.toGregorian(date);
    return baseGregorian.subtractDays(adjustment.days);
  }

  @override
  int daysInMonth(int year, int month) => baseEngine.daysInMonth(year, month);

  @override
  bool isLeapYear(int year) => baseEngine.isLeapYear(year);
}
