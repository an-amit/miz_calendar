/// Recurrence rules for personal events in Gregorian and Hijri calendars.
library;

import 'dart:convert';

import 'package:meta/meta.dart';

/// How frequently an event repeats.
enum RecurrenceFrequency {
  none,
  daily,
  weekly,
  monthly,
  yearly;

  static RecurrenceFrequency fromString(String? value) => switch (value?.toLowerCase()) {
        'daily' => RecurrenceFrequency.daily,
        'weekly' => RecurrenceFrequency.weekly,
        'monthly' => RecurrenceFrequency.monthly,
        'yearly' => RecurrenceFrequency.yearly,
        _ => RecurrenceFrequency.none,
      };
}

/// Defines recurrence behavior for personal events.
@immutable
class EventRecurrence {
  const EventRecurrence({
    this.frequency = RecurrenceFrequency.none,
    this.interval = 1,
    this.hijriMonth,
    this.hijriDay,
  });

  factory EventRecurrence.none() => const EventRecurrence();

  factory EventRecurrence.fromJson(Map<String, dynamic> json) => EventRecurrence(
        frequency: RecurrenceFrequency.fromString(json['frequency'] as String?),
        interval: (json['interval'] as num?)?.toInt() ?? 1,
        hijriMonth: (json['hijriMonth'] as num?)?.toInt(),
        hijriDay: (json['hijriDay'] as num?)?.toInt(),
      );

  factory EventRecurrence.fromJsonString(String? jsonString) {
    if (jsonString == null || jsonString.isEmpty) {
      return EventRecurrence.none();
    }
    try {
      final decoded = json.decode(jsonString) as Map<String, dynamic>;
      return EventRecurrence.fromJson(decoded);
    } catch (_) {
      return EventRecurrence.none();
    }
  }

  /// Frequency type.
  final RecurrenceFrequency frequency;

  /// Interval multiplier (e.g. 1 = every week, 2 = every two weeks).
  final int interval;

  /// Optional Hijri month (1–12) for yearly Hijri recurrence.
  final int? hijriMonth;

  /// Optional Hijri day (1–30) for monthly or yearly Hijri recurrence.
  final int? hijriDay;

  bool get isRecurring => frequency != RecurrenceFrequency.none;

  Map<String, dynamic> toJson() => {
        'frequency': frequency.name,
        'interval': interval,
        if (hijriMonth != null) 'hijriMonth': hijriMonth,
        if (hijriDay != null) 'hijriDay': hijriDay,
      };

  String toJsonString() => json.encode(toJson());

  EventRecurrence copyWith({
    RecurrenceFrequency? frequency,
    int? interval,
    int? hijriMonth,
    int? hijriDay,
  }) =>
      EventRecurrence(
        frequency: frequency ?? this.frequency,
        interval: interval ?? this.interval,
        hijriMonth: hijriMonth ?? this.hijriMonth,
        hijriDay: hijriDay ?? this.hijriDay,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventRecurrence &&
          runtimeType == other.runtimeType &&
          frequency == other.frequency &&
          interval == other.interval &&
          hijriMonth == other.hijriMonth &&
          hijriDay == other.hijriDay;

  @override
  int get hashCode => Object.hash(frequency, interval, hijriMonth, hijriDay);
}
