import 'package:flutter/material.dart';

import '../../../core/extensions/build_context_extensions.dart';

/// Events screen placeholder — Phases 4 & 5 will replace with the full UI.
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(context.l10n.navEvents)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.event, size: 64),
              const SizedBox(height: 16),
              Text(
                context.l10n.navEvents,
                style: context.textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Phases 4 & 5 — Coming soon',
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      );
}
