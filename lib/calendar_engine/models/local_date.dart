/// Domain model representing a generic local calendar day (year, month, day).
library;

import 'package:meta/meta.dart';

@immutable
final class LocalDate implements Comparable<LocalDate> {
  const LocalDate(this.year, this.month, this.day)
      : assert(month >= 1 && month <= 12, 'Month must be between 1 and 12'),
        assert(day >= 1 && day <= 31, 'Day must be between 1 and 31');

  final int year;
  final int month;
  final int day;

  @override
  int compareTo(LocalDate other) {
    if (year != other.year) return year.compareTo(other.year);
    if (month != other.month) return month.compareTo(other.month);
    return day.compareTo(other.day);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalDate &&
          runtimeType == other.runtimeType &&
          year == other.year &&
          month == other.month &&
          day == other.day;

  @override
  int get hashCode => Object.hash(year, month, day);

  @override
  String toString() =>
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
}
