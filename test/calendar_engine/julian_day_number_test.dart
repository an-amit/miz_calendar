import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/calendar_engine/algorithms/julian_day_number.dart';
import 'package:miz_calendar/calendar_engine/models/gregorian_date.dart';

void main() {
  group('JulianDayNumber', () {
    test('converts 2000-01-01 to standard astronomical JDN 2451545', () {
      final jdn = JulianDayNumber.fromGregorian(2000, 1, 1);
      expect(jdn, equals(2451545));
    });

    test('converts JDN 2451545 back to 2000-01-01', () {
      final date = JulianDayNumber.toGregorian(2451545);
      expect(date, equals(const GregorianDate(2000, 1, 1)));
    });

    test('converts Gregorian calendar reform date 1582-10-15 to JDN 2299161', () {
      final jdn = JulianDayNumber.fromGregorian(1582, 10, 15);
      expect(jdn, equals(2299161));
      final date = JulianDayNumber.toGregorian(jdn);
      expect(date, equals(const GregorianDate(1582, 10, 15)));
    });

    test('converts 2026-09-11 bi-directionally without drift', () {
      const original = GregorianDate(2026, 9, 11);
      final jdn = JulianDayNumber.fromGregorianDate(original);
      final reconstructed = JulianDayNumber.toGregorian(jdn);
      expect(reconstructed, equals(original));
    });

    test('handles leap year 2024-02-29 and day after 2024-03-01', () {
      final jdnLeap = JulianDayNumber.fromGregorian(2024, 2, 29);
      final jdnNext = JulianDayNumber.fromGregorian(2024, 3, 1);
      expect(jdnNext - jdnLeap, equals(1));

      expect(
        JulianDayNumber.toGregorian(jdnLeap),
        equals(const GregorianDate(2024, 2, 29)),
      );
      expect(
        JulianDayNumber.toGregorian(jdnNext),
        equals(const GregorianDate(2024, 3, 1)),
      );
    });

    test('sequential dates have sequential JDNs across 1000 days', () {
      var current = const GregorianDate(2020, 1, 1);
      var prevJdn = JulianDayNumber.fromGregorianDate(current);

      for (var i = 1; i <= 1000; i++) {
        current = current.addDays(1);
        final currentJdn = JulianDayNumber.fromGregorianDate(current);
        expect(currentJdn, equals(prevJdn + 1));
        expect(JulianDayNumber.toGregorian(currentJdn), equals(current));
        prevJdn = currentJdn;
      }
    });
  });
}
