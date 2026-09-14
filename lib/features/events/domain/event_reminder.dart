/// Domain entity representing a reminder alert for a personal event.
library;

import 'package:meta/meta.dart';

import 'personal_event.dart';

@immutable
class EventReminder {
  const EventReminder({
    required this.id,
    required this.eventId,
    required this.minutesBefore,
    required this.notificationId,
    this.isEnabled = true,
  });

  /// Unique UUID for the reminder.
  final String id;

  /// ID of the parent [PersonalEvent].
  final String eventId;

  /// Minutes prior to start time when alert fires (0 = at time of event).
  final int minutesBefore;

  /// Integer notification ID passed to local notification plugin.
  final int notificationId;

  /// Whether this reminder is currently active.
  final bool isEnabled;

  EventReminder copyWith({
    String? id,
    String? eventId,
    int? minutesBefore,
    int? notificationId,
    bool? isEnabled,
  }) =>
      EventReminder(
        id: id ?? this.id,
        eventId: eventId ?? this.eventId,
        minutesBefore: minutesBefore ?? this.minutesBefore,
        notificationId: notificationId ?? this.notificationId,
        isEnabled: isEnabled ?? this.isEnabled,
      );
}
