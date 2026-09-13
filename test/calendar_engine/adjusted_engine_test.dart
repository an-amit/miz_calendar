import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/calendar_engine/adjustments/hijri_adjustment.dart';
import 'package:miz_calendar/calendar_engine/engines/adjusted_engine.dart';
import 'package:miz_calendar/calendar_engine/engines/umm_al_qura_engine.dart';
import 'package:miz_calendar/calendar_engine/models/gregorian_date.dart';
import 'package:miz_calendar/calendar_engine/models/hijri_date.dart';

void main() {
  group('AdjustedEngine', () {
    const baseEngine = UmmAlQuraEngine();
    const testDate = GregorianDate(2026, 9, 11);

    test('zero adjustment produces identical output to base engine', () {
      const adjustedEngine = AdjustedEngine(
        baseEngine: baseEngine,
        adjustment: HijriAdjustment.zero,
      );

      final unadjusted = baseEngine.fromGregorian(testDate);
      final adjusted = adjustedEngine.fromGregorian(testDate);

      expect(adjusted.year, equals(unadjusted.year));
      expect(adjusted.month, equals(unadjusted.month));
      expect(adjusted.day, equals(unadjusted.day));
    });

    test('+1 adjustment shifts Hijri date forward by 1 day', () {
      const adjustedEngine = AdjustedEngine(
        baseEngine: baseEngine,
        adjustment: HijriAdjustment(1),
      );

      final baseTomorrow = baseEngine.fromGregorian(testDate.addDays(1));
      final adjusted = adjustedEngine.fromGregorian(testDate);

      expect(adjusted.year, equals(baseTomorrow.year));
      expect(adjusted.month, equals(baseTomorrow.month));
      expect(adjusted.day, equals(baseTomorrow.day));
      expect(adjusted.source, equals(HijriDateSource.userAdjusted));
      expect(adjusted.metadata['adjustment'], equals(1));
    });

    test('-1 adjustment shifts Hijri date backward by 1 day', () {
      const adjustedEngine = AdjustedEngine(
        baseEngine: baseEngine,
        adjustment: HijriAdjustment(-1),
      );

      final baseYesterday = baseEngine.fromGregorian(testDate.subtractDays(1));
      final adjusted = adjustedEngine.fromGregorian(testDate);

      expect(adjusted.year, equals(baseYesterday.year));
      expect(adjusted.month, equals(baseYesterday.month));
      expect(adjusted.day, equals(baseYesterday.day));
      expect(adjusted.source, equals(HijriDateSource.userAdjusted));
      expect(adjusted.metadata['adjustment'], equals(-1));
    });

    test('bi-directional invertibility holds for all adjustment offsets (-2 to +2)', () {
      for (var offset = -2; offset <= 2; offset++) {
        final engine = AdjustedEngine(
          baseEngine: baseEngine,
          adjustment: HijriAdjustment(offset),
        );

        final h = engine.fromGregorian(testDate);
        final roundtrip = engine.toGregorian(h);
        expect(roundtrip, equals(testDate));
      }
    });

    test('handles month boundary with +2 adjustment', () {
      const endOfMonthDate = GregorianDate(2026, 9, 11);
      const enginePlus2 = AdjustedEngine(
        baseEngine: baseEngine,
        adjustment: HijriAdjustment(2),
      );

      final adjusted = enginePlus2.fromGregorian(endOfMonthDate);
      expect(adjusted.source, equals(HijriDateSource.userAdjusted));
      final roundtrip = enginePlus2.toGregorian(adjusted);
      expect(roundtrip, equals(endOfMonthDate));
    });
  });
}
