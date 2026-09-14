/// GoRouter configuration for Mīzān Calendar.
///
/// All navigation routes are declared here.
/// Widgets must use `context.go` / `context.push`; never `Navigator.push`
/// directly from business logic.
library;

import 'package:go_router/go_router.dart';

import '../../features/calendar/presentation/calendar_screen.dart';
import '../../features/events/domain/personal_event.dart';
import '../../features/events/presentation/create_edit_event_screen.dart';
import '../../features/events/presentation/event_detail_screen.dart';
import '../../features/events/presentation/events_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/prayer/presentation/prayer_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import 'app_shell.dart';

/// Named route paths.
abstract final class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String home = '/home';
  static const String calendar = '/calendar';
  static const String events = '/events';
  static const String prayer = '/prayer';
  static const String settings = '/settings';
  static const String createEvent = '/events/create';
  static const String editEvent = '/events/:id/edit';
  static const String eventDetail = '/events/:id';
  static const String onboarding = '/onboarding';
}

/// The application router.
final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SplashScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.createEvent,
      builder: (context, state) => const CreateEditEventScreen(),
    ),
    GoRoute(
      path: AppRoutes.eventDetail,
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return EventDetailScreen(eventId: id);
      },
    ),
    GoRoute(
      path: AppRoutes.editEvent,
      builder: (context, state) => CreateEditEventScreen(
        existingEvent: state.extra as PersonalEvent?,
      ),
    ),
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.calendar,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: CalendarScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.events,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: EventsScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.prayer,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PrayerScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.settings,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingsScreen(),
          ),
        ),
      ],
    ),
  ],
);
