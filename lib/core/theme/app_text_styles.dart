/// Text style tokens — reference these instead of using raw TextStyle.
library;

import 'package:flutter/material.dart';

/// Heading text style for calendar month/year titles.
const TextStyle kTextStyleMonthTitle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.15,
);

/// Date number in calendar cell — Gregorian.
const TextStyle kTextStyleCalendarDayGregorian = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

/// Date number in calendar cell — Hijri (secondary, smaller).
const TextStyle kTextStyleCalendarDayHijri = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

/// Weekday header label.
const TextStyle kTextStyleWeekdayHeader = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.5,
);

/// Prayer time value.
const TextStyle kTextStylePrayerTime = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  fontFeatures: [FontFeature.tabularFigures()],
);

/// Event title in list.
const TextStyle kTextStyleEventTitle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
);

/// Home screen Gregorian date display.
const TextStyle kTextStyleHomeDateGregorian = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w300,
  letterSpacing: -0.5,
);

/// Home screen Hijri date display.
const TextStyle kTextStyleHomeDateHijri = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);
