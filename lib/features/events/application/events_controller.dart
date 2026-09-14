/// Controller managing personal events and CRUD state via Riverpod.
library;

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/personal_event.dart';
import 'events_providers.dart';

/// State notifier maintaining active personal events.
class EventsNotifier extends AsyncNotifier<List<PersonalEvent>> {
  @override
  FutureOr<List<PersonalEvent>> build() {
    final repo = ref.watch(eventRepositoryProvider);
    // Listen to repository stream and keep state synced
    final subscription = repo.watchAllEvents().listen((events) {
      state = AsyncData(events);
    });

    ref.onDispose(subscription.cancel);

    return repo.getAllActiveEvents();
  }

  /// Adds or updates a personal event.
  Future<void> saveEvent(PersonalEvent event) async {
    final repo = ref.read(eventRepositoryProvider);
    await repo.saveEvent(event);
    // Refresh list
    state = AsyncData(await repo.getAllActiveEvents());
  }

  /// Soft-deletes an event by ID.
  Future<void> deleteEvent(String id) async {
    final repo = ref.read(eventRepositoryProvider);
    await repo.deleteEvent(id);
    state = AsyncData(await repo.getAllActiveEvents());
  }
}

/// Provider for [EventsNotifier].
final eventsNotifierProvider =
    AsyncNotifierProvider<EventsNotifier, List<PersonalEvent>>(
  EventsNotifier.new,
);
