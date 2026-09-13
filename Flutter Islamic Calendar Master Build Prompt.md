# Build Mīzān Calendar — Flutter Islamic & Gregorian Calendar App

You are a senior Flutter architect and engineer.

Build a production-quality mobile application named **Mīzān Calendar**.

The application is a bilingual **Islamic/Hijri + Gregorian calendar** with:

- Gregorian calendar
- Hijri calendar
- Gregorian → Hijri conversion
- Hijri → Gregorian conversion
- Month view
- Day view
- Today navigation
- Month/year navigation
- Islamic events
- Personal events
- Hijri recurring events
- Event reminders
- Daily reminders
- Local notifications
- Prayer times
- Arabic and English localization
- RTL/LTR support
- Offline-first operation
- Configurable Hijri adjustment
- Multiple Hijri calculation methodologies
- Multiple prayer calculation methods

The application must be designed for long-term maintainability and future expansion.

---

# 1. PRIMARY OBJECTIVE

Build a mobile-first Flutter application that works reliably without an internet connection.

The fundamental principle is:

> Calendar calculation and core calendar functionality must NOT depend on an external API.

The app should continue working when:

- there is no internet
- the user is travelling
- the user denies location permission
- backend services are unavailable

External APIs, if introduced later, must only enhance the application and must never become a single point of failure for basic calendar functionality.

---

# 2. TECHNOLOGY STACK

Use:

- Flutter
- Dart
- Riverpod for state management
- Drift + SQLite for local persistence
- Flutter localization / ARB
- Material 3
- GoRouter or an equivalent declarative router
- flutter_local_notifications for local notifications
- A mature Hijri/Gregorian calculation implementation wrapped behind our own domain abstraction
- A mature prayer-time calculation library wrapped behind our own domain abstraction

Do NOT tightly couple business logic to third-party packages.

Third-party libraries must be isolated behind interfaces/adapters whenever practical.

---

# 3. ARCHITECTURE

Use:

## Clean Architecture + Feature-First Architecture

The dependency direction must be:

Presentation
↓
Application / State Management
↓
Domain
↓
Data
↓
Infrastructure

Business logic must not live inside widgets.

Widgets should be responsible primarily for:

- rendering
- user interaction
- invoking controllers/notifiers

Do NOT create a giant generic structure such as:

```text
screens/
widgets/
services/
models/
```

Instead organize code by feature.

---

# 4. REQUIRED PROJECT STRUCTURE

Create a structure similar to:

```text
lib/
│
├── main.dart
├── app.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── logging/
│   ├── result/
│   ├── routing/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── config/
│   ├── environment.dart
│   ├── app_config.dart
│   └── feature_flags.dart
│
├── database/
│   ├── app_database.dart
│   ├── tables/
│   ├── daos/
│   ├── migrations/
│   └── converters/
│
├── calendar_engine/
│   ├── models/
│   │   ├── gregorian_date.dart
│   │   ├── hijri_date.dart
│   │   └── calendar_date.dart
│   │
│   ├── engines/
│   │   ├── calendar_engine.dart
│   │   ├── umm_al_qura_engine.dart
│   │   ├── tabular_engine.dart
│   │   └── adjusted_engine.dart
│   │
│   ├── converters/
│   ├── algorithms/
│   ├── adjustments/
│   └── validators/
│
├── features/
│   ├── home/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── calendar/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── events/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── prayer/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── settings/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── onboarding/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
├── notifications/
│   ├── notification_service.dart
│   ├── notification_scheduler.dart
│   └── notification_payload.dart
│
├── localization/
│   ├── app_en.arb
│   ├── app_ar.arb
│   └── generated/
│
├── network/
│   ├── api_client.dart
│   ├── interceptors/
│   └── endpoints/
│
└── sync/
    ├── sync_manager.dart
    ├── sync_queue.dart
    └── conflict_resolver.dart
```

Do not create unnecessary files merely to satisfy the structure. Keep files cohesive.

---

# 5. STATE MANAGEMENT

Use Riverpod.

Prefer:

- Provider
- Notifier
- AsyncNotifier

depending on the use case.

For example:

```text
CalendarController
    ├── selectedDate
    ├── calendarSystem
    ├── viewMode
    ├── selectedMonth
    └── events
```

A UI interaction should look conceptually like:

```dart
ref
    .read(calendarControllerProvider.notifier)
    .selectDate(date);
```

Do NOT put:

