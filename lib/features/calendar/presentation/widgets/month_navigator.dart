/// Header widget providing month navigation, dual-calendar titles, and a Today button.
library;

import 'package:flutter/material.dart';

import '../../../../calendar_engine/calendar_engine.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../domain/calendar_enums.dart';

class MonthNavigator extends StatelessWidget {
  const MonthNavigator({
    required this.displayedMonth,
    required this.primarySystem,
    required this.sampleHijriDate,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.onGoToToday,
    super.key,
  });

  final GregorianDate displayedMonth;
  final CalendarSystem primarySystem;
  final HijriDate sampleHijriDate;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final VoidCallback onGoToToday;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final gregorianTitle = DateFormatter.formatMonthYear(
      displayedMonth.toDateTime(),
    );
    final hijriTitle = '${sampleHijriDate.monthNameEn} ${sampleHijriDate.year} AH';

    final primaryTitle = primarySystem == CalendarSystem.gregorian
        ? gregorianTitle
        : hijriTitle;

    final secondaryTitle = primarySystem == CalendarSystem.gregorian
        ? hijriTitle
        : gregorianTitle;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          // Previous Month Button
          IconButton(
            icon: const Icon(Icons.chevron_left),
            tooltip: 'Previous Month',
            constraints: const BoxConstraints(
              minWidth: kMinTouchTarget,
              minHeight: kMinTouchTarget,
            ),
            onPressed: onPreviousMonth,
          ),

          // Titles in center
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  primaryTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  secondaryTitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Today jump button
          TextButton(
            onPressed: onGoToToday,
            child: const Text('Today'),
          ),

          // Next Month Button
          IconButton(
            icon: const Icon(Icons.chevron_right),
            tooltip: 'Next Month',
            constraints: const BoxConstraints(
              minWidth: kMinTouchTarget,
              minHeight: kMinTouchTarget,
            ),
            onPressed: onNextMonth,
          ),
        ],
      ),
    );
  }
}
