/// Events screen with All, Islamic, and Personal event tabs and event management.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../localization/generated/app_localizations.dart';
import '../application/events_controller.dart';
import '../application/events_providers.dart';
import 'create_edit_event_screen.dart';
import 'event_detail_screen.dart';
import 'widgets/islamic_event_card.dart';
import 'widgets/personal_event_card.dart';

class EventsScreen extends ConsumerWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final islamicRepo = ref.watch(islamicEventsRepositoryProvider);
    final allIslamicEvents = islamicRepo.getAllEvents();
    final personalEventsAsync = ref.watch(eventsNotifierProvider);
    final upcomingEvents = ref.watch(upcomingEventsSummaryProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n?.navEvents ?? 'Events'),
          bottom: TabBar(
            tabs: [
              Tab(text: l10n?.eventsTabAll ?? 'All'),
              Tab(text: l10n?.eventsTabIslamic ?? 'Islamic'),
              Tab(text: l10n?.eventsTabPersonal ?? 'Personal'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // ── Tab 1: All (Unified Upcoming Timeline) ────────────────────
            ListView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              children: [
                if (upcomingEvents.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Text(
                        l10n?.eventsNoEvents ?? 'No upcoming events',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  )
                else
                  ...upcomingEvents.map((item) {
                    if (item.isIslamic && item.islamicEvent != null) {
                      return IslamicEventCard(
                        event: item.islamicEvent!.event,
                        resolved: item.islamicEvent,
                      );
                    } else if (item.personalEvent != null) {
                      return PersonalEventCard(
                        event: item.personalEvent!,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => EventDetailScreen(
                                eventId: item.personalEvent!.id,
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  }),
              ],
            ),

            // ── Tab 2: Islamic (Canonical Occasions) ───────────────────────
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: allIslamicEvents.length,
              itemBuilder: (context, index) {
                final event = allIslamicEvents[index];
                return IslamicEventCard(event: event);
              },
            ),

            // ── Tab 3: Personal (User Events CRUD) ─────────────────────────
            personalEventsAsync.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (err, _) => Center(
                child: Text('Error loading events: $err'),
              ),
              data: (events) {
                if (events.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event_available_outlined,
                            size: 64,
                            color: theme.colorScheme.outline,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n?.eventsNoPersonalEvents ??
                                'No personal events yet. Tap + to add one.',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 20),
                          FilledButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const CreateEditEventScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add),
                            label: Text(
                              l10n?.eventsAddEvent ?? 'Add Event',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return PersonalEventCard(
                      event: event,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => EventDetailScreen(
                              eventId: event.id,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const CreateEditEventScreen(),
              ),
            );
          },
          tooltip: l10n?.eventsAddEvent ?? 'Add Event',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