- database queries
- date conversion algorithms
- notification scheduling
- prayer calculations
- business rules

directly inside widgets.

---

# 6. CALENDAR DOMAIN MODEL

Create explicit domain types.

Do not use Dart `DateTime` everywhere.

Create:

```text
GregorianDate
HijriDate
LocalDate
LocalDateTime
Instant
TimeZone
CalendarDate
```

A calendar date and an instant are different concepts.

For example:

```text
2026-09-11
```

must not automatically be treated as:

```text
2026-09-11T00:00:00Z
```

The application must correctly handle timezone boundaries.

---

# 7. HIJRI CALENDAR ENGINE

This is a critical component.

Create:

```dart
abstract interface class HijriCalendarEngine {
  HijriDate fromGregorian(GregorianDate date);

  GregorianDate toGregorian(HijriDate date);

  int daysInMonth(int year, int month);

  bool isLeapYear(int year);

  String get id;
}
```

Implement the architecture so that multiple engines can exist:

```text
HijriCalendarEngine
       │
       ├── UmmAlQuraEngine
       ├── TabularCivilEngine
       ├── TabularAstronomicalEngine
       └── AdjustedEngine
```

Do not assume that there is one universally authoritative Hijri date.

The displayed date should conceptually depend on:

```text
Hijri Date
+
Calendar Method
+
Region
+
Adjustment
=
Displayed Hijri Date
```

---

# 8. THIRD-PARTY CALENDAR LIBRARIES

You may use an existing mature Dart package for Hijri/Gregorian conversion.

However:

NEVER expose the package API directly throughout the application.

Instead:

```text
Domain
  ↓
HijriCalendarEngine
  ↓
Adapter
  ↓
Third-party package
```

This allows the implementation to be replaced later without rewriting the application.

Before selecting a package:

1. Check current package maintenance.
2. Check license.
3. Check Flutter/Dart compatibility.
4. Check conversion accuracy.
5. Check Umm al-Qura support.
6. Check supported date ranges.
7. Check test coverage.
8. Prefer a package with stable releases and active maintenance.

Document the selected package and reason for selection.

---

# 9. HIJRI DATE SOURCE

Model the source of a Hijri date.

Possible values:

```text
CALCULATED
OFFICIAL
OBSERVED
USER_ADJUSTED
REGIONAL
```

A Hijri date should be capable of carrying metadata such as:

```json
{
  "hijriYear": 1448,
  "hijriMonth": 10,
  "hijriDay": 1,
  "source": "REGIONAL",
  "region": "SA",
  "method": "UMM_AL_QURA"
}
```

Do not present calculated dates as guaranteed official dates.

For example:

```text
Expected Eid al-Fitr
1 Shawwal 1448

Calculation:
Umm al-Qura

Status:
Calculated

Official regional confirmation:
Pending
```

If an official override is introduced later, the application should support:

```text
Calculated date
        ↓
Official regional override
        ↓
Displayed official date
```

---

# 10. HIJRI ADJUSTMENT

Allow users to configure Hijri adjustment.

Example:

```text
Hijri Adjustment
[-2] [-1] [0] [+1] [+2]
```

The adjustment must be applied through the calendar domain layer.

Do not modify the underlying calendar library directly.

Example conceptual architecture:

```text
Base Hijri Date
      ↓
Adjustment Policy
      ↓
Adjusted Hijri Date
```

Store the user's adjustment locally.

---

# 11. GREGORIAN CALENDAR

Use Dart/platform date functionality for normal Gregorian operations.

Do not manually reimplement the Gregorian calendar unless required by the selected architecture.

Still keep Gregorian dates behind domain abstractions.

---

# 12. TIMEZONE HANDLING

Treat:

```text
Instant
Timezone
LocalDateTime
CalendarDate
```

as separate concepts.

Correct flow:

```text
Instant
   ↓
TimeZone
   ↓
LocalDateTime
   ↓
GregorianDate
   ↓
HijriDate
```

Never blindly convert calendar dates through UTC midnight.

The calendar displayed to the user must be based on the user's local civil date.

---

# 13. ISLAMIC DAY BOUNDARY

For normal calendar UI:

Use the local civil calendar-day boundary.

However, religious events may have different semantic boundaries.

Model whether an event is:

```text
CALENDAR_DAY
SUNSET_BASED
MOON_SIGHTING_BASED
```

Do not silently assume every Islamic event begins at midnight.

---

