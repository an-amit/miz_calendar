import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/calendar_engine/calendar_engine.dart';
import 'package:miz_calendar/features/calendar/application/calendar_controller.dart';
import 'package:miz_calendar/features/calendar/domain/calendar_enums.dart';

void main() {
  group('CalendarNotifier', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state generates 42 grid cells and selects today', () {
      final state = container.read(calendarNotifierProvider);

      expect(state.gridDays.length, equals(42));
      expect(state.primarySystem, equals(CalendarSystem.gregorian));
      expect(state.viewMode, equals(CalendarViewMode.month));
      expect(state.adjustment, equals(HijriAdjustment.zero));

      final now = DateTime.now();
      expect(state.selectedDate.gregorian.year, equals(now.year));
      expect(state.selectedDate.gregorian.month, equals(now.month));
      expect(state.selectedDate.gregorian.day, equals(now.day));
    });

    test('nextMonth advances month and updates 42 grid days', () {
      final initialMonth =
          container.read(calendarNotifierProvider).displayedMonth;
      container.read(calendarNotifierProvider.notifier).nextMonth();

      final updatedState = container.read(calendarNotifierProvider);
      final expectedMonth =
          initialMonth.month == 12 ? 1 : initialMonth.month + 1;
      final expectedYear = initialMonth.month == 12
          ? initialMonth.year + 1
          : initialMonth.year;

      expect(updatedState.displayedMonth.year, equals(expectedYear));
      expect(updatedState.displayedMonth.month, equals(expectedMonth));
      expect(updatedState.gridDays.length, equals(42));
    });

    test('previousMonth steps back by one month', () {
      final initialMonth =
          container.read(calendarNotifierProvider).displayedMonth;
      container.read(calendarNotifierProvider.notifier).previousMonth();

      final updatedState = container.read(calendarNotifierProvider);
      final expectedMonth =
          initialMonth.month == 1 ? 12 : initialMonth.month - 1;
      final expectedYear =
          initialMonth.month == 1 ? initialMonth.year - 1 : initialMonth.year;

      expect(updatedState.displayedMonth.year, equals(expectedYear));
      expect(updatedState.displayedMonth.month, equals(expectedMonth));
    });

    test('selectDate updates selectedDate', () {
      final targetDate =
          container.read(calendarNotifierProvider).gridDays.first;
      container.read(calendarNotifierProvider.notifier).selectDate(targetDate);

      final state = container.read(calendarNotifierProvider);
      expect(state.selectedDate, equals(targetDate));
    });

    test('togglePrimaryCalendar toggles between gregorian and hijri', () {
      final notifier = container.read(calendarNotifierProvider.notifier);

      expect(
        container.read(calendarNotifierProvider).primarySystem,
        equals(CalendarSystem.gregorian),
      );

      notifier.togglePrimaryCalendar();
      expect(
        container.read(calendarNotifierProvider).primarySystem,
        equals(CalendarSystem.hijri),
      );

      notifier.togglePrimaryCalendar();
      expect(
        container.read(calendarNotifierProvider).primarySystem,
        equals(CalendarSystem.gregorian),
      );
    });

    test('setAdjustment updates adjustment and recalculates grid', () {
      container
          .read(calendarNotifierProvider.notifier)
          .setAdjustment(const HijriAdjustment(1));

      final state = container.read(calendarNotifierProvider);
      expect(state.adjustment.days, equals(1));
      expect(state.selectedDate.hijri.source, equals(HijriDateSource.userAdjusted));
    });

    test('goToToday resets to current day', () {
      container.read(calendarNotifierProvider.notifier)
        ..nextMonth()
        ..nextMonth()
        ..nextMonth()
        ..goToToday();

      final state = container.read(calendarNotifierProvider);
      final now = DateTime.now();

      expect(state.displayedMonth.year, equals(now.year));
      expect(state.displayedMonth.month, equals(now.month));
      expect(state.selectedDate.gregorian.day, equals(now.day));
    });
  });
}
