/// Centralized application logger.
///
/// All logging must go through [AppLogger] so that:
/// - log levels are consistent
/// - sensitive data is never accidentally logged
/// - the underlying log sink can be swapped without touching callsites
library;

// ignore_for_file: avoid_print

/// Log levels.
enum LogLevel { verbose, debug, info, warning, error }

/// Centralized logger — wraps print() for now; swap sink as needed.
class AppLogger {
  AppLogger._();

  static LogLevel _minimumLevel = LogLevel.debug;

  /// Set the minimum log level. Messages below this level are suppressed.
  // ignore: avoid_setters_without_getters
  static set minimumLevel(LogLevel level) => _minimumLevel = level;

  /// Log verbose detail (highest verbosity).
  static void v(String tag, String message) =>
      _log(LogLevel.verbose, tag, message);

  /// Log a debug message.
  static void d(String tag, String message) =>
      _log(LogLevel.debug, tag, message);

  /// Log an informational message.
  static void i(String tag, String message) =>
      _log(LogLevel.info, tag, message);

  /// Log a warning.
  static void w(String tag, String message, [Object? cause]) =>
      _log(LogLevel.warning, tag, message, cause);

  /// Log an error.
  static void e(String tag, String message, [Object? cause]) =>
      _log(LogLevel.error, tag, message, cause);

  static void _log(
    LogLevel level,
    String tag,
    String message, [
    Object? cause,
  ]) {
    if (level.index < _minimumLevel.index) return;
    final prefix = _prefix(level);
    final timestamp = DateTime.now().toIso8601String();
    final output = '$prefix [$timestamp] [$tag] $message';
    print(output);
    if (cause != null) {
      print('  ↳ Caused by: $cause');
    }
  }

  static String _prefix(LogLevel level) => switch (level) {
        LogLevel.verbose => '🔍 V',
        LogLevel.debug => '🐛 D',
        LogLevel.info => 'ℹ️  I',
        LogLevel.warning => '⚠️  W',
        LogLevel.error => '🔴 E',
      };
}
