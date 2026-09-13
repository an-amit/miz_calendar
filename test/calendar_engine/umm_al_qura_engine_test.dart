import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/calendar_engine/engines/umm_al_qura_engine.dart';
import 'package:miz_calendar/calendar_engine/models/gregorian_date.dart';
import 'package:miz_calendar/calendar_engine/models/hijri_date.dart';

void main() {
  group('UmmAlQuraEngine', () {
    const engine = UmmAlQuraEngine();

    test('metadata and identification', () {
      expect(engine.id, equals('UMM_AL_QURA'));
      expect(engine.displayName, equals('Umm al-Qura'));
    });

    test('converts 2026-09-11 to 29 Rabi al-Awwal 1448 AH', () {
      const gDate = GregorianDate(2026, 9, 11);
      final hDate = engine.fromGregorian(gDate);

      expect(hDate.year, equals(1448));
      expect(hDate.month, equals(3));
      expect(hDate.day, equals(29));
      expect(hDate.source, equals(HijriDateSource.calculated));
      expect(hDate.method, equals('UMM_AL_QURA'));
      expect(hDate.region, equals('SA'));
    });

    test('converts 1 Ramadan 1445 AH to 2024-03-11 Gregorian', () {
      const hDate = HijriDate(year: 1445, month: 9, day: 1);
      final gDate = engine.toGregorian(hDate);

      expect(gDate, equals(const GregorianDate(2024, 3, 11)));
    });

    test('converts 1 Shawwal 1445 AH (Eid al-Fitr) to 2024-04-10 Gregorian', () {
      const hDate = HijriDate(year: 1445, month: 10, day: 1);
      final gDate = engine.toGregorian(hDate);

      expect(gDate, equals(const GregorianDate(2024, 4, 10)));
    });

    test('converts 10 Dhul-Hijja 1445 AH (Eid al-Adha) to 2024-06-16 Gregorian', () {
      const hDate = HijriDate(year: 1445, month: 12, day: 10);
      final gDate = engine.toGregorian(hDate);

      expect(gDate, equals(const GregorianDate(2024, 6, 16)));
    });

    test('converts 1 Muharram 1446 AH (Islamic New Year) to 2024-07-07 Gregorian', () {
      const hDate = HijriDate(year: 1446, month: 1, day: 1);
      final gDate = engine.toGregorian(hDate);

      expect(gDate, equals(const GregorianDate(2024, 7, 7)));
    });

    test('bi-directional round-trip conversion holds for sample range', () {
      for (var month = 1; month <= 12; month++) {
        final g = GregorianDate(2025, month, 15);
        final h = engine.fromGregorian(g);
        final gReconstructed = engine.toGregorian(h);
        expect(gReconstructed, equals(g));
      }
    });

    test('days in month is strictly 29 or 30 days for lunar calendar', () {
      for (var month = 1; month <= 12; month++) {
        final days = engine.daysInMonth(1446, month);
        expect(days == 29 || days == 30, isTrue);
      }
    });
  });
}
