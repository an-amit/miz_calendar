import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miz_calendar/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MizanCalendarApp(),
      ),
    );
    // App should render without throwing.
    expect(find.byType(MizanCalendarApp), findsOneWidget);
  });
}
