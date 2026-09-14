import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/calendar_engine/calendar_engine.dart';
import 'package:miz_calendar/features/events/application/recurrence_resolver.dart';
import 'package:miz_calendar/features/events/data/islamic_events_repository.dart';
import 'package:miz_calendar/features/events/domain/personal_event.dart';
import 'package:miz_calendar/features/events/domain/recurrence.dart';

void main() {
  const engine = UmmAlQuraEngine();

  group('IslamicEventsRepository', () {
    const repo = IslamicEventsRepositoryImpl();

    test('resolveEventsForHijriYear returns all seed occurrences for 1445 AH', () {
      final events = repo.resolveEventsForHijriYear(1445, engine);
      expect(events.isNotEmpty, isTrue);

      // Verify Eid al-Fitr (1 Shawwal = month 10, day 1)
      final eidFitr = events.firstWhere((e) => e.event.id == 'eid_al_fitr');
      expect(eidFitr.hijriDate.month, equals(10));
      expect(eidFitr.hijriDate.day, equals(1));
      // 1 Shawwal 1445 in Umm al-Qura is 2024-04-10
      expect(eidFitr.gregorianDate.year, equals(2024));
      expect(eidFitr.gregorianDate.month, equals(4));
      expect(eidFitr.gregorianDate.day, equals(10));
    });

    test('getEventsForDate correctly identifies Eid al-Fitr', () {
      // 2024-04-10 corresponds to 1 Shawwal 1445 AH (Eid al-Fitr Day 1)
      const gDate = GregorianDate(2024, 4, 10);
      final hDate = engine.fromGregorian(gDate);
      final cDate = CalendarDate(gregorian: gDate, hijri: hDate);

      final events = repo.getEventsForDate(cDate, engine);
      expect(events.any((e) => e.event.id == 'eid_al_fitr'), isTrue);
    });

    test('getUpcomingEvents filters events in the past and retains future', () {
      // Reference date: 2024-04-01 (Ramadan 1445)
      const refG = GregorianDate(2024, 4, 1);
      final refH = engine.fromGregorian(refG);
      final today = CalendarDate(gregorian: refG, hijri: refH);

      final upcoming = repo.getUpcomingEvents(today, engine);
      expect(upcoming.isNotEmpty, isTrue);
      for (final occ in upcoming) {
        expect(occ.gregorianDate.compareTo(refG) >= 0, isTrue);
      }
    });
  });

  group('RecurrenceResolver', () {
    final now = DateTime.now();

    test('non-recurring Gregorian event matches only on start date', () {
      final event = PersonalEvent(
        id: '1',
        title: 'Meeting',
        startDate: DateTime(2024, 5, 10, 10),
        createdAt: now,
        updatedAt: now,
      );

      final targetMatch = CalendarDate(
        gregorian: const GregorianDate(2024, 5, 10),
        hijri: engine.fromGregorian(const GregorianDate(2024, 5, 10)),
      );
      final targetMismatch = CalendarDate(
        gregorian: const GregorianDate(2024, 5, 11),
        hijri: engine.fromGregorian(const GregorianDate(2024, 5, 11)),
      );

      expect(RecurrenceResolver.occursOnDate(event, targetMatch), isTrue);
      expect(RecurrenceResolver.occursOnDate(event, targetMismatch), isFalse);
    });

    test('yearly Gregorian event recurs annually on same month and day', () {
      final event = PersonalEvent(
        id: '2',
        title: 'Gregorian Anniversary',
        startDate: DateTime(2020, 8, 15, 9),
        recurrence: const EventRecurrence(frequency: RecurrenceFrequency.yearly),
        createdAt: now,
        updatedAt: now,
      );

      final futureOccurrence = CalendarDate(
        gregorian: const GregorianDate(2026, 8, 15),
        hijri: engine.fromGregorian(const GregorianDate(2026, 8, 15)),
      );
      final wrongDay = CalendarDate(
        gregorian: const GregorianDate(2026, 8, 16),
        hijri: engine.fromGregorian(const GregorianDate(2026, 8, 16)),
      );

      expect(RecurrenceResolver.occursOnDate(event, futureOccurrence), isTrue);
      expect(RecurrenceResolver.occursOnDate(event, wrongDay), isFalse);
    });

    test('yearly Hijri event recurs annually on same Hijri month and day', () {
      // 15 Ramadan 1440 AH -> Gregorian date
      const startHijri = HijriDate(year: 1440, month: 9, day: 15);
      final startGreg = engine.toGregorian(startHijri);

      final event = PersonalEvent(
        id: '3',
        title: 'Hijri Birthday',
        calendarType: EventCalendarType.hijri,
        startDate: DateTime(startGreg.year, startGreg.month, startGreg.day),
        recurrence: const EventRecurrence(frequency: RecurrenceFrequency.yearly),
        createdAt: now,
        updatedAt: now,
      );

      // Target: 15 Ramadan 1445 AH
      const targetHijri = HijriDate(year: 1445, month: 9, day: 15);
      final targetGregorian = engine.toGregorian(targetHijri);
      final targetDate = CalendarDate(gregorian: targetGregorian, hijri: targetHijri);

      // Target with different Hijri day
      const wrongHijri = HijriDate(year: 1445, month: 9, day: 16);
      final wrongGregorian = engine.toGregorian(wrongHijri);
      final wrongDate = CalendarDate(gregorian: wrongGregorian, hijri: wrongHijri);

      expect(RecurrenceResolver.occursOnDate(event, targetDate), isTrue);
      expect(RecurrenceResolver.occursOnDate(event, wrongDate), isFalse);
    });
  });
}
