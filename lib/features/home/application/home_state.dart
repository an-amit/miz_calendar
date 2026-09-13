/// State model for the Home screen dashboard.
library;

import 'package:meta/meta.dart';

import '../../../calendar_engine/calendar_engine.dart';

@immutable
final class HomeState {
  const HomeState({
    required this.todayDate,
    required this.greetingKey,
  });

  /// The current day's dual calendar representation.
  final CalendarDate todayDate;

  /// Localization key for time-of-day greeting (e.g. 'greetingMorning').
  final String greetingKey;

  HomeState copyWith({
    CalendarDate? todayDate,
    String? greetingKey,
  }) =>
      HomeState(
        todayDate: todayDate ?? this.todayDate,
        greetingKey: greetingKey ?? this.greetingKey,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeState &&
          runtimeType == other.runtimeType &&
          todayDate == other.todayDate &&
          greetingKey == other.greetingKey;

  @override
  int get hashCode => Object.hash(todayDate, greetingKey);
}
