/// Repository interface and implementation for Islamic events resolution.
library;

import '../../../calendar_engine/calendar_engine.dart';
import '../domain/islamic_event.dart';
import 'islamic_events_seed.dart';

abstract interface class IslamicEventsRepository {
  /// All known canonical Islamic event definitions.
  List<IslamicEvent> getAllEvents();

  /// Resolves all Islamic events occurring in a given Hijri year.
  List<ResolvedIslamicEvent> resolveEventsForHijriYear(
    int hijriYear,
    HijriCalendarEngine engine,
  );

  /// Resolves all Islamic events that occur during a specific Gregorian month.
  List<ResolvedIslamicEvent> getEventsForGregorianMonth(
    int year,
    int month,
    HijriCalendarEngine engine,
  );

  /// Resolves any Islamic events occurring on a specific [CalendarDate].
  List<ResolvedIslamicEvent> getEventsForDate(
    CalendarDate date,
    HijriCalendarEngine engine,
  );

  /// Returns upcoming Islamic events starting on or after [today].
  List<ResolvedIslamicEvent> getUpcomingEvents(
    CalendarDate today,
    HijriCalendarEngine engine, {
    int limit = 5,
  });
}

class IslamicEventsRepositoryImpl implements IslamicEventsRepository {
  const IslamicEventsRepositoryImpl();

  @override
  List<IslamicEvent> getAllEvents() => IslamicEventsSeed.events;

  @override
  List<ResolvedIslamicEvent> resolveEventsForHijriYear(
    int hijriYear,
    HijriCalendarEngine engine,
  ) {
    final results = <ResolvedIslamicEvent>[];

    for (final event in IslamicEventsSeed.events) {
      final baseHijri = HijriDate(
        year: hijriYear,
        month: event.hijriMonth,
        day: event.hijriDay,
      );
      final baseGregorian = engine.toGregorian(baseHijri);

      for (var dayOffset = 0; dayOffset < event.durationDays; dayOffset++) {
        final gDate = baseGregorian.addDays(dayOffset);
        final hDate = engine.fromGregorian(gDate);

        results.add(
          ResolvedIslamicEvent(
            event: event,
            hijriDate: hDate,
            gregorianDate: gDate,
            dayIndex: dayOffset,
          ),
        );
      }
    }

    results.sort((a, b) => a.gregorianDate.compareTo(b.gregorianDate));
    return results;
  }

  @override
  List<ResolvedIslamicEvent> getEventsForGregorianMonth(
    int year,
    int month,
    HijriCalendarEngine engine,
  ) {
    // A solar month spans at most two Hijri years. Determine the Hijri years covering this month.
    final firstDay = GregorianDate(year, month, 1);
    final lastDay = GregorianDate(
      month == 12 ? year + 1 : year,
      month == 12 ? 1 : month + 1,
      1,
    ).subtractDays(1);

    final startHijri = engine.fromGregorian(firstDay);
    final endHijri = engine.fromGregorian(lastDay);

    final yearsToResolve = <int>{startHijri.year, endHijri.year};
    final candidates = <ResolvedIslamicEvent>[];

    for (final hYear in yearsToResolve) {
      candidates.addAll(resolveEventsForHijriYear(hYear, engine));
    }

    return candidates.where((occurrence) {
      final g = occurrence.gregorianDate;
      return g.year == year && g.month == month;
    }).toList()
      ..sort((a, b) => a.gregorianDate.compareTo(b.gregorianDate));
  }

  @override
  List<ResolvedIslamicEvent> getEventsForDate(
    CalendarDate date,
    HijriCalendarEngine engine,
  ) {
    final g = date.gregorian;
    final monthEvents = getEventsForGregorianMonth(g.year, g.month, engine);
    return monthEvents.where((e) => e.gregorianDate == g).toList();
  }

  @override
  List<ResolvedIslamicEvent> getUpcomingEvents(
    CalendarDate today,
    HijriCalendarEngine engine, {
    int limit = 5,
  }) {
    final currentHijriYear = today.hijri.year;
    final candidates = <ResolvedIslamicEvent>[
      ...resolveEventsForHijriYear(currentHijriYear, engine),
      ...resolveEventsForHijriYear(currentHijriYear + 1, engine),
    ];

    // Filter to only first day of events (or occurrences >= today)
    final upcoming = candidates
        .where((e) => e.gregorianDate.compareTo(today.gregorian) >= 0)
        .toList();

    // Group multi-day events so we show the start of each event
    final distinctByEvent = <String, ResolvedIslamicEvent>{};
    for (final occ in upcoming) {
      final key = '${occ.event.id}_${occ.hijriDate.year}';
      if (!distinctByEvent.containsKey(key)) {
        distinctByEvent[key] = occ;
      }
    }

    final sorted = distinctByEvent.values.toList()
      ..sort((a, b) => a.gregorianDate.compareTo(b.gregorianDate));

    return sorted.take(limit).toList();
  }
}