# 14. CALENDAR FEATURES

Implement:

## Today

Display:

```text
Friday
11 September 2026

25 Rabi' al-Awwal 1448 AH
```

Support Arabic equivalent formatting.

---

## Month View

Must show:

- current month
- Gregorian date
- corresponding Hijri date
- selected date
- today indicator
- Islamic events
- personal events
- month navigation

The user must be able to navigate:

```text
Previous Month
Current Month
Next Month
```

---

## Day View

Display:

- full Gregorian date
- full Hijri date
- weekday
- Islamic events
- personal events
- prayer times if available

---

## Calendar System

Allow switching between:

```text
Gregorian
Hijri
Dual
```

The exact UX can be refined during implementation, but both calendar systems must remain accessible.

---

# 15. NAVIGATION

Use bottom navigation:

```text
Home
Calendar
Events
Prayer
Settings
```

Home:

- Today
- Gregorian date
- Hijri date
- weekday
- next prayer
- upcoming events

Calendar:

- primary calendar experience

Events:

- Islamic events
- personal events

Prayer:

- daily prayer schedule

Settings:

- language
- calendar method
- Hijri adjustment
- prayer calculation method
- location
- notification preferences
- theme

---

# 16. ISLAMIC EVENTS

MVP events must include:

- Ramadan
- Eid al-Fitr
- Eid al-Adha
- Arafah
- Ashura
- Islamic New Year

Model Islamic events independently from personal events.

Example:

```text
IslamicEvent
    id
    name
    hijriMonth
    hijriDay
    duration
    source
    region
    calculationMethod
```

Do not hard-code event rendering inside calendar widgets.

---

# 17. PERSONAL EVENTS

Users must be able to:

- create event
- edit event
- delete event
- view event
- configure reminder
- create Gregorian events
- create Hijri recurring events

Example:

```text
Event
    id
    title
    description
    eventType
    calendarType
    startDate
    endDate
    recurrence
    reminder
    createdAt
    updatedAt
```

Support:

```text
GREGORIAN
HIJRI
```

recurrence types where appropriate.

---

# 18. HIJRI RECURRING EVENTS

This is important.

A user's Hijri birthday/anniversary should not be converted once and stored permanently as a Gregorian date.

Instead store the semantic recurrence:

```text
Hijri:
15 Ramadan
Every year
```

Then resolve the Gregorian occurrence using the currently configured Hijri calendar engine.

This prevents incorrect recurrence behavior when the calendar methodology changes.

---

# 19. LOCAL DATABASE

Use:

**Drift + SQLite**

Create relational tables for:

```text
events
event_reminders
calendar_settings
user_settings
locations
prayer_settings
notification_settings
calendar_overrides
```

Use:

- migrations
- indexes
- foreign keys where appropriate
- transactions
- type-safe queries

Do not put everything into a single JSON blob.

---

# 20. DATABASE PRINCIPLES

Use repository interfaces.

Example:

```text
EventRepository
      ↓
EventRepositoryImpl
      ↓
EventDao
      ↓
Drift
      ↓
SQLite
```

Domain code must not directly depend on Drift.

---

# 21. PRAYER TIMES

Prayer calculation should work offline.

Architecture:

```text
Location
   ↓
Coordinates
   ↓
Time Zone
   ↓
Calculation Configuration
   ↓
Prayer Calculation Engine
   ↓
Prayer Times
```

Model:

```text
PrayerTimes
    date
    timezone
    latitude
    longitude

    imsak
    fajr
    sunrise
    dhuhr
    asr
    sunset
    maghrib
    isha
    midnight

    calculationMethod
    asrMethod
    highLatitudeRule
```

---

# 22. PRAYER CALCULATION METHODS

Support configurable methods exposed by the selected prayer library/version.

Potential methods include:

```text
Muslim World League
ISNA
Egyptian
Karachi
Umm al-Qura
Dubai
Moonsighting Committee
Singapore
Custom
```

Also support:

```text
Asr:
Standard / Shafi'i
Hanafi
```

and high latitude rules where supported:

```text
Middle of Night
One Seventh
Angle Based
```

Do not invent methods that are not supported by the actual library.

---

# 23. PRAYER LIBRARY

Select a mature Dart/Flutter prayer calculation package.

Wrap it:

```text
PrayerCalculationEngine
        ↓
PrayerLibraryAdapter
        ↓
Third-party package
```

Document:

- package
- version
- license
- supported methods
- limitations

