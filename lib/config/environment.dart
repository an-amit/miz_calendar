/// Environment configuration (build-time constants).
library;

/// Whether the app is running in debug mode.
const bool kIsDebugMode = bool.fromEnvironment('dart.vm.product') == false;

/// API base URL — empty for MVP (no backend required).
const String kApiBaseUrl = String.fromEnvironment('API_BASE_URL');

/// App version string injected at build time.
const String kAppVersion = String.fromEnvironment(
  'APP_VERSION',
  defaultValue: '1.0.0',
);
