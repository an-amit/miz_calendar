import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/features/splash/presentation/splash_screen.dart';
import 'package:miz_calendar/localization/generated/app_localizations.dart';

Widget _buildTestSplash({Duration duration = const Duration(seconds: 5)}) =>
    ProviderScope(
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: SplashScreen(minimumDuration: duration),
      ),
    );

void main() {
  group('SplashScreen', () {
    testWidgets('renders branding elements and loading indicator', (tester) async {
      await tester.pumpWidget(_buildTestSplash());
      await tester.pump(const Duration(milliseconds: 500));

      // Verify app title and subtitle
      expect(find.text('Mīzān Calendar'), findsOneWidget);
      expect(find.text('مِيزَان  •  Islamic & Gregorian Harmony'), findsOneWidget);

      // Verify loading indicator and status
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading...'), findsOneWidget);

      // Verify version tag
      expect(find.text('v1.0.0'), findsOneWidget);
    });
  });
}
