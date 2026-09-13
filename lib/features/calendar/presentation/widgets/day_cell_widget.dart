/// Widget rendering an individual calendar day cell with dual Gregorian/Hijri numbers.
library;

import 'package:flutter/material.dart';

import '../../../../calendar_engine/calendar_engine.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/calendar_enums.dart';

class DayCellWidget extends StatelessWidget {
  const DayCellWidget({
    required this.calendarDate,
    required this.primarySystem,
    required this.isToday,
    required this.isSelected,
    required this.isOutsideMonth,
    required this.onTap,
    super.key,
    this.hasEvent = false,
    this.isIslamicSpecialDay = false,
  });

  final CalendarDate calendarDate;
  final CalendarSystem primarySystem;
  final bool isToday;
  final bool isSelected;
  final bool isOutsideMonth;
  final VoidCallback onTap;
  final bool hasEvent;
  final bool isIslamicSpecialDay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine primary and secondary numbers based on active system
    final primaryNumber = primarySystem == CalendarSystem.gregorian
        ? '${calendarDate.gregorian.day}'
        : '${calendarDate.hijri.day}';

    final secondaryNumber = primarySystem == CalendarSystem.gregorian
        ? '${calendarDate.hijri.day}'
        : '${calendarDate.gregorian.day}';

    final isFriday = calendarDate.gregorian.weekday == 5;

    // Determine colors
    Color primaryTextColor;
    if (isToday) {
      primaryTextColor = colorScheme.onPrimary;
    } else if (isOutsideMonth) {
      primaryTextColor = colorScheme.onSurface.withValues(alpha: 0.35);
    } else if (isFriday) {
      primaryTextColor = kColorSeed;
    } else {
      primaryTextColor = colorScheme.onSurface;
    }

    Color secondaryTextColor;
    if (isToday) {
      secondaryTextColor = colorScheme.onPrimary.withValues(alpha: 0.85);
    } else if (isOutsideMonth) {
      secondaryTextColor = colorScheme.onSurface.withValues(alpha: 0.25);
    } else {
      secondaryTextColor = colorScheme.onSurfaceVariant;
    }

    return Semantics(
      label: 'Gregorian ${calendarDate.gregorian.day}, Hijri ${calendarDate.hijri.day}',
      selected: isSelected,
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: kMinTouchTarget,
            minHeight: kMinTouchTarget,
          ),
          decoration: BoxDecoration(
            color: isToday
                ? colorScheme.primary
                : isSelected
                    ? colorScheme.primaryContainer.withValues(alpha: 0.4)
                    : null,
            borderRadius: BorderRadius.circular(10),
            border: isSelected && !isToday
                ? Border.all(color: colorScheme.primary, width: 2)
                : null,
          ),
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Primary large number
              Text(
                primaryNumber,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isToday || isSelected
                      ? FontWeight.bold
                      : FontWeight.w600,
                  color: primaryTextColor,
                ),
              ),

              // Secondary small number
              Text(
                secondaryNumber,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: secondaryTextColor,
                ),
              ),

              // Event indicator dots
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (hasEvent)
                    Container(
                      width: 4,
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isToday
                            ? colorScheme.onPrimary
                            : kColorPersonalEvent,
                      ),
                    ),
                  if (isIslamicSpecialDay)
                    Container(
                      width: 4,
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isToday
                            ? colorScheme.onPrimary
                            : kColorIslamicEvent,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
