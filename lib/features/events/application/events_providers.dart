/// Riverpod providers for Islamic occasions and personal events.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../calendar_engine/calendar_engine.dart';
import '../../../database/app_database.dart';
import '../../calendar/application/calendar_controller.dart';
import '../data/event_repository.dart';
import '../data/islamic_events_repository.dart';
import '../domain/islamic_event.dart';
import '../domain/personal_event.dart';
import 'events_controller.dart';
import 'recurrence_resolver.dart';

/// Provider for the singleton Islamic events repository.
final islamicEventsRepositoryProvider = Provider<IslamicEventsRepository>(
  (ref) => const IslamicEventsRepositoryImpl(),
);

/// Provider for the personal events repository backed by Drift SQLite.
final eventRepositoryProvider = Provider<EventRepository>(
  (ref) {
    final db = ref.watch(appDatabaseProvider);
    return EventRepositoryImpl(db.eventsDao);
  },
);

/// Aggregated events for a specific calendar day.
class DayEventsSummary {
  const DayEventsSummary({
    required this.selectedDate,
    required this.islamicEvents,
    required this.personalEvents,
  });

  final CalendarDate selectedDate;
  final List<ResolvedIslamicEvent> islamicEvents;
  final List<PersonalEvent> personalEvents;

  bool get isEmpty => islamicEvents.isEmpty && personalEvents.isEmpty;
  int get totalCount => islamicEvents.length + personalEvents.length;
}

/// Provider resolving all events occurring on the currently selected calendar date.
final eventsForSelectedDateProvider = Provider<DayEventsSummary>((ref) {
  final calendarState = ref.watch(calendarNotifierProvider);
  final selectedDate = calendarState.selectedDate;

  // Resolve calculation engine
  final engine = _resolveActiveEngine(
    calendarState.engineId,
    calendarState.adjustment,
  );

  // 1. Islamic occasions on this date
  final islamicRepo = ref.watch(islamicEventsRepositoryProvider);
  final islamicEvents = islamicRepo.getEventsForDate(selectedDate, engine);

  // 2. Personal events on this date
  final personalEventsAsync = ref.watch(eventsNotifierProvider);
  final personalEvents = personalEventsAsync.maybeWhen(
    data: (events) => events
        .where((e) => RecurrenceResolver.occursOnDate(e, selectedDate, engine: engine))
        .toList(),
    orElse: () => <PersonalEvent>[],
  );

  return DayEventsSummary(
    selectedDate: selectedDate,
    islamicEvents: islamicEvents,
    personalEvents: personalEvents,
  );
});

/// Grid-level indicators for the active 42-day month view.
class MonthGridIndicators {
  const MonthGridIndicators({
    required this.personalEventDates,
    required this.islamicEventDates,
  });

  final Set<GregorianDate> personalEventDates;
  final Set<GregorianDate> islamicEventDates;

  bool hasPersonalEvent(GregorianDate date) => personalEventDates.contains(date);
  bool hasIslamicEvent(GregorianDate date) => islamicEventDates.contains(date);
}

/// Provider computing event presence for all 42 cells in the month grid.
final monthEventIndicatorsProvider = Provider<MonthGridIndicators>((ref) {
  final calendarState = ref.watch(calendarNotifierProvider);
  final gridDays = calendarState.gridDays;

  final engine = _resolveActiveEngine(
    calendarState.engineId,
    calendarState.adjustment,
  );

  // Islamic events for this month
  final islamicRepo = ref.watch(islamicEventsRepositoryProvider);
  final displayedMonth = calendarState.displayedMonth;
  final monthIslamicEvents = islamicRepo.getEventsForGregorianMonth(
    displayedMonth.year,
    displayedMonth.month,
    engine,
  );

  // If the 42-cell grid spans adjacent months, also fetch them
  final firstGridDate = gridDays.first.gregorian;
  final lastGridDate = gridDays.last.gregorian;

  final allIslamicForGrid = <ResolvedIslamicEvent>[...monthIslamicEvents];
  if (firstGridDate.month != displayedMonth.month) {
    allIslamicForGrid.addAll(
      islamicRepo.getEventsForGregorianMonth(
        firstGridDate.year,
        firstGridDate.month,
        engine,
      ),
    );
  }
  if (lastGridDate.month != displayedMonth.month) {
    allIslamicForGrid.addAll(
      islamicRepo.getEventsForGregorianMonth(
        lastGridDate.year,
        lastGridDate.month,
        engine,
      ),
    );
  }

  final islamicSet = allIslamicForGrid.map((e) => e.gregorianDate).toSet();

  // Personal events matching any of the 42 cells
  final personalEventsAsync = ref.watch(eventsNotifierProvider);
  final personalSet = <GregorianDate>{};

  personalEventsAsync.whenData((events) {
    for (final day in gridDays) {
      for (final event in events) {
        if (RecurrenceResolver.occursOnDate(event, day, engine: engine)) {
          personalSet.add(day.gregorian);
          break; // move to next day
        }
      }
    }
  });

  return MonthGridIndicators(
    personalEventDates: personalSet,
    islamicEventDates: islamicSet,
  );
});

