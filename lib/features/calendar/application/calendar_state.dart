/// Immutable state representation for the Calendar UI.
library;

import 'package:meta/meta.dart';

import '../../../calendar_engine/calendar_engine.dart';
import '../domain/calendar_enums.dart';

@immutable
final class CalendarState {
  const CalendarState({
    required this.selectedDate,
    required this.displayedMonth,
    required this.gridDays,
    this.primarySystem = CalendarSystem.gregorian,
    this.viewMode = CalendarViewMode.month,
    this.adjustment = HijriAdjustment.zero,
    this.engineId = UmmAlQuraEngine.engineId,
  });

  /// The day currently selected by the user.
  final CalendarDate selectedDate;

  /// The first day of the Gregorian month currently in view.
  final GregorianDate displayedMonth;

  /// The 42-day (6-week) sequence of days displayed in the month grid.
  final List<CalendarDate> gridDays;

  /// Which calendar is prominently displayed.
  final CalendarSystem primarySystem;

  /// Current visual mode (month grid vs day view).
  final CalendarViewMode viewMode;

  /// Active user adjustment applied to Hijri calculations.
  final HijriAdjustment adjustment;

  /// ID of the active Hijri calculation engine.
  final String engineId;

  CalendarState copyWith({
    CalendarDate? selectedDate,
    GregorianDate? displayedMonth,
    List<CalendarDate>? gridDays,
    CalendarSystem? primarySystem,
    CalendarViewMode? viewMode,
    HijriAdjustment? adjustment,
    String? engineId,
  }) =>
      CalendarState(
        selectedDate: selectedDate ?? this.selectedDate,
        displayedMonth: displayedMonth ?? this.displayedMonth,
        gridDays: gridDays ?? this.gridDays,
        primarySystem: primarySystem ?? this.primarySystem,
        viewMode: viewMode ?? this.viewMode,
        adjustment: adjustment ?? this.adjustment,
        engineId: engineId ?? this.engineId,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarState &&
          runtimeType == other.runtimeType &&
          selectedDate == other.selectedDate &&
          displayedMonth == other.displayedMonth &&
          primarySystem == other.primarySystem &&
          viewMode == other.viewMode &&
          adjustment == other.adjustment &&
          engineId == other.engineId;

  @override
  int get hashCode => Object.hash(
        selectedDate,
        displayedMonth,
        primarySystem,
        viewMode,
        adjustment,
        engineId,
      );
}
