/// Widget presenting the selected day view with expanded dual-calendar details.
library;

import 'package:flutter/material.dart';

import '../../../../calendar_engine/calendar_engine.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/date_formatter.dart';

class DayViewWidget extends StatelessWidget {
  const DayViewWidget({
    required this.selectedDate,
    super.key,
    this.onAddEventPressed,
  });

  final CalendarDate selectedDate;
  final VoidCallback? onAddEventPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final gregorian = selectedDate.gregorian;
    final hijri = selectedDate.hijri;

    final gregorianFull = DateFormatter.formatFullDate(
      gregorian.toDateTime(),
    );
    final hijriEn = hijri.formatEn();
    final hijriAr = hijri.formatAr();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Gregorian full line
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 20,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    gregorianFull,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Hijri full line (English + Arabic)
            Row(
              children: [
                const Icon(
                  Icons.nights_stay_outlined,
                  size: 20,
                  color: kColorSeed,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hijriEn,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: kColorSeed,
                        ),
                      ),
                      Text(
                        hijriAr,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(height: 24),

            // Selected Day Agenda / Event List preview
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Events & Reminders',
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (onAddEventPressed != null)
                  TextButton.icon(
                    onPressed: onAddEventPressed,
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text('Add'),
                  ),
              ],
            ),

            const SizedBox(height: 4),

            // Empty state placeholder (Phase 4 will populate with real Drift events)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.event_note_outlined,
                    size: 18,
                    color: colorScheme.outline,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'No events scheduled for this day',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