/// A unified item for upcoming event previews.
class UpcomingEventItem {
  const UpcomingEventItem({
    required this.title,
    required this.subtitle,
    required this.gregorianDate,
    required this.hijriDate,
    required this.isIslamic,
    this.isMajor = false,
    this.personalEvent,
    this.islamicEvent,
  });

  final String title;
  final String subtitle;
  final GregorianDate gregorianDate;
  final HijriDate hijriDate;
  final bool isIslamic;
  final bool isMajor;
  final PersonalEvent? personalEvent;
  final ResolvedIslamicEvent? islamicEvent;
}

/// Provider supplying the next upcoming events across personal and Islamic categories.
final upcomingEventsSummaryProvider = Provider<List<UpcomingEventItem>>((ref) {
  final calendarState = ref.watch(calendarNotifierProvider);
  final today = calendarState.selectedDate;
  final engine = _resolveActiveEngine(
    calendarState.engineId,
    calendarState.adjustment,
  );

  final items = <UpcomingEventItem>[];

  // 1. Upcoming Islamic occasions
  final islamicRepo = ref.watch(islamicEventsRepositoryProvider);
  final upcomingIslamic = islamicRepo.getUpcomingEvents(today, engine);

  for (final resolved in upcomingIslamic) {
    items.add(
      UpcomingEventItem(
        title: resolved.event.nameKey,
        subtitle: resolved.hijriDate.formatEn(),
        gregorianDate: resolved.gregorianDate,
        hijriDate: resolved.hijriDate,
        isIslamic: true,
        isMajor: resolved.event.isMajor,
        islamicEvent: resolved,
      ),
    );
  }

  // 2. Upcoming Personal events (project next 60 days)
  final personalEvents = ref.watch(eventsNotifierProvider).valueOrNull ?? [];
  for (var i = 0; i < 60; i++) {
    final g = today.gregorian.addDays(i);
    final h = engine.fromGregorian(g);
    final candidateDate = CalendarDate(gregorian: g, hijri: h);

    for (final ev in personalEvents) {
      if (RecurrenceResolver.occursOnDate(ev, candidateDate, engine: engine)) {
          items.add(
            UpcomingEventItem(
              title: ev.title,
              subtitle: ev.description ?? (ev.calendarType == EventCalendarType.hijri ? h.formatEn() : '${g.year}-${g.month.toString().padLeft(2, '0')}-${g.day.toString().padLeft(2, '0')}'),
              gregorianDate: g,
              hijriDate: h,
              isIslamic: false,
              personalEvent: ev,
            ),
          );
        }
      }
    }

  return (items..sort((a, b) => a.gregorianDate.compareTo(b.gregorianDate)))
      .take(6)
      .toList();
});

HijriCalendarEngine _resolveActiveEngine(
  String engineId,
  HijriAdjustment adjustment,
) {
  final base = switch (engineId) {
    TabularCivilEngine.engineId => const TabularCivilEngine(),
    TabularAstronomicalEngine.engineId => const TabularAstronomicalEngine(),
    _ => const UmmAlQuraEngine(),
  };

  if (adjustment.hasAdjustment) {
    return AdjustedEngine(baseEngine: base, adjustment: adjustment);
  }
  return base;
}
