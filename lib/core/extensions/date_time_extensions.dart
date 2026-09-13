/// Extension methods on [DateTime].
library;

extension DateTimeExtensions on DateTime {
  /// Returns true if this [DateTime] represents today in local time.
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Returns true if this [DateTime] represents yesterday.
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Returns true if this [DateTime] represents tomorrow.
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Returns a [DateTime] at midnight (start of day) in local time.
  DateTime get startOfDay => DateTime(year, month, day);

  /// Returns a [DateTime] at the last moment of the day in local time.
  DateTime get endOfDay =>
      DateTime(year, month, day, 23, 59, 59, 999, 999);

  /// Returns the number of days in the month of this [DateTime].
  int get daysInMonth => DateTime(year, month + 1, 0).day;

  /// Returns the first day of the month.
  DateTime get firstDayOfMonth => DateTime(year, month);

  /// Returns the last day of the month.
  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);

  /// Returns true if this date falls in the same month/year as [other].
  bool isSameMonthAs(DateTime other) =>
      year == other.year && month == other.month;

  /// Returns true if this date is the same calendar day as [other].
  bool isSameDayAs(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  /// Adds [months] months, clamping to valid day if needed.
  DateTime addMonths(int months) {
    var newMonth = month + months;
    var newYear = year;
    while (newMonth > 12) {
      newMonth -= 12;
      newYear++;
    }
    while (newMonth < 1) {
      newMonth += 12;
      newYear--;
    }
    final maxDay = DateTime(newYear, newMonth + 1, 0).day;
    return DateTime(newYear, newMonth, day.clamp(1, maxDay));
  }
}
