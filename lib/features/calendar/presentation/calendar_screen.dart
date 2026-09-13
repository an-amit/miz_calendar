/// Primary Calendar Screen assembling navigation, dual month grid, and day agenda.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/build_context_extensions.dart';
import '../application/calendar_controller.dart';
import 'widgets/calendar_system_switcher.dart';
import 'widgets/day_view_widget.dart';
import 'widgets/month_navigator.dart';
import 'widgets/month_view_widget.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calendarNotifierProvider);
    final notifier = ref.read(calendarNotifierProvider.notifier);
    final l10n = context.l10n;
    final theme = Theme.of(context);

    // Pick a sample Hijri date from the middle of the month for header display
    final sampleHijri = state.gridDays.length > 20
        ? state.gridDays[20].hijri
        : state.selectedDate.hijri;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navCalendar),
        actions: [
          IconButton(
            icon: const Icon(Icons.today_outlined),
            tooltip: 'Go to Today',
            onPressed: notifier.goToToday,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Calendar system switcher (Gregorian primary vs Hijri primary)
            CalendarSystemSwitcher(
              currentSystem: state.primarySystem,
              onSystemChanged: notifier.setPrimaryCalendar,
            ),

            // Month navigation bar
            MonthNavigator(
              displayedMonth: state.displayedMonth,
              primarySystem: state.primarySystem,
              sampleHijriDate: sampleHijri,
              onPreviousMonth: notifier.previousMonth,
              onNextMonth: notifier.nextMonth,
              onGoToToday: notifier.goToToday,
            ),

            // Month Grid Card
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: MonthViewWidget(
                  gridDays: state.gridDays,
                  displayedMonth: state.displayedMonth,
                  selectedDate: state.selectedDate,
                  primarySystem: state.primarySystem,
                  onDateSelected: notifier.selectDate,
                ),
              ),
            ),

            // Day details & agenda
            DayViewWidget(
              selectedDate: state.selectedDate,
              onAddEventPressed: () {
                // Future Phase 4: Navigate to event creation
                context.showSnackBar(
                  'Event creation will be available in Phase 4',
                );
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
