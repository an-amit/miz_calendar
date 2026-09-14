/// Screen displaying detailed information for a personal event with edit and delete options.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../calendar_engine/calendar_engine.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../localization/generated/app_localizations.dart';
import '../application/events_controller.dart';
import '../domain/recurrence.dart';
import 'create_edit_event_screen.dart';

class EventDetailScreen extends ConsumerWidget {
  const EventDetailScreen({
    required this.eventId,
    super.key,
  });

  final String eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    final eventsAsync = ref.watch(eventsNotifierProvider);

    return eventsAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('Error: $err')),
      ),
      data: (events) {
        final event = events.where((e) => e.id == eventId).firstOrNull;

        if (event == null) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(l10n?.eventsNoEvents ?? 'Event not found'),
            ),
          );
        }

        final g = GregorianDate(
          event.startDate.year,
          event.startDate.month,
          event.startDate.day,
        );
        const engine = UmmAlQuraEngine();
        final h = engine.fromGregorian(g);

        return Scaffold(
          appBar: AppBar(
            title: Text(l10n?.eventsEventDetails ?? 'Event Details'),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                tooltip: l10n?.eventsEditEvent ?? 'Edit Event',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => CreateEditEventScreen(
                        existingEvent: event,
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                color: colorScheme.error,
                tooltip: l10n?.eventsDelete ?? 'Delete Event',
                onPressed: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(
                        l10n?.eventsDeleteConfirmTitle ?? 'Delete Event?',
                      ),
                      content: Text(
                        l10n?.eventsDeleteConfirmMessage ??
                            'Are you sure you want to delete this event?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(false),
                          child: Text(l10n?.eventsCancel ?? 'Cancel'),
                        ),
                        FilledButton(
                          onPressed: () => Navigator.of(ctx).pop(true),
                          style: FilledButton.styleFrom(
                            backgroundColor: colorScheme.error,
                          ),
                          child: Text(l10n?.eventsDelete ?? 'Delete'),
                        ),
                      ],
                    ),
                  );

                  if (confirmed ?? false) {
                    await ref
                        .read(eventsNotifierProvider.notifier)
                        .deleteEvent(event.id);
                    if (context.mounted) {
                      context.pop();
                    }
                  }
                },
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Title header
              Text(
                event.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Dual Date Card
              Card(
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
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: colorScheme.primary,
                            size: 22,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n?.eventsGregorian ?? 'Gregorian',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                Text(
                                  DateFormatter.formatFullDate(event.startDate),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      Row(
                        children: [
                          const Icon(
                            Icons.nights_stay_outlined,
                            color: kColorSeed,
                            size: 22,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n?.eventsHijri ?? 'Hijri',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                Text(
                                  h.formatEn(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kColorSeed,
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
              ),
              const SizedBox(height: 16),

              // Metadata tiles
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.repeat),
                title: Text(l10n?.eventsRecurrence ?? 'Repeat'),
                subtitle: Text(
                  _recurrenceLabel(l10n, event.recurrence.frequency),
                ),
              ),

              if (event.reminderMinutes != null)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.notifications_outlined),
                  title: Text(l10n?.eventsReminder ?? 'Reminder'),
                  subtitle: Text(
                    event.reminderMinutes == 0
                        ? (l10n?.eventsReminderAtTime ?? 'At time of event')
                        : '${event.reminderMinutes} minutes before',
                  ),
                ),

              if (event.description != null &&
                  event.description!.isNotEmpty) ...[
                const Divider(height: 32),
                Text(
                  l10n?.eventsDescription ?? 'Description',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  event.description!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                  ),
                ),
              ],
            ],
          ),
        );
      },
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
        RecurrenceFrequency.none => l10n?.eventsRecurrenceNone ?? 'Does not repeat',
      };
}
