import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/features/events/presentation/events_screen.dart';
import 'package:miz_calendar/features/events/presentation/widgets/islamic_event_card.dart';
import 'package:miz_calendar/localization/generated/app_localizations.dart';

Widget _buildEventsScreen() => const ProviderScope(
      child: MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: EventsScreen(),
      ),
    );

void main() {
  group('EventsScreen Widget Tests', () {
    testWidgets('renders 3 tabs (All, Islamic, Personal) and FAB', (tester) async {
      await tester.pumpWidget(_buildEventsScreen());
      await tester.pumpAndSettle();

      // Verify Tab bar tabs exist
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Islamic'), findsOneWidget);
      expect(find.text('Personal'), findsOneWidget);

      // Verify FloatingActionButton exists
      expect(find.byType(FloatingActionButton), findsOneWidget);

      // Tap on Islamic Events Tab
      await tester.tap(find.text('Islamic'));
      await tester.pumpAndSettle();

      // Islamic events list should render IslamicEventCard items
      expect(find.byType(IslamicEventCard), findsWidgets);
    });
  });
}
