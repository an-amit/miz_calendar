/// Application-level exception hierarchy.
///
/// All domain-layer exceptions must extend [AppException].
/// Presentation code must never catch raw third-party exceptions.
library;

/// Base class for all application exceptions.
sealed class AppException implements Exception {
  const AppException(this.message, {this.cause});

  /// Human-readable description (for logging; not for the user).
  final String message;

  /// The underlying cause, if any.
  final Object? cause;

  /// Human-readable class name without relying on runtimeType.
  String get name => switch (this) {
        CalendarCalculationException() => 'CalendarCalculationException',
        InvalidHijriDateException() => 'InvalidHijriDateException',
        DatabaseException() => 'DatabaseException',
        LocationException() => 'LocationException',
        NotificationException() => 'NotificationException',
        PrayerCalculationException() => 'PrayerCalculationException',
        NetworkException() => 'NetworkException',
      };

  @override
  String toString() {
    final causeStr = cause != null ? ' (caused by: $cause)' : '';
    return '$name: $message$causeStr';
  }
}

/// Thrown when a Hijri or Gregorian calendar calculation fails.
final class CalendarCalculationException extends AppException {
  const CalendarCalculationException(super.message, {super.cause});
}

/// Thrown when a Hijri date is outside the supported range or is invalid.
final class InvalidHijriDateException extends AppException {
  const InvalidHijriDateException(super.message, {super.cause});
}

/// Thrown when a database operation fails.
final class DatabaseException extends AppException {
  const DatabaseException(super.message, {super.cause});
}

/// Thrown when location permission is denied or GPS is unavailable.
final class LocationException extends AppException {
  const LocationException(super.message, {super.cause});
}

/// Thrown when a notification cannot be scheduled.
final class NotificationException extends AppException {
  const NotificationException(super.message, {super.cause});
}

/// Thrown when prayer time calculation fails.
final class PrayerCalculationException extends AppException {
  const PrayerCalculationException(super.message, {super.cause});
}

/// Thrown when network request fails (non-critical for MVP).
final class NetworkException extends AppException {
  const NetworkException(super.message, {super.cause});
}
