/// The persistent shell widget containing the bottom navigation bar.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../extensions/build_context_extensions.dart';
import 'app_router.dart';

/// Wraps the content area and provides the bottom [NavigationBar].
class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  static int _locationToIndex(String location) {
    if (location.startsWith(AppRoutes.home)) return 0;
    if (location.startsWith(AppRoutes.calendar)) return 1;
    if (location.startsWith(AppRoutes.events)) return 2;
    if (location.startsWith(AppRoutes.prayer)) return 3;
    if (location.startsWith(AppRoutes.settings)) return 4;
    return 0;
  }

  static String _indexToLocation(int index) => switch (index) {
        0 => AppRoutes.home,
        1 => AppRoutes.calendar,
        2 => AppRoutes.events,
        3 => AppRoutes.prayer,
        4 => AppRoutes.settings,
        _ => AppRoutes.home,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final location = GoRouterState.of(context).uri.toString();
    final selectedIndex = _locationToIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          context.go(_indexToLocation(index));
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.navHome,
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_month_outlined),
            selectedIcon: const Icon(Icons.calendar_month),
            label: l10n.navCalendar,
          ),
          NavigationDestination(
            icon: const Icon(Icons.event_outlined),
            selectedIcon: const Icon(Icons.event),
            label: l10n.navEvents,
          ),
          NavigationDestination(
            icon: const Icon(Icons.access_time_outlined),
            selectedIcon: const Icon(Icons.access_time),
            label: l10n.navPrayer,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: l10n.navSettings,
          ),
        ],
      ),
    );
  }
}
