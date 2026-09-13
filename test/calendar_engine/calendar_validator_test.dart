import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/calendar_engine/validators/calendar_validator.dart';

void main() {
  group('CalendarValidator', () {
    test('validates legitimate Gregorian dates', () {
      final res = CalendarValidator.validateGregorian(2024, 2, 29); // leap year
      expect(res.isOk, isTrue);
      expect(res.unwrap().day, equals(29));
    });

    test('rejects 29 Feb on non-leap year', () {
      final res = CalendarValidator.validateGregorian(2025, 2, 29);
      expect(res.isErr, isTrue);
    });

    test('rejects invalid months (< 1 or > 12)', () {
      expect(CalendarValidator.validateGregorian(2024, 0, 1).isErr, isTrue);
      expect(CalendarValidator.validateGregorian(2024, 13, 1).isErr, isTrue);
    });

    test('validates Hijri adjustments within [-2, +2]', () {
      expect(CalendarValidator.isValidAdjustment(-2), isTrue);
      expect(CalendarValidator.isValidAdjustment(-1), isTrue);
      expect(CalendarValidator.isValidAdjustment(0), isTrue);
      expect(CalendarValidator.isValidAdjustment(1), isTrue);
      expect(CalendarValidator.isValidAdjustment(2), isTrue);

      expect(CalendarValidator.isValidAdjustment(-3), isFalse);
      expect(CalendarValidator.isValidAdjustment(3), isFalse);
    });

    test('rejects Hijri day exceeding max days in month', () {
      final res = CalendarValidator.validateHijri(
        year: 1448,
        month: 1,
        day: 31,
      );
      expect(res.isErr, isTrue);
    });
  });
}