Write tests against known prayer-time examples.

---

# 24. LOCATION

Do not continuously track GPS.

Initial flow:

```text
First launch
     ↓
Request location permission
     ↓
GPS
     ↓
Coordinates
     ↓
Timezone
     ↓
City
     ↓
Cache
```

If permission is denied:

```text
Select City Manually
```

Store:

```text
latitude
longitude
timezone
city
country
source
```

Possible source values:

```text
GPS
MANUAL
```

The application should continue functioning without GPS.

---

# 25. NOTIFICATIONS

Use local notifications.

Support:

### Event reminders

Example:

```text
Meeting tomorrow at 10:00 AM
```

### Islamic event reminders

Example:

```text
Ramadan begins tomorrow
```

### Daily reminders

Example:

```text
Good morning
Today is 25 Rabi' al-Awwal 1448
```

### Prayer reminders

If prayer functionality is enabled:

```text
Fajr
Dhuhr
Asr
Maghrib
Isha
```

Notification scheduling must be isolated from UI code.

---

# 26. NOTIFICATION ARCHITECTURE

Use:

```text
NotificationService
NotificationScheduler
NotificationPayload
```

Example:

```text
Event
  ↓
Reminder configuration
  ↓
NotificationScheduler
  ↓
Local notification platform
```

Notification payloads should contain stable identifiers rather than large serialized objects.

---

# 27. LOCALIZATION

Support:

```text
English
Arabic
```

Use ARB files.

Example:

```text
app_en.arb
app_ar.arb
```

Do not hard-code UI strings.

All user-facing text must be localized.

---

# 28. RTL / LTR

Arabic:

```text
RTL
```

English:

```text
LTR
```

The entire application must correctly respond to locale direction.

Do not manually reverse layouts unnecessarily.

Use Flutter's localization and directional widgets.

Test:

- Arabic month
- Arabic weekdays
- Arabic numerals if supported by the chosen formatting strategy
- Arabic event names
- Arabic settings
- navigation
- dialogs
- calendar grid

---

# 29. THEME

Use Material 3.

Support:

```text
System
Light
Dark
```

Create centralized design tokens for:

- typography
- spacing
- corner radius
- elevation
- calendar colors
- event colors
- prayer colors

Avoid arbitrary styling repeated throughout widgets.

---

# 30. HOME SCREEN

Create a polished modern home screen.

Structure:

```text
--------------------------------
Good morning

11 September 2026
25 Rabi' al-Awwal 1448

Friday

[ Go to Today ]

Next Prayer
Asr
16:42

Upcoming
----------------
Islamic event
Personal event
----------------
--------------------------------
```

The home screen must be useful without being overloaded.

---

# 31. CALENDAR SCREEN

Design a clean calendar experience.

Include:

```text
< September 2026 >

Gregorian / Hijri / Dual

Mo Tu We Th Fr Sa Su
...
```

Each day can display:

```text
11
25
```

where:

- 11 = Gregorian
- 25 = Hijri

The exact visual design can be refined, but readability is the priority.

Highlight:

- today
- selected day
- Islamic events
- personal events

---

# 32. EVENTS SCREEN

Provide tabs/filters where useful:

```text
All
Islamic
Personal
```

Show upcoming events first.

Allow:

```text
Create Event
Edit
Delete
Reminder
```

Use proper empty states.

---

# 33. PRAYER SCREEN

Display:

```text
Today
Mumbai, India

Fajr       05:12
Sunrise    06:28
Dhuhr      12:35
Asr        16:42
Maghrib    18:44
Isha       20:00
```

Highlight the current/next prayer.

Display calculation method in settings/details.

---

# 34. SETTINGS

Include:

### Language

```text
English
العربية
```

### Calendar

```text
Hijri Method
Hijri Adjustment
Primary Calendar
```

### Prayer

```text
Location
Calculation Method
Asr Method
High Latitude Rule
```

### Notifications

```text
Event reminders
Islamic event reminders
Daily reminder
Prayer reminders
```

### Appearance

```text
System
Light
Dark
```

---

# 35. OFFLINE-FIRST REQUIREMENT

The following MUST work offline:

- Gregorian calendar
- Hijri conversion
- month navigation
- day navigation
- Islamic events
- personal events
- event recurrence
- settings
- prayer calculations
- local notifications

Internet must not be required for these core functions.

---

# 36. NETWORK LAYER

Create the network layer even if the MVP has minimal network requirements.

