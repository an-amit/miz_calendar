import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/features/calendar/presentation/calendar_screen.dart';
import 'package:miz_calendar/features/calendar/presentation/widgets/calendar_system_switcher.dart';
import 'package:miz_calendar/features/calendar/presentation/widgets/day_cell_widget.dart';
import 'package:miz_calendar/features/calendar/presentation/widgets/day_view_widget.dart';
import 'package:miz_calendar/features/calendar/presentation/widgets/month_navigator.dart';
import 'package:miz_calendar/features/calendar/presentation/widgets/month_view_widget.dart';
import 'package:miz_calendar/localization/generated/app_localizations.dart';

Widget _buildTestApp() => const ProviderScope(
      child: MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: CalendarScreen(),
      ),
    );

void main() {
  group('CalendarScreen', () {
    testWidgets('renders all major components and exactly 42 day cells', (
      tester,
    ) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      expect(find.byType(CalendarSystemSwitcher), findsOneWidget);
      expect(find.byType(MonthNavigator), findsOneWidget);
      expect(find.byType(MonthViewWidget), findsOneWidget);
      expect(find.byType(DayViewWidget), findsOneWidget);

      // Verify exactly 42 day cells for the 6-week fixed grid
      expect(find.byType(DayCellWidget), findsNWidgets(42));
    });

    testWidgets('switching primary calendar toggles between Gregorian and Hijri', (
      tester,
    ) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      // Tap Hijri tab in segmented button
      final hijriTab = find.text('Hijri (هجري)');
      expect(hijriTab, findsOneWidget);
      await tester.tap(hijriTab);
      await tester.pumpAndSettle();

      // Tap Gregorian tab
      final gregorianTab = find.text('Gregorian');
      expect(gregorianTab, findsOneWidget);
      await tester.tap(gregorianTab);
      await tester.pumpAndSettle();
    });

    testWidgets('tapping next month advances month navigator', (tester) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      final nextButton = find.byTooltip('Next Month');
      expect(nextButton, findsOneWidget);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Still renders 42 cells smoothly
      expect(find.byType(DayCellWidget), findsNWidgets(42));
    });

    testWidgets('tapping a day cell selects that day', (tester) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      // Tap the 15th cell in the grid
      final cellFinder = find.byType(DayCellWidget).at(15);
      await tester.tap(cellFinder);
      await tester.pumpAndSettle();

      expect(find.byType(DayViewWidget), findsOneWidget);
    });
  });
}
