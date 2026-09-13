/// Domain model representing an absolute point on the timeline (UTC epoch).
library;

import 'package:meta/meta.dart';
import 'local_date.dart';
import 'local_date_time.dart';
import 'time_zone.dart';

@immutable
final class Instant implements Comparable<Instant> {
  const Instant.fromEpochMilliseconds(this.epochMilliseconds);

  /// Captures the current moment in time.
  factory Instant.now() =>
      Instant.fromEpochMilliseconds(DateTime.now().millisecondsSinceEpoch);

  final int epochMilliseconds;

  /// Converts this instant into a [LocalDateTime] within the provided [timeZone].
  LocalDateTime toLocalDateTime(TimeZone timeZone) {
    final localMs = epochMilliseconds + (timeZone.offsetInMinutes * 60 * 1000);
    final dt = DateTime.fromMillisecondsSinceEpoch(localMs, isUtc: true);
    return LocalDateTime(
      date: LocalDate(dt.year, dt.month, dt.day),
      hour: dt.hour,
      minute: dt.minute,
      second: dt.second,
      millisecond: dt.millisecond,
    );
  }

  @override
  int compareTo(Instant other) =>
      epochMilliseconds.compareTo(other.epochMilliseconds);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Instant &&
          runtimeType == other.runtimeType &&
          epochMilliseconds == other.epochMilliseconds;

  @override
  int get hashCode => epochMilliseconds.hashCode;

  @override
  String toString() =>
      DateTime.fromMillisecondsSinceEpoch(epochMilliseconds, isUtc: true)
          .toIso8601String();
}
