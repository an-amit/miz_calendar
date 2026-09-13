/// Controller managing the Calendar UI state and navigation.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../calendar_engine/calendar_engine.dart';
import '../domain/calendar_enums.dart';
import 'calendar_state.dart';

class CalendarNotifier extends Notifier<CalendarState> {
  @override
  CalendarState build() {
    final now = DateTime.now();
    final todayGregorian = GregorianDate(now.year, now.month, now.day);
    final displayedMonth = GregorianDate(now.year, now.month, 1);
    final engine = _resolveEngine(
      UmmAlQuraEngine.engineId,
      HijriAdjustment.zero,
    );
    final todayHijri = engine.fromGregorian(todayGregorian);
    final todayCalendarDate = CalendarDate(
      gregorian: todayGregorian,
      hijri: todayHijri,
    );

    final grid = _generateMonthGrid(displayedMonth, engine);

    return CalendarState(
      selectedDate: todayCalendarDate,
      displayedMonth: displayedMonth,
      gridDays: grid,
    );
  }

  /// Selects a specific [CalendarDate]. If the day belongs to a different
  /// month than currently displayed, smoothly navigates the view to that month.
  void selectDate(CalendarDate date) {
    if (date.gregorian.year != state.displayedMonth.year ||
        date.gregorian.month != state.displayedMonth.month) {
      final newMonth = GregorianDate(
        date.gregorian.year,
        date.gregorian.month,
        1,
      );
      final engine = _resolveEngine(state.engineId, state.adjustment);
      final newGrid = _generateMonthGrid(newMonth, engine);

      state = state.copyWith(
        selectedDate: date,
        displayedMonth: newMonth,
        gridDays: newGrid,
      );
    } else {
      state = state.copyWith(selectedDate: date);
    }
  }

  /// Advances the displayed view by one month.
  void nextMonth() {
    final currentYear = state.displayedMonth.year;
    final currentMonth = state.displayedMonth.month;
    final nextYear = currentMonth == 12 ? currentYear + 1 : currentYear;
    final nextMonth = currentMonth == 12 ? 1 : currentMonth + 1;

    final newMonth = GregorianDate(nextYear, nextMonth, 1);
    final engine = _resolveEngine(state.engineId, state.adjustment);
    final newGrid = _generateMonthGrid(newMonth, engine);

    state = state.copyWith(
      displayedMonth: newMonth,
      gridDays: newGrid,
    );
  }

  /// Steps the displayed view back by one month.
  void previousMonth() {
    final currentYear = state.displayedMonth.year;
    final currentMonth = state.displayedMonth.month;
    final prevYear = currentMonth == 1 ? currentYear - 1 : currentYear;
    final prevMonth = currentMonth == 1 ? 12 : currentMonth - 1;

    final newMonth = GregorianDate(prevYear, prevMonth, 1);
    final engine = _resolveEngine(state.engineId, state.adjustment);
    final newGrid = _generateMonthGrid(newMonth, engine);

    state = state.copyWith(
      displayedMonth: newMonth,
      gridDays: newGrid,
    );
  }

  /// Jumps back to today's date and month.
  void goToToday() {
    final now = DateTime.now();
    final todayGregorian = GregorianDate(now.year, now.month, now.day);
    final targetMonth = GregorianDate(now.year, now.month, 1);
    final engine = _resolveEngine(state.engineId, state.adjustment);
    final todayCalendarDate = CalendarDate(
      gregorian: todayGregorian,
      hijri: engine.fromGregorian(todayGregorian),
    );

    final newGrid = _generateMonthGrid(targetMonth, engine);

    state = state.copyWith(
      selectedDate: todayCalendarDate,
      displayedMonth: targetMonth,
      gridDays: newGrid,
    );
  }

  /// Toggles between Gregorian primary and Hijri primary modes.
  void togglePrimaryCalendar() {
    final next = state.primarySystem == CalendarSystem.gregorian
        ? CalendarSystem.hijri
        : CalendarSystem.gregorian;
    state = state.copyWith(primarySystem: next);
  }

  /// Sets the primary calendar system explicitly.
  void setPrimaryCalendar(CalendarSystem system) {
    if (state.primarySystem != system) {
      state = state.copyWith(primarySystem: system);
    }
  }

  /// Sets the active calendar view presentation mode.
  void setViewMode(CalendarViewMode mode) {
    if (state.viewMode != mode) {
      state = state.copyWith(viewMode: mode);
    }
  }

  /// Updates the Hijri adjustment (±2 days) and re-evaluates all displayed dates.
  void setAdjustment(HijriAdjustment adjustment) {
    if (state.adjustment != adjustment) {
      final engine = _resolveEngine(state.engineId, adjustment);
      final newSelectedDate = CalendarDate(
        gregorian: state.selectedDate.gregorian,
        hijri: engine.fromGregorian(state.selectedDate.gregorian),
      );
      final newGrid = _generateMonthGrid(state.displayedMonth, engine);

      state = state.copyWith(
        adjustment: adjustment,
        selectedDate: newSelectedDate,
        gridDays: newGrid,
      );
    }
  }

  /// Changes the underlying calculation engine.
  void setEngine(String engineId) {
    if (state.engineId != engineId) {
      final engine = _resolveEngine(engineId, state.adjustment);
      final newSelectedDate = CalendarDate(
        gregorian: state.selectedDate.gregorian,
        hijri: engine.fromGregorian(state.selectedDate.gregorian),
      );
      final newGrid = _generateMonthGrid(state.displayedMonth, engine);

      state = state.copyWith(
        engineId: engineId,
        selectedDate: newSelectedDate,
        gridDays: newGrid,
      );
    }
  }

  /// Resolves the engine instance and decorates it with [AdjustedEngine] if needed.
  static HijriCalendarEngine _resolveEngine(
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

  /// Generates a fixed 42-cell (6 weeks x 7 days) calendar month grid.
  /// Sunday is the first column (index 0).
  static List<CalendarDate> _generateMonthGrid(
    GregorianDate monthFirstDay,
    HijriCalendarEngine engine,
  ) {
    // Determine weekday of month's 1st day (1=Mon, 7=Sun in ISO)
    // Sunday-first grid: Sun=0, Mon=1, Tue=2, Wed=3, Thu=4, Fri=5, Sat=6
    final firstWeekday = monthFirstDay.weekday; // 1..7
    final sundayOffset = firstWeekday % 7; // Sunday (7) -> 0, Monday (1) -> 1, etc.

    // The grid starts on the Sunday on or before the 1st of the month
    final gridStartDate = monthFirstDay.subtractDays(sundayOffset);

    return List.generate(42, (index) {
      final gregorian = gridStartDate.addDays(index);
      final hijri = engine.fromGregorian(gregorian);
      return CalendarDate(
        gregorian: gregorian,
        hijri: hijri,
      );
    });
  }
}

/// Riverpod provider for the [CalendarNotifier].
final calendarNotifierProvider =
    NotifierProvider<CalendarNotifier, CalendarState>(CalendarNotifier.new);
