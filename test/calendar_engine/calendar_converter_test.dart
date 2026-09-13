import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/calendar_engine/converters/calendar_converter.dart';
import 'package:miz_calendar/calendar_engine/engines/umm_al_qura_engine.dart';
import 'package:miz_calendar/calendar_engine/models/gregorian_date.dart';
import 'package:miz_calendar/calendar_engine/models/instant.dart';
import 'package:miz_calendar/calendar_engine/models/time_zone.dart';

void main() {
  group('CalendarConverter', () {
    const converter = CalendarConverter(engine: UmmAlQuraEngine());

    test('respects local civil day boundary across timezone differences', () {
      // 2026-09-11 20:00:00 UTC
      // In UTC (offset 0), it is still 11 September 2026.
      // In Tokyo (offset +9h = +540m), it is already 12 September 2026 at 05:00:00.
      final instant = Instant.fromEpochMilliseconds(
        DateTime.utc(2026, 9, 11, 20).millisecondsSinceEpoch,
      );

      const utcTz = TimeZone.utc;
      const tokyoTz = TimeZone(identifier: 'Asia/Tokyo', offsetInMinutes: 540);

      final utcCalendarDate = converter.instantToCalendarDate(instant, utcTz);
      final tokyoCalendarDate = converter.instantToCalendarDate(instant, tokyoTz);

      expect(utcCalendarDate.gregorian, equals(const GregorianDate(2026, 9, 11)));
      expect(tokyoCalendarDate.gregorian, equals(const GregorianDate(2026, 9, 12)));

      // Hijri date in Tokyo should also be the next day
      expect(
        tokyoCalendarDate.hijri.day,
        isNot(equals(utcCalendarDate.hijri.day)),
      );
    });

    test('fromGregorian creates consistent dual CalendarDate', () {
      const g = GregorianDate(2026, 9, 11);
      final cd = converter.fromGregorian(g);

      expect(cd.gregorian, equals(g));
      expect(cd.hijri.year, equals(1448));
      expect(cd.hijri.month, equals(3));
      expect(cd.hijri.day, equals(29));
    });

    test('fromHijri reconstructs dual CalendarDate', () {
      const g = GregorianDate(2026, 9, 11);
      final cd = converter.fromGregorian(g);
      final cdReconstructed = converter.fromHijri(cd.hijri);

      expect(cdReconstructed.gregorian, equals(g));
    });
  });
}
