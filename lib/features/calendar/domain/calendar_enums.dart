/// Domain enums for the calendar UI feature.
library;

/// Which calendar system is displayed as primary in the UI.
enum CalendarSystem {
  /// Gregorian calendar numbers are prominent; Hijri is secondary.
  gregorian,

  /// Hijri calendar numbers are prominent; Gregorian is secondary.
  hijri,
}

/// View presentation mode of the calendar screen.
enum CalendarViewMode {
  /// 6-week grid view showing the full month.
  month,

  /// Day view focusing on the selected date and its events/details.
  day,
}
