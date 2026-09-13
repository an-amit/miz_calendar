import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/calendar_engine/algorithms/tabular_islamic_algorithm.dart';

void main() {
  group('TabularIslamicAlgorithm', () {
    test('1 Muharram 1 AH converts to civil epoch JDN 1948440', () {
      final jdn = TabularIslamicAlgorithm.toJdn(1, 1, 1);
      expect(jdn, equals(TabularIslamicAlgorithm.kCivilEpochJdn));

      final hijri = TabularIslamicAlgorithm.fromJdn(jdn);
      expect(hijri.year, equals(1));
      expect(hijri.month, equals(1));
      expect(hijri.day, equals(1));
    });

    test('verifies 30-year cycle contains exactly 11 leap years (Civil)', () {
      var leapCount = 0;
      for (var y = 1; y <= 30; y++) {
        if (TabularIslamicAlgorithm.isLeapYear(y)) {
          leapCount++;
        }
      }
      expect(leapCount, equals(11));
    });

    test('verifies 30-year cycle total days equals 10631', () {
      final startJdn = TabularIslamicAlgorithm.toJdn(1, 1, 1);
      final endJdn = TabularIslamicAlgorithm.toJdn(31, 1, 1);
      expect(endJdn - startJdn, equals(10631));
    });

    test('leap year has 30 days in month 12 (Dhul-Hijja), normal year has 29', () {
      // Year 2 is leap year
      expect(TabularIslamicAlgorithm.isLeapYear(2), isTrue);
      expect(TabularIslamicAlgorithm.daysInMonth(2, 12), equals(30));

      // Year 1 is normal year
      expect(TabularIslamicAlgorithm.isLeapYear(1), isFalse);
      expect(TabularIslamicAlgorithm.daysInMonth(1, 12), equals(29));

      // Odd months always have 30 days
      for (var m = 1; m <= 11; m += 2) {
        expect(TabularIslamicAlgorithm.daysInMonth(1, m), equals(30));
        expect(TabularIslamicAlgorithm.daysInMonth(2, m), equals(30));
      }
    });

    test('bi-directional consistency for 1000 days', () {
      for (var jdn = 2450000; jdn <= 2451000; jdn++) {
        final h = TabularIslamicAlgorithm.fromJdn(jdn);
        final roundtripJdn = TabularIslamicAlgorithm.toJdn(h.year, h.month, h.day);
        expect(roundtripJdn, equals(jdn));
      }
    });
  });
}
