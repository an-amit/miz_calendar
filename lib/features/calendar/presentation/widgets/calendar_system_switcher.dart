/// Widget allowing toggle between Gregorian-primary and Hijri-primary views.
library;

import 'package:flutter/material.dart';

import '../../domain/calendar_enums.dart';

class CalendarSystemSwitcher extends StatelessWidget {
  const CalendarSystemSwitcher({
    required this.currentSystem,
    required this.onSystemChanged,
    super.key,
  });

  final CalendarSystem currentSystem;
  final ValueChanged<CalendarSystem> onSystemChanged;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: SegmentedButton<CalendarSystem>(
          segments: const [
            ButtonSegment<CalendarSystem>(
              value: CalendarSystem.gregorian,
              label: Text('Gregorian'),
              icon: Icon(Icons.calendar_today_outlined, size: 16),
            ),
            ButtonSegment<CalendarSystem>(
              value: CalendarSystem.hijri,
              label: Text('Hijri (هجري)'),
              icon: Icon(Icons.nights_stay_outlined, size: 16),
            ),
          ],
          selected: {currentSystem},
          onSelectionChanged: (newSelection) {
            if (newSelection.isNotEmpty) {
              onSystemChanged(newSelection.first);
            }
          },
        ),
      );
}
