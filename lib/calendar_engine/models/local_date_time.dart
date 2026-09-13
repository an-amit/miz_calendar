/// Domain model representing a local civil date and time (without timezone offset).
library;

import 'package:meta/meta.dart';
import 'local_date.dart';

@immutable
final class LocalDateTime implements Comparable<LocalDateTime> {
  const LocalDateTime({
    required this.date,
    required this.hour,
    required this.minute,
    this.second = 0,
    this.millisecond = 0,
  })  : assert(hour >= 0 && hour <= 23, 'Hour must be 0..23'),
        assert(minute >= 0 && minute <= 59, 'Minute must be 0..59'),
        assert(second >= 0 && second <= 59, 'Second must be 0..59'),
        assert(millisecond >= 0 && millisecond <= 999, 'Millisecond must be 0..999');

  final LocalDate date;
  final int hour;
  final int minute;
  final int second;
  final int millisecond;

  @override
  int compareTo(LocalDateTime other) {
    final dateComp = date.compareTo(other.date);
    if (dateComp != 0) return dateComp;
    if (hour != other.hour) return hour.compareTo(other.hour);
    if (minute != other.minute) return minute.compareTo(other.minute);
    if (second != other.second) return second.compareTo(other.second);
    return millisecond.compareTo(other.millisecond);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalDateTime &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          hour == other.hour &&
          minute == other.minute &&
          second == other.second &&
          millisecond == other.millisecond;

  @override
  int get hashCode => Object.hash(date, hour, minute, second, millisecond);

  @override
  String toString() =>
      '$date ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
}
