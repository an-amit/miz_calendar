# Mīzān Calendar — Implementation Plan

## Overview

**Mīzān Calendar** is a production-quality bilingual Flutter mobile app combining Gregorian and Islamic/Hijri calendars with prayer times, personal events, local notifications, and full offline-first operation.

The project directory currently contains **no Flutter project** — only a placeholder `src/Main.java`. The plan starts from zero and builds the application incrementally across **9 phases**.

> [!IMPORTANT]
> The project must be initialized from scratch at `d:\Amit\projects\mobile-app\Miz-Calendar`.
> No existing Flutter code will be overwritten since none exists yet.

---

## Open Questions

> [!IMPORTANT]
> **Q1 — Hijri package selection**: The two most maintained Dart packages are `hijri` (pub.dev) and `shamsi_date`. Should we use `hijri` (which supports Umm al-Qura) as the primary adapter, or do you have a preference?

> [!IMPORTANT]
> **Q2 — Prayer library**: The `adhan` Dart package is the most mature (port of Batoul Apps' Adhan library). Shall we use it, or do you prefer another source?

> [!IMPORTANT]
> **Q3 — Target platforms**: iOS + Android only for MVP? Or should we also configure the desktop/web runners in the project?

> [!IMPORTANT]
> **Q4 — City database for manual location**: Do you want a bundled city list (offline, ~2–5 MB JSON/SQLite) or a geocoding API fallback (requires internet)?

---

## Architecture Summary

```
Presentation  →  Application (Riverpod)  →  Domain  →  Data  →  Infrastructure
```

- **State management**: Riverpod (`Notifier` / `AsyncNotifier` / `Provider`)
- **Local persistence**: Drift + SQLite
- **Routing**: GoRouter
- **Localization**: Flutter ARB (English + Arabic / RTL + LTR)
- **UI**: Material 3
- **Calendar engine**: abstracted `HijriCalendarEngine` interface
- **Prayer engine**: abstracted `PrayerCalculationEngine` interface
- **Notifications**: `flutter_local_notifications`

---

## Phase Breakdown

---

## Phase 1 — Project Foundation
**Goal**: A running, lint-clean Flutter app skeleton with all infrastructure wired up.

### Tasks

#### [NEW] Flutter project bootstrap
- Initialize Flutter project at `d:\Amit\projects\mobile-app\Miz-Calendar` (remove placeholder `src/`)
- Configure `pubspec.yaml` with all required dependencies
- Set up `analysis_options.yaml` with strict lint rules

#### [NEW] `lib/main.dart` + `lib/app.dart`
- Bootstrap Riverpod `ProviderScope`
- Initialize app-wide services (DB, notifications, logging) at startup
- Configure `MaterialApp.router` with Material 3 theme

#### [NEW] `lib/core/` — Core infrastructure
- `core/constants/` — app-wide constants, color tokens, spacing
- `core/errors/` — `AppException` hierarchy (`CalendarCalculationException`, `DatabaseException`, `LocationException`, `NotificationException`, `PrayerCalculationException`, `InvalidHijriDateException`)
- `core/extensions/` — Dart/Flutter extension methods
- `core/logging/` — `AppLogger` (centralized, no sensitive data)
- `core/result/` — `Result<T, E>` type for error propagation
- `core/routing/` — GoRouter configuration with 5 bottom-nav routes
- `core/theme/` — `AppTheme` (Light / Dark / System), design tokens for typography, spacing, radius, elevation, calendar colors, event colors, prayer colors
- `core/utils/` — date formatting utilities
- `core/widgets/` — shared base widgets

#### [NEW] `lib/config/`
- `environment.dart`, `app_config.dart`, `feature_flags.dart`

#### [NEW] `lib/database/` — Drift + SQLite
- `app_database.dart` — Drift database class
- `tables/` — `EventsTable`, `EventRemindersTable`, `CalendarSettingsTable`, `UserSettingsTable`, `LocationsTable`, `PrayerSettingsTable`, `NotificationSettingsTable`, `CalendarOverridesTable`
- `daos/` — typed DAOs per table
- `migrations/` — versioned schema migrations
- `converters/` — column converters (enums, custom types)

#### [NEW] `lib/localization/`
- `app_en.arb` — full English string catalogue
- `app_ar.arb` — full Arabic string catalogue
- Generated code via `flutter gen-l10n`

#### [NEW] `lib/features/` — Placeholder screens
- `home/presentation/` — `HomeScreen` placeholder
- `calendar/presentation/` — `CalendarScreen` placeholder
- `events/presentation/` — `EventsScreen` placeholder
- `prayer/presentation/` — `PrayerScreen` placeholder
- `settings/presentation/` — `SettingsScreen` placeholder
- `onboarding/presentation/` — `OnboardingScreen` placeholder

#### [NEW] `lib/notifications/` — Skeleton
- `notification_service.dart`, `notification_scheduler.dart`, `notification_payload.dart`

#### [NEW] `lib/network/` — Skeleton
- `api_client.dart`, `interceptors/`, `endpoints/`

#### [NEW] `lib/sync/` — Skeleton
- `sync_manager.dart`, `sync_queue.dart`, `conflict_resolver.dart`

### Verification
```bash
flutter create .        # or flutter pub get
flutter analyze         # zero issues
flutter test            # baseline passes
flutter run             # app boots, bottom nav works
```

---

## Phase 2 — Calendar Engine
**Goal**: Correct, tested, offline Hijri↔Gregorian conversion behind a clean domain abstraction.

### Tasks

#### [NEW] `lib/calendar_engine/models/`
- `gregorian_date.dart` — immutable value type wrapping year/month/day (no raw `DateTime`)
- `hijri_date.dart` — immutable value type with `source` enum (`CALCULATED`, `OFFICIAL`, `OBSERVED`, `USER_ADJUSTED`, `REGIONAL`), `method`, `region`, and optional metadata
- `calendar_date.dart` — union/sealed type for either system
- `local_date.dart`, `local_date_time.dart`, `instant.dart`, `time_zone.dart`

#### [NEW] `lib/calendar_engine/engines/`
- `calendar_engine.dart` — `abstract interface class HijriCalendarEngine` with `fromGregorian`, `toGregorian`, `daysInMonth`, `isLeapYear`, `id`
- `umm_al_qura_engine.dart` — adapter wrapping the selected Hijri package (e.g. `hijri`)
- `tabular_civil_engine.dart` — tabular civil/arithmetic implementation
- `tabular_astronomical_engine.dart`
- `adjusted_engine.dart` — decorator applying ±2 day user adjustment over any base engine

#### [NEW] `lib/calendar_engine/converters/`
- `calendar_converter.dart` — orchestrator: `Instant → TimeZone → LocalDateTime → GregorianDate → HijriDate`

#### [NEW] `lib/calendar_engine/adjustments/`
- `hijri_adjustment.dart` — stores user adjustment (−2 to +2), applied by `AdjustedEngine`

#### [NEW] `lib/calendar_engine/validators/`
- Range validators, month-length validators

#### [NEW] `lib/calendar_engine/algorithms/`
- Standalone pure functions for edge cases

#### Dependency evaluation (document in `CALENDAR_ENGINE.md`)
- Evaluate `hijri`, `shamsi_date`, `jiffy` for Umm al-Qura support, maintenance, license

#### [NEW] Unit tests — `test/calendar_engine/`
- Known Gregorian→Hijri test vectors (multiple methods)
- Known Hijri→Gregorian test vectors
- Leap years, month lengths, year/month boundaries
- ±2 adjustment correctness
- Timezone boundary correctness
- Ramadan / Muharram edge cases

### Verification
```bash
flutter test test/calendar_engine/
flutter analyze
```

---

## Phase 3 — Calendar UI
**Goal**: Polished Home and Calendar screens with dual-date display, month/day navigation.

### Tasks

#### [NEW] `lib/features/home/`
- **Domain**: `HomeState` model
- **Application**: `HomeController` (`AsyncNotifier`) — today's Gregorian + Hijri date, next prayer stub, upcoming events stub
- **Presentation**: `HomeScreen` — greeting, dual date, weekday, "Go to Today" button, next prayer card, upcoming events list

#### [NEW] `lib/features/calendar/`
- **Domain**: `CalendarState` (`selectedDate`, `calendarSystem`, `viewMode`, `selectedMonth`, `events`)
- **Application**: `CalendarController` — `selectDate()`, `nextMonth()`, `previousMonth()`, `setCalendarSystem()`, `setViewMode()`
- **Presentation**:
  - `CalendarScreen` — top-level with month/day toggle
  - `MonthViewWidget` — 6-week grid; each cell shows `GregorianDay / HijriDay`, today highlight, selected highlight, event dot indicators
  - `DayViewWidget` — full date header (both calendars), event list, prayer times placeholder
  - `CalendarSystemSwitcher` — Gregorian / Hijri / Dual segmented control
  - `MonthNavigator` — `<` current month `>` header

#### [NEW] Riverpod providers
- `selectedDateProvider`, `calendarSystemProvider`, `viewModeProvider`, `monthEventsProvider`

#### [NEW] Widget tests — `test/features/calendar/`
- Month grid renders correct number of days
- Today is highlighted
- Navigation moves between months
- Date selection updates state

### Verification
```bash
flutter run             # calendar visually correct
flutter test test/features/calendar/
flutter analyze
```

---

## Phase 4 — Islamic Events
**Goal**: Core Islamic events seeded in DB and displayed on calendar/home/events screens.

### Tasks

#### [NEW] `lib/features/events/domain/`
- `islamic_event.dart` — `id`, `nameKey` (localization key), `hijriMonth`, `hijriDay`, `duration`, `source`, `region`, `calculationMethod`, `dayBoundary` (`CALENDAR_DAY`, `SUNSET_BASED`, `MOON_SIGHTING_BASED`)
- `event_day_boundary.dart` — enum

#### [NEW] `lib/features/events/data/`
- `islamic_events_table.dart` (Drift)
- `islamic_events_dao.dart`
- `islamic_events_repository.dart` + `islamic_events_repository_impl.dart`
- Seed data: Ramadan (30-day), Eid al-Fitr (1 Shawwal), Eid al-Adha (10 Dhul-Hijja), Arafah (9 Dhul-Hijja), Ashura (10 Muharram), Islamic New Year (1 Muharram)
- `calendar_overrides_dao.dart` — future official override support

#### [NEW] Application
- `IslamicEventsController` — resolves Hijri event dates → Gregorian dates using active `HijriCalendarEngine`; returns events for a given month/year

#### [NEW] Calendar integration
- `MonthViewWidget` shows event dots for Islamic events
- `DayViewWidget` shows event names for that day

#### [NEW] `lib/features/events/presentation/`
- `EventsScreen` — tabs: All / Islamic / Personal
- `IslamicEventCard` widget

#### ARB strings
- Add localized names for all 6 Islamic events (EN + AR)

#### Unit tests
- Islamic event Gregorian date resolution is correct for known years

### Verification
```bash
flutter test
flutter run             # Islamic events visible on calendar
flutter analyze
```

---

## Phase 5 — Personal Events
**Goal**: Full CRUD for user events (Gregorian + Hijri recurring), with reminders.

### Tasks

#### [NEW] `lib/features/events/domain/`
- `personal_event.dart` — `id`, `title`, `description`, `eventType`, `calendarType` (`GREGORIAN` / `HIJRI`), `startDate`, `endDate`, `recurrence`, `reminder`, `createdAt`, `updatedAt`
- `recurrence.dart` — `HijriRecurrence` stores semantic Hijri month+day (not a converted Gregorian date)
- `event_reminder.dart`

#### [NEW] `lib/features/events/data/`
- `events_table.dart`, `event_reminders_table.dart` (Drift)
- `events_dao.dart`, `event_reminders_dao.dart`
- `event_repository.dart` + `event_repository_impl.dart`

#### [NEW] Application
- `EventController` — CRUD operations, recurrence resolution (Hijri recurring events resolved via `HijriCalendarEngine` at render time, not stored as Gregorian)
- `RecurrenceResolver` — given a `HijriRecurrence` + year range, return `List<GregorianDate>`

#### [NEW] Presentation
- `CreateEventScreen` / `EditEventScreen` — title, description, date picker (Gregorian or Hijri), recurrence selector, reminder picker
- `EventDetailScreen`
- `EventListItem` widget
- Empty state widgets

#### Unit tests
- Hijri recurring event resolution (e.g. 15 Ramadan resolves to correct Gregorian date each year)
- CRUD operations via in-memory Drift database

### Verification
```bash
flutter test test/features/events/
flutter run             # create, edit, delete event end-to-end
flutter analyze
```

---

## Phase 6 — Prayer Times
**Goal**: Offline prayer calculation with location support (GPS + manual), configurable methods.

### Tasks

#### [NEW] `lib/features/prayer/`
- **Domain**:
  - `prayer_times.dart` — `date`, `timezone`, `lat`, `lng`, `imsak`, `fajr`, `sunrise`, `dhuhr`, `asr`, `sunset`, `maghrib`, `isha`, `midnight`, `calculationMethod`, `asrMethod`, `highLatitudeRule`
  - `prayer_calculation_engine.dart` — `abstract interface class PrayerCalculationEngine`
  - `calculation_method.dart` — enum (MWL, ISNA, Egyptian, Karachi, UmmAlQura, Dubai, MoonsightingCommittee, Singapore, Custom)
  - `asr_method.dart` — enum (Standard/Shafi'i, Hanafi)
  - `high_latitude_rule.dart` — enum (MiddleOfNight, OneSeventh, AngleBased)
- **Data**:
  - `prayer_library_adapter.dart` — wraps `adhan` package
  - `prayer_settings_dao.dart`
  - `prayer_repository.dart` + impl
- **Application**:
  - `PrayerController` — loads location → calculates today's prayer times → exposes next prayer
- **Presentation**:
  - `PrayerScreen` — prayer time list, current/next prayer highlighted, location display
  - `NextPrayerCard` widget (shared in Home)

#### [NEW] `lib/features/onboarding/`
- Location permission request flow
- GPS → coordinates → timezone → city → cache
- Manual city selection fallback (simple text search against bundled list)
- `LocationService` — one-time GPS fetch, stores `lat`, `lng`, `timezone`, `city`, `country`, `source` (GPS / MANUAL)

#### [NEW] `lib/database/` additions
- `locations_table.dart`, `prayer_settings_table.dart`

#### Dependency evaluation (document in `PRAYER_CALCULATIONS.md`)
- Evaluate `adhan` package (port of Batoul Apps Adhan)

#### Unit tests
- Prayer times against known reference values for specific lat/lng/date/method combinations

### Verification
```bash
flutter test test/features/prayer/
flutter run             # prayer times display, next prayer highlights
flutter analyze
```

---

## Phase 7 — Notifications
**Goal**: All 4 notification categories implemented, isolated from UI code.

### Tasks

#### [MODIFY] `lib/notifications/notification_service.dart`
- Full implementation using `flutter_local_notifications`
- Android + iOS channel configuration
- Permission request flow

#### [MODIFY] `lib/notifications/notification_scheduler.dart`
- `scheduleEventReminder(event, reminder)` — exact time notification
- `scheduleIslamicEventReminder(islamicEvent, gregorianDate)` — day-before notification
- `scheduleDailyReminder(time, hijriDate, gregorianDate)` — "Good morning, today is…"
- `schedulePrayerReminder(prayer, time)` — per-prayer notifications
- All schedulers use stable `notificationId` derived from entity ID (no large payloads)

#### [MODIFY] `lib/notifications/notification_payload.dart`
- Typed payload with `type`, `entityId`, `routePath` for deep-linking on tap

#### [NEW] Application integration
- `EventController` triggers scheduler on create/update/delete
- `PrayerController` schedules prayer reminders when prayer settings change
- Settings screen toggles per-category notification settings

#### Unit tests
- Notification ID stability
- Payload serialization/deserialization

### Verification
```bash
flutter test test/notifications/
flutter run             # trigger reminder, observe notification
flutter analyze
```

---

## Phase 8 — Localization & Accessibility
**Goal**: Complete English/Arabic bilingual support with RTL, accessible semantics.

### Tasks

#### [MODIFY] `lib/localization/app_en.arb` + `app_ar.arb`
- Audit every user-facing string; zero hard-coded UI strings
- Arabic month names, weekday names, Islamic event names
- Arabic numeral formatting support

#### [MODIFY] All screens and widgets
- Replace any remaining hard-coded strings with `AppLocalizations` lookups
- Validate all layouts respond correctly to `Directionality` (RTL for Arabic)
- Test calendar grid, navigation arrows, dialogs, bottom nav, settings in Arabic
- Add `Semantics` labels to calendar cells, prayer times, event cards
- Ensure touch targets ≥ 48×48 dp
- Verify sufficient contrast ratios in Light and Dark themes

#### [NEW] `test/localization/`
- Widget tests: Arabic month renders RTL
- Widget tests: Arabic weekdays render correctly
- Widget tests: English and Arabic date formats correct

#### Accessibility audit
- Enable screen reader, navigate all main flows
- Add `semanticLabel` to all icon buttons and image assets

### Verification
```bash
flutter test test/localization/
flutter run             # switch to Arabic, verify RTL calendar
flutter analyze
```

---

## Phase 9 — Testing, Polish & Documentation
**Goal**: Full test suite green, zero analyzer issues, all docs written.

### Tasks

#### Tests — complete coverage
- **Unit tests**: all calendar engine edge cases, prayer calculation reference vectors, recurrence resolver, notification ID stability
- **Repository tests**: insert / update / delete / query / transaction / migration for every DAO (using in-memory Drift)
- **Widget tests**: calendar rendering, date selection, navigation, event display, language switching
- **Integration tests**:
  1. Launch → select date → convert calendar → verify Hijri
  2. Create event → schedule reminder → delete event → verify reminder cancelled
  3. Switch to Arabic → verify RTL calendar grid
  4. Disable network → verify all core features work

#### Settings screen — final polish
- Language switcher (live locale change)
- Hijri adjustment (−2 to +2) with live preview
- Hijri method selector
- Prayer method + Asr + High Latitude Rule
- Location display + change
- Notification toggles per category
- Theme switcher (System / Light / Dark)

#### Performance audit
- Profile with Flutter DevTools; eliminate unnecessary rebuilds
- Cache month-level Islamic event resolution
- Cache prayer time per day/location (avoid recalculation on every build)

#### Documentation — `[NEW]` files in project root
- `README.md`
- `ARCHITECTURE.md`
- `CALENDAR_ENGINE.md` (selected package, rationale, test vectors)
- `DATABASE.md` (schema, migration strategy)
- `NOTIFICATIONS.md`
- `PRAYER_CALCULATIONS.md` (selected package, supported methods, limitations)
- `LOCALIZATION.md`
- `TESTING.md`

#### Final verification
```bash
flutter analyze         # zero issues
flutter test            # all passes
flutter run --release   # profile release build
```

---

## Dependency Selection (Provisional)

| Purpose | Package | Notes |
|---|---|---|
| State management | `flutter_riverpod` | Riverpod 2.x |
| Local database | `drift` + `sqlite3_flutter_libs` | Type-safe SQLite |
| Routing | `go_router` | Declarative |
| Notifications | `flutter_local_notifications` | Mature, cross-platform |
| Hijri calendar | `hijri` *(provisional)* | Umm al-Qura support |
| Prayer times | `adhan` *(provisional)* | Port of Batoul Apps Adhan |
| Localization | `flutter_localizations` + ARB | Built-in |
| Lint | `flutter_lints` | Strict rules |

> [!NOTE]
> Both `hijri` and `adhan` will be wrapped behind domain interfaces before use. If a better-maintained package is found during Phase 1 evaluation, it can be swapped without changing domain code.

---

## Acceptance Criteria Summary

| Area | Requirement |
|---|---|
| Calendar | Gregorian ↔ Hijri works, month view, day view, navigation, today highlight |
| Islamic Data | 6 major events, Hijri adjustment (±2), correct Gregorian resolution |
| Events | Full CRUD, Gregorian events, Hijri recurring events, reminders |
| Prayer | Offline calculation, GPS + manual location, next prayer widget, method config |
| Localization | English + Arabic, RTL correct, no hard-coded strings |
| Offline | All core features work with network disabled |
| Quality | `flutter analyze` = 0 issues, `flutter test` passes |

---

## Verification Plan

### Automated
```bash
flutter analyze
flutter test
flutter test integration_test/
```

### Manual
1. Run on Android physical device + iOS simulator
2. Enable airplane mode → verify all calendar/prayer/event features work
3. Switch language to Arabic → verify full RTL layout
4. Create a Hijri recurring event (e.g. 15 Ramadan) → verify it resolves to correct Gregorian date next year
5. Adjust Hijri setting to +1 → verify calendar dates shift
6. Change prayer method → verify times recalculate