Potential future responsibilities:

```text
official calendar overrides
regional Islamic dates
data updates
optional synchronization
future cloud backup
```

Do not make the network layer required for MVP calendar functionality.

---

# 37. FUTURE SYNC

Do not implement complex cloud sync in MVP.

However, keep architecture extensible.

Future architecture:

```text
Local Database
      ↕
Sync Manager
      ↕
Sync Queue
      ↕
Remote API
```

Future conflict resolution should be isolated in:

```text
ConflictResolver
```

---

# 38. WHAT NOT TO BUILD

Do NOT implement:

- social features
- community
- chat
- mosque following
- AI assistant
- subscriptions
- complex cloud synchronization
- web application
- admin dashboard
- analytics
- recommendation engine
- multi-device sync
- advanced astronomical moon-sighting engine
- country-specific holiday engine for hundreds of countries

Keep MVP focused.

---

# 39. CODE QUALITY

Follow strong Dart/Flutter conventions.

Requirements:

- null safety
- immutable domain models where practical
- dependency injection
- repository pattern
- meaningful names
- small cohesive classes
- no duplicated business logic
- no magic numbers
- no magic strings
- no unnecessary global state
- no business logic inside widgets

Use linting.

Run:

```bash
flutter analyze
```

and fix all issues.

---

# 40. ERROR HANDLING

Create application-level error types.

Examples:

```text
CalendarCalculationException
DatabaseException
LocationException
NotificationException
PrayerCalculationException
InvalidHijriDateException
```

Do not expose raw third-party exceptions directly to presentation code.

---

# 41. LOGGING

Create centralized logging.

Log:

- application lifecycle events
- database failures
- calendar calculation failures
- notification scheduling failures
- location failures
- unexpected errors

Do not log sensitive personal data unnecessarily.

---

# 42. TESTING

Testing is mandatory.

Create:

## Unit Tests

For:

- Gregorian → Hijri
- Hijri → Gregorian
- leap years
- month lengths
- Hijri adjustment
- different calendar methods
- recurring Hijri events
- prayer calculations
- event recurrence
- date boundaries
- timezone behavior

## Repository Tests

Test:

- insert
- update
- delete
- query
- transactions
- migrations

## Widget Tests

Test:

- calendar rendering
- date selection
- navigation
- event display
- language switching

## Integration Tests

Test:

```text
Launch
→ Select date
→ Convert calendar
→ Create event
→ Schedule reminder
→ Navigate calendar
```

---

# 43. CALENDAR TEST STRATEGY

Calendar correctness is critical.

Create test vectors containing known:

```text
Gregorian date
expected Hijri date
calendar method
expected result
```

Test edge cases:

- year boundaries
- month boundaries
- leap years
- Ramadan
- Muharram
- 29/30-day months
- timezone transitions
- Hijri adjustment
- date conversion in both directions

Do not rely only on random tests.

---

# 44. PERFORMANCE

The calendar should feel instant.

Avoid:

- unnecessary rebuilds
- recalculating an entire year when one day is selected
- repeated database queries
- repeated location calls
- unnecessary network requests

Use Riverpod selectors/providers appropriately.

Cache expensive calculations where beneficial.

---

# 45. ACCESSIBILITY

Support:

- semantic labels
- readable text sizes
- sufficient touch target sizes
- screen readers
- accessibility-friendly contrast
- dynamic text where practical

Calendar dates must remain understandable to screen-reader users.

---

# 46. SECURITY / PRIVACY

The MVP should be privacy-friendly.

Personal events remain local.

Do not transmit user events to a server unless explicitly required by a future feature.

Location should only be collected when necessary for prayer calculations.

Do not continuously track location.

---

# 47. DEVELOPMENT PHASES

Implement in this order.

## Phase 1 — Project Foundation

Create:

- Flutter project
- architecture
- routing
- theme
- Riverpod
- localization
- database
- logging
- error handling

Make sure the project runs.

---

## Phase 2 — Calendar Engine

Implement:

- GregorianDate
- HijriDate
- conversion interfaces
- selected Hijri implementation
- adjustment system
- calendar method abstraction
- test vectors

This phase has priority over UI polish.

---

## Phase 3 — Calendar UI

Implement:

- Home
- Calendar
- Today
- month view
- day view
- navigation
- dual date display

---

## Phase 4 — Islamic Events

Implement:

