/// Feature flags — can be toggled at build time or runtime.
///
/// Allows gradual roll-out of features without code deletion.
library;

/// Whether the prayer times feature is enabled.
const bool kFeaturePrayerTimes = true;

/// Whether the personal events feature is enabled.
const bool kFeaturePersonalEvents = true;

/// Whether notifications are enabled.
const bool kFeatureNotifications = true;

/// Whether the network layer is active.
/// Set to false for offline-only builds.
const bool kFeatureNetwork = false;

/// Whether cloud sync is enabled (Phase 9+).
const bool kFeatureCloudSync = false;
