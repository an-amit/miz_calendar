/// Widget rendering the 6-week (42-cell) dual-calendar month grid.
library;

import 'package:flutter/material.dart';

import '../../../../calendar_engine/calendar_engine.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/calendar_enums.dart';
import 'day_cell_widget.dart';

class MonthViewWidget extends StatelessWidget {
  const MonthViewWidget({
    required this.gridDays,
    required this.displayedMonth,
    required this.selectedDate,
    required this.primarySystem,
    required this.onDateSelected,
    this.personalEventDates,
    this.islamicEventDates,
    super.key,
  });

  final List<CalendarDate> gridDays;
  final GregorianDate displayedMonth;
  final CalendarDate selectedDate;
  final CalendarSystem primarySystem;
  final ValueChanged<CalendarDate> onDateSelected;
  final Set<GregorianDate>? personalEventDates;
  final Set<GregorianDate>? islamicEventDates;

  static const List<String> weekdayShortNames = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final now = DateTime.now();
    final today = GregorianDate(now.year, now.month, now.day);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Weekday header row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (index) {
              final isFriday = index == 5; // Sunday is 0, Friday is 5
              return Expanded(
                child: Center(
                  child: Text(
                    weekdayShortNames[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isFriday
                          ? kColorSeed
                          : colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        const Divider(height: 1),

        // 42-cell fixed month grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: gridDays.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              final itemDate = gridDays[index];
              final isToday = itemDate.gregorian == today;
              final isSelected = itemDate.gregorian == selectedDate.gregorian;
              final isOutsideMonth =
                  itemDate.gregorian.month != displayedMonth.month;

              return DayCellWidget(
                calendarDate: itemDate,
                primarySystem: primarySystem,
                isToday: isToday,
                isSelected: isSelected,
                isOutsideMonth: isOutsideMonth,
                hasEvent: personalEventDates?.contains(itemDate.gregorian) ?? false,
                isIslamicSpecialDay:
                    islamicEventDates?.contains(itemDate.gregorian) ?? false,
                onTap: () => onDateSelected(itemDate),
              );
            },
          ),
        ),
      ],
    );
  }
}