- Ramadan
- Eid al-Fitr
- Eid al-Adha
- Arafah
- Ashura
- Islamic New Year

---

## Phase 5 — Personal Events

Implement:

- CRUD
- Gregorian events
- Hijri recurring events
- reminders

---

## Phase 6 — Prayer

Implement:

- location
- manual city selection
- prayer engine
- calculation methods
- prayer screen
- next prayer

---

## Phase 7 — Notifications

Implement:

- event reminders
- daily reminders
- Islamic event reminders
- prayer reminders

---

## Phase 8 — Localization

Complete:

- English
- Arabic
- RTL
- LTR
- localized date formatting

---

## Phase 9 — Testing

Run:

```bash
flutter analyze
flutter test
```

Then integration tests.

---

# 48. DEVELOPMENT RULES FOR THE CODING AGENT

You are not allowed to blindly generate the entire application in one pass.

Work incrementally.

For each phase:

1. Inspect the existing project.
2. Understand existing code.
3. Create/update architecture.
4. Implement the feature.
5. Write tests.
6. Run analyzer.
7. Run tests.
8. Fix failures.
9. Review for architectural violations.
10. Continue to the next phase.

Never overwrite working code unnecessarily.

Never create duplicate implementations of the same domain logic.

Before adding a dependency, verify that it is actually necessary.

---

# 49. DEPENDENCY RULE

Before installing any package:

Evaluate:

- maintenance status
- pub.dev popularity
- latest compatible version
- license
- platform support
- Dart compatibility
- Flutter compatibility
- known limitations

Use the package only when it provides meaningful value.

Wrap important third-party functionality behind application interfaces.

---

# 50. REQUIRED DOCUMENTATION

Create:

```text
README.md
ARCHITECTURE.md
CALENDAR_ENGINE.md
DATABASE.md
NOTIFICATIONS.md
PRAYER_CALCULATIONS.md
LOCALIZATION.md
TESTING.md
```

Document important architectural decisions.

---

# 51. ACCEPTANCE CRITERIA

The MVP is complete only when:

### Calendar

- Gregorian calendar works
- Hijri calendar works
- Gregorian → Hijri works
- Hijri → Gregorian works
- month view works
- day view works
- Today works
- navigation works
- current date is highlighted

### Islamic Data

- major Islamic events are displayed
- Ramadan is supported
- Eid al-Fitr is supported
- Eid al-Adha is supported
- Arafah is supported
- Ashura is supported
- Islamic New Year is supported
- Hijri adjustment works

### Events

- create works
- edit works
- delete works
- Gregorian events work
- Hijri recurring events work
- reminders work

### Prayer

- prayer calculations work offline
- location works
- manual location works
- next prayer works
- calculation settings work

### Localization

- English works
- Arabic works
- RTL works
- LTR works

### Offline

Core functionality works with network disabled.

### Quality

```bash
flutter analyze
```

returns no errors.

```bash
flutter test
```

passes.

---

# 52. IMPORTANT PRODUCT PRINCIPLE

The application must distinguish between:

```text
Calculated
Observed
Official
Regional
User Adjusted
```

Never represent a calculated Islamic date as universally authoritative.

The calendar engine must remain replaceable.

The database must remain local-first.

The UI must remain independent of calculation libraries.

The architecture must allow future:

- official regional overrides
- cloud sync
- additional calendar systems
- additional languages
- additional prayer methods
- server-side data verification

without rewriting the core application.

---

# 53. FIRST TASK

Before writing implementation code:

1. Inspect the repository.
2. Determine whether a Flutter project already exists.
3. If it does not exist, initialize the Flutter project.
4. Create the architecture described above.
5. Configure dependencies.
6. Configure Riverpod.
7. Configure Drift.
8. Configure localization.
9. Configure routing.
10. Configure Material 3 theme.
11. Create the initial application shell.
12. Create Home, Calendar, Events, Prayer and Settings routes.
13. Add basic placeholder screens.
14. Run the application.
15. Run `flutter analyze`.
16. Run tests.
17. Report exactly what was created and any issues.

Do NOT implement advanced features until the foundation builds successfully.

After the foundation is verified, proceed phase-by-phase.

# FINAL PRINCIPLE

Build this as a **real production application**, not a demo.

Prioritize:

1. Calendar correctness
2. Offline reliability
3. Clean architecture
4. Testability
5. Localization
6. Maintainability
7. Performance
8. UI polish

Do not sacrifice domain correctness for visual shortcuts.