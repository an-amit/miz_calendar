/// Application-wide constants.
library;

/// The minimum accessibility touch target size (dp).
const double kMinTouchTarget = 48;

/// The default animation duration for UI transitions.
const Duration kAnimationDuration = Duration(milliseconds: 200);

/// The Hijri adjustment range (inclusive).
const int kHijriAdjustmentMin = -2;
const int kHijriAdjustmentMax = 2;

/// Maximum days to look ahead when resolving upcoming events.
const int kUpcomingEventsDays = 30;

/// Number of weeks displayed in the calendar month grid.
const int kCalendarWeekRows = 6;

/// Days of the week count.
const int kDaysInWeek = 7;

/// The default notification channel ID.
const String kNotificationChannelId = 'miz_calendar_default';

/// Notification channel name.
const String kNotificationChannelName = 'Mīzān Calendar';

/// The daily reminder notification ID base.
const int kDailyReminderNotificationId = 100000;

/// Supported locales.
const List<String> kSupportedLanguageCodes = ['en', 'ar'];
