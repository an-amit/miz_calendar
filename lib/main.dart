/// App entry point — bootstraps Riverpod and the router.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/logging/app_logger.dart';
import 'database/app_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppLogger.minimumLevel = LogLevel.debug;
  AppLogger.i('Main', 'Mīzān Calendar starting...');

  final database = AppDatabase();

  runApp(
    ProviderScope(
      overrides: [
        appDatabaseProvider.overrideWithValue(database),
      ],
      child: const MizanCalendarApp(),
    ),
  );
}
