/// Domain model representing a time zone identifier and offset.
library;

import 'package:meta/meta.dart';

@immutable
final class TimeZone {
  const TimeZone({
    required this.identifier,
    required this.offsetInMinutes,
  });

  /// Current device's local timezone.
  factory TimeZone.current() {
    final now = DateTime.now();
    final offset = now.timeZoneOffset.inMinutes;
    return TimeZone(
      identifier: now.timeZoneName,
      offsetInMinutes: offset,
    );
  }

  /// UTC timezone instance.
  static const TimeZone utc = TimeZone(
    identifier: 'UTC',
    offsetInMinutes: 0,
  );

  final String identifier;
  final int offsetInMinutes;

  /// Time zone offset formatted as +HH:MM or -HH:MM.
  String get formattedOffset {
    final sign = offsetInMinutes >= 0 ? '+' : '-';
    final totalMinutes = offsetInMinutes.abs();
    final hours = (totalMinutes ~/ 60).toString().padLeft(2, '0');
    final minutes = (totalMinutes % 60).toString().padLeft(2, '0');
    return '$sign$hours:$minutes';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeZone &&
          runtimeType == other.runtimeType &&
          identifier == other.identifier &&
          offsetInMinutes == other.offsetInMinutes;

  @override
  int get hashCode => Object.hash(identifier, offsetInMinutes);

  @override
  String toString() => '$identifier ($formattedOffset)';
}
