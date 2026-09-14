/// Card widget displaying a personal event with calendar type and recurrence badges.
library;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../localization/generated/app_localizations.dart';
import '../../domain/personal_event.dart';
import '../../domain/recurrence.dart';

class PersonalEventCard extends StatelessWidget {
  const PersonalEventCard({
    required this.event,
    this.onTap,
    this.onDelete,
    super.key,
  });

  final PersonalEvent event;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    final eventColor = event.colorValue != null
        ? Color(event.colorValue!)
        : kColorPersonalEvent;

    final dateFormatted = DateFormatter.formatFullDate(event.startDate);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Colored bar / icon
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: eventColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.event,
                  color: eventColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),

              // Title and details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      dateFormatted,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    if (event.description != null &&
                        event.description!.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        event.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],

                    const SizedBox(height: 8),

                    // Badges row
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        // Calendar System Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: event.calendarType == EventCalendarType.hijri
                                ? kColorSeed.withValues(alpha: 0.12)
                                : colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            event.calendarType == EventCalendarType.hijri
                                ? (l10n?.eventsHijri ?? 'Hijri')
                                : (l10n?.eventsGregorian ?? 'Gregorian'),
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: event.calendarType == EventCalendarType.hijri
                                  ? kColorSeed
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),

                        // Recurrence Badge
                        if (event.recurrence.isRecurring)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer
                                  .withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.repeat,
                                  size: 12,
                                  color: colorScheme.onSecondaryContainer,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  _recurrenceLabel(l10n, event.recurrence.frequency),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: colorScheme.onSecondaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              // Trailing action / arrow
              if (onDelete != null)
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  color: colorScheme.error,
                  tooltip: l10n?.eventsDelete ?? 'Delete',
                  onPressed: onDelete,
                )
              else
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: colorScheme.outline,
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _recurrenceLabel(
    AppLocalizations? l10n,
    RecurrenceFrequency freq,
  ) =>
      switch (freq) {
        RecurrenceFrequency.daily => l10n?.eventsRecurrenceDaily ?? 'Daily',
        RecurrenceFrequency.weekly => l10n?.eventsRecurrenceWeekly ?? 'Weekly',
        RecurrenceFrequency.monthly => l10n?.eventsRecurrenceMonthly ?? 'Monthly',
        RecurrenceFrequency.yearly => l10n?.eventsRecurrenceYearly ?? 'Yearly',
        RecurrenceFrequency.none => '',
      };
}
