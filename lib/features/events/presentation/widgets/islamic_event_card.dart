/// Card widget displaying an Islamic occasion with dual calendar dates.
library;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../localization/generated/app_localizations.dart';
import '../../domain/islamic_event.dart';

class IslamicEventCard extends StatelessWidget {
  const IslamicEventCard({
    required this.event,
    this.resolved,
    super.key,
  });

  final IslamicEvent event;
  final ResolvedIslamicEvent? resolved;

  static String getLocalizedTitle(BuildContext context, String key) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return key;

    return switch (key) {
      'eventIslamicNewYear' => l10n.eventIslamicNewYear,
      'eventAshura' => l10n.eventAshura,
      'eventMawlidAlNabi' => l10n.eventMawlidAlNabi,
      'eventIsraWalMiraj' => l10n.eventIsraWalMiraj,
      'eventNisfShaban' => l10n.eventNisfShaban,
      'eventRamadan' => l10n.eventRamadan,
      'eventLaylatAlQadr' => l10n.eventLaylatAlQadr,
      'eventEidAlFitr' => l10n.eventEidAlFitr,
      'eventDayOfTarwiyah' => l10n.eventDayOfTarwiyah,
      'eventDayOfArafah' => l10n.eventDayOfArafah,
      'eventEidAlAdha' => l10n.eventEidAlAdha,
      'eventDaysOfTashreeq' => l10n.eventDaysOfTashreeq,
      _ => key,
    };
  }

  static String getLocalizedDescription(BuildContext context, String key) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return '';

    return switch (key) {
      'eventIslamicNewYearDesc' => l10n.eventIslamicNewYearDesc,
      'eventAshuraDesc' => l10n.eventAshuraDesc,
      'eventMawlidAlNabiDesc' => l10n.eventMawlidAlNabiDesc,
      'eventIsraWalMirajDesc' => l10n.eventIsraWalMirajDesc,
      'eventNisfShabanDesc' => l10n.eventNisfShabanDesc,
      'eventRamadanDesc' => l10n.eventRamadanDesc,
      'eventLaylatAlQadrDesc' => l10n.eventLaylatAlQadrDesc,
      'eventEidAlFitrDesc' => l10n.eventEidAlFitrDesc,
      'eventDayOfTarwiyahDesc' => l10n.eventDayOfTarwiyahDesc,
      'eventDayOfArafahDesc' => l10n.eventDayOfArafahDesc,
      'eventEidAlAdhaDesc' => l10n.eventEidAlAdhaDesc,
      'eventDaysOfTashreeqDesc' => l10n.eventDaysOfTashreeqDesc,
      _ => '',
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    final title = getLocalizedTitle(context, event.nameKey);
    final description = getLocalizedDescription(context, event.descriptionKey);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: event.isMajor
              ? kColorIslamicEvent.withValues(alpha: 0.5)
              : colorScheme.outlineVariant.withValues(alpha: 0.4),
          width: event.isMajor ? 1.5 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: kColorIslamicEvent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    event.isMajor
                        ? Icons.stars_rounded
                        : Icons.nights_stay_outlined,
                    color: kColorIslamicEvent,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),

                // Title & Badges
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Hijri & Gregorian Date
                      if (resolved != null) ...[
                        Text(
                          '${resolved!.hijriDate.formatEn()}  •  ${DateFormatter.formatFullDate(resolved!.gregorianDate.toDateTime())}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: kColorSeed,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ] else ...[
                        Text(
                          'Day ${event.hijriDay} of Month ${event.hijriMonth}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                if (event.isMajor)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: kColorIslamicEvent.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      l10n?.eventsMajor ?? 'Major',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: kColorIslamicEvent,
                      ),
                    ),
                  ),
              ],
            ),

            if (description.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],

            if (event.durationDays > 1) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    size: 14,
                    color: colorScheme.outline,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${event.durationDays} days observance',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
