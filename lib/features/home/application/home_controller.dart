/// Controller for the Home screen dashboard.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../calendar_engine/calendar_engine.dart';
import 'home_state.dart';

class HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() {
    final now = DateTime.now();
    final todayGregorian = GregorianDate(now.year, now.month, now.day);
    const engine = UmmAlQuraEngine();
    final todayHijri = engine.fromGregorian(todayGregorian);

    final todayCalendarDate = CalendarDate(
      gregorian: todayGregorian,
      hijri: todayHijri,
    );

    final greeting = _resolveGreetingKey(now.hour);

    return HomeState(
      todayDate: todayCalendarDate,
      greetingKey: greeting,
    );
  }

  /// Refreshes today's date state (e.g. across midnight or app resume).
  void refresh() {
    state = build();
  }

  static String _resolveGreetingKey(int hour) {
    if (hour >= 4 && hour < 12) return 'greetingMorning';
    if (hour >= 12 && hour < 17) return 'greetingAfternoon';
    return 'greetingEvening';
  }
}

/// Riverpod provider for [HomeNotifier].
final homeNotifierProvider =
    NotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);
