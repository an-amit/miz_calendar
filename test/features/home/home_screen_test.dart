import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/features/home/presentation/home_screen.dart';
import 'package:miz_calendar/localization/generated/app_localizations.dart';

Widget _buildTestHome() => const ProviderScope(
      child: MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: HomeScreen(),
      ),
    );

void main() {
  group('HomeScreen', () {
    testWidgets('renders today dual date card and quick actions', (
      tester,
    ) async {
      await tester.pumpWidget(_buildTestHome());
      await tester.pumpAndSettle();

      // Verify Calendar and Prayer Times quick action buttons
      expect(find.text('Calendar'), findsOneWidget);
      expect(find.text('Prayer Times'), findsOneWidget);

      // Verify Preview Cards
      expect(find.text('Next Prayer: Asr (العصر)'), findsOneWidget);
      expect(find.text('Upcoming Events'), findsOneWidget);
    });
  });
}
