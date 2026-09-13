/// Notification service — Phase 7 will add the full implementation.
///
/// The interface is defined here so the rest of the application
/// depends on this abstraction, not on flutter_local_notifications directly.
library;

/// Types of notifications the app can send.
enum NotificationType {
  eventReminder,
  islamicEventReminder,
  dailyReminder,
  prayerReminder,
}

/// Contract for the notification service.
abstract interface class NotificationService {
  /// Request notification permissions from the OS.
  Future<bool> requestPermission();

  /// Cancel a notification by its ID.
  Future<void> cancel(int id);

  /// Cancel all scheduled notifications.
  Future<void> cancelAll();
}
