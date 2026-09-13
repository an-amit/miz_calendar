/// Date formatting utilities.
///
/// All date-to-string conversions go through this utility so that
/// locale-specific and calendar-specific formatting is centralised.
library;

import 'package:intl/intl.dart';

/// Formats Gregorian dates for display.
abstract final class DateFormatter {
  DateFormatter._();

  /// Format a [DateTime] as 'Monday, 11 September 2026'.
  static String formatFullDate(DateTime date, {String locale = 'en'}) =>
      DateFormat.yMMMMEEEEd(locale).format(date);

  /// Format a [DateTime] as '11 September 2026'.
  static String formatLongDate(DateTime date, {String locale = 'en'}) =>
      DateFormat.yMMMMd(locale).format(date);

  /// Format a [DateTime] as 'Sep 11, 2026'.
  static String formatMediumDate(DateTime date, {String locale = 'en'}) =>
      DateFormat.yMMMd(locale).format(date);

  /// Format a [DateTime] as '11/09/2026'.
  static String formatShortDate(DateTime date, {String locale = 'en'}) =>
      DateFormat.yMd(locale).format(date);

  /// Format a [DateTime] as 'September 2026'.
  static String formatMonthYear(DateTime date, {String locale = 'en'}) =>
      DateFormat.yMMMM(locale).format(date);

  /// Format a [DateTime] as 'Friday'.
  static String formatWeekday(DateTime date, {String locale = 'en'}) =>
      DateFormat.EEEE(locale).format(date);

  /// Format a [DateTime] as 'Mon'.
  static String formatWeekdayShort(DateTime date, {String locale = 'en'}) =>
      DateFormat.E(locale).format(date);

  /// Format a [DateTime] as '16:42' (24-hour).
  static String formatTime24h(DateTime date) =>
      DateFormat.Hm().format(date);

  /// Format a [DateTime] as '4:42 PM' (12-hour with AM/PM).
  static String formatTime12h(DateTime date, {String locale = 'en'}) =>
      DateFormat.jm(locale).format(date);
}
