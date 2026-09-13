import 'package:flutter/material.dart';

import '../../../core/extensions/build_context_extensions.dart';

/// Prayer screen placeholder — Phase 6 will replace with the full UI.
class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(context.l10n.navPrayer)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.access_time, size: 64),
              const SizedBox(height: 16),
              Text(
                context.l10n.navPrayer,
                style: context.textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Phase 6 — Coming soon',
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      );
}
