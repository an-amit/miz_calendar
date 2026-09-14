/// Day boundary calculation method for Islamic events.
library;

enum EventDayBoundary {
  /// Strictly follows the civil/calculated calendar day (midnight to midnight).
  calendarDay,

  /// Observance begins at sunset (Maghrib) of the preceding evening.
  sunsetBased,

  /// Depends on local regional moon sighting confirmation.
  moonSightingBased,
}
