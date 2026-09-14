/// Home screen dashboard presenting today's dual dates, greeting, and overview cards.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/routing/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_formatter.dart';
import '../../events/application/events_providers.dart';
import '../../events/presentation/widgets/islamic_event_card.dart';
import '../application/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;

    final today = state.todayDate;
    final gregorianStr = DateFormatter.formatFullDate(
      today.gregorian.toDateTime(),
    );
    final hijriStr = today.hijri.formatEn();
    final hijriArStr = today.hijri.formatAr();

    // Resolve greeting
    final greeting = switch (state.greetingKey) {
      'greetingMorning' => l10n.greetingMorning,
      'greetingAfternoon' => l10n.greetingAfternoon,
      _ => l10n.greetingEvening,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navHome),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Greeting & Today Dual Date Hero Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: colorScheme.primaryContainer.withValues(alpha: 0.35),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greeting,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: kColorSeed,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      gregorianStr,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.nights_stay_outlined,
                          size: 18,
                          color: kColorSeed,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            hijriStr,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: kColorSeed,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hijriArStr,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Quick Actions Row
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context.go(AppRoutes.calendar),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.calendar_month, size: 20),
                    label: const Text('Calendar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => context.go(AppRoutes.prayer),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.access_time, size: 20),
                    label: const Text('Prayer Times'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Next Prayer Preview Card (Stub for Phase 6)
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              child: ListTile(
                leading: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.access_time_filled,
                    color: colorScheme.primary,
                    size: 22,
                  ),
                ),
                title: const Text(
                  'Next Prayer: Asr (العصر)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Prayer engine coming in Phase 6'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                onTap: () => context.go(AppRoutes.prayer),
              ),
            ),

            const SizedBox(height: 12),

            // Upcoming Events Preview Card
            Consumer(
              builder: (context, ref, _) {
                final upcoming = ref.watch(upcomingEventsSummaryProvider);
                final top = upcoming.firstOrNull;

                String subtitleText;
                if (top != null) {
                  final title = top.isIslamic
                      ? IslamicEventCard.getLocalizedTitle(context, top.title)
                      : top.title;
                  final countSuffix = upcoming.length > 1
                      ? ' (+${upcoming.length - 1} more)'
                      : '';
                  subtitleText = '$title  •  ${top.hijriDate.formatEn()}$countSuffix';
                } else {
                  subtitleText = 'No upcoming events';
                }

                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: kColorIslamicEvent.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.star_outline,
                        color: kColorIslamicEvent,
                        size: 22,
                      ),
                    ),
                    title: const Text(
                      'Upcoming Events',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      subtitleText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () => context.go(AppRoutes.events),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
