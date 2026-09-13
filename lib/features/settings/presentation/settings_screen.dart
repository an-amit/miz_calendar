import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/build_context_extensions.dart';
import '../application/settings_provider.dart';

/// Settings screen — Phase 9 will add full settings UI.
/// Provides basic language and theme switching for Phase 1 verification.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navSettings)),
      body: ListView(
        children: [
          // Language
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(l10n.settingsLanguage),
            subtitle: Text(
              settings.locale.languageCode == 'ar' ? 'العربية' : 'English',
            ),
            onTap: () {
              final newLocale = settings.locale.languageCode == 'en'
                  ? const Locale('ar')
                  : const Locale('en');
              notifier.setLocale(newLocale);
            },
          ),
          const Divider(),

          // Theme
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: Text(l10n.settingsAppearance),
          ),
          RadioGroup<ThemeMode>(
            groupValue: settings.themeMode,
            onChanged: (v) {
              if (v != null) notifier.setThemeMode(v);
            },
            child: Column(
              children: [
                RadioListTile<ThemeMode>(
                  title: Text(l10n.settingsThemeSystem),
                  value: ThemeMode.system,
                ),
                RadioListTile<ThemeMode>(
                  title: Text(l10n.settingsThemeLight),
                  value: ThemeMode.light,
                ),
                RadioListTile<ThemeMode>(
                  title: Text(l10n.settingsThemeDark),
                  value: ThemeMode.dark,
                ),
              ],
            ),
          ),
          const Divider(),

          // Calendar (placeholder)
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text(l10n.settingsCalendar),
            subtitle: const Text('Phase 9 — full settings coming soon'),
          ),

          // Prayer (placeholder)
          ListTile(
            leading: const Icon(Icons.access_time),
            title: Text(l10n.settingsPrayer),
            subtitle: const Text('Phase 9 — full settings coming soon'),
          ),

          // Notifications (placeholder)
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: Text(l10n.settingsNotifications),
            subtitle: const Text('Phase 9 — full settings coming soon'),
          ),
        ],
      ),
    );
  }
}
