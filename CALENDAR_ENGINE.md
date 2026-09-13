# Mīzān Calendar Engine Documentation

## 1. Overview

The **Mīzān Calendar Engine** provides offline, mathematically rigorous conversion and navigation between the Gregorian and Islamic (Hijri) calendar systems.

In accordance with core architectural principles:
- The domain layer is **completely isolated** from third-party calculation packages.
- Calendar operations **never depend on network connectivity**.
- The architecture treats `Instant`, `TimeZone`, `LocalDateTime`, `GregorianDate`, and `HijriDate` as distinct domain types rather than conflating them with Dart's `DateTime`.

---

## 2. Architecture

```
Presentation / Application Layer
             ↓
     CalendarConverter
             ↓
    HijriCalendarEngine (Interface)
             ↓
  ┌──────────────────────┬──────────────────────┬─────────────────────────┬──────────────────────┐
  │   UmmAlQuraEngine    │  TabularCivilEngine  │ TabularAstronomicalEngine│   AdjustedEngine     │
  │      (Adapter)       │  (Pure Arithmetic)   │    (Pure Arithmetic)    │     (Decorator)      │
  └──────────┬───────────┴──────────────────────┴─────────────────────────┴──────────┬───────────┘
             ↓                                                                       │
      hijri package                                                       Wraps any Base Engine
   (hijri_calendar.dart)                                                 with ±1 or ±2 day shift
```

---

## 3. Package Selection & Rationale

| Attribute | Details |
|---|---|
| **Package** | `hijri: ^3.0.1` |
| **Publisher / Maintainer** | `ahmedoid` / pub.dev |
| **License** | BSD-2-Clause |
| **Null Safety** | Full Dart 3 null-safety |
| **Methodology** | Saudi Arabian Umm al-Qura calendar table / astronomical algorithm |
| **Role in Mīzān** | Internal implementation detail of `UmmAlQuraEngine` adapter |

### Rationale:
- `hijri` is the most established Umm al-Qura calculation package on pub.dev (40k+ monthly downloads).
- It is wrapped strictly behind `UmmAlQuraEngine implements HijriCalendarEngine`. No widget or business service imports `package:hijri` directly.
- In parallel, `TabularCivilEngine` and `TabularAstronomicalEngine` are built with **zero external dependencies** using pure Julian Day Number mathematics, ensuring guaranteed fallback and multi-methodology support.

---

## 4. Supported Calculation Methodologies

### 1. Umm al-Qura (`UMM_AL_QURA`)
- Based on the official calendar of Saudi Arabia.
- Follows the lunar phase calculation calculated for the coordinates of Mecca.
- Month lengths are 29 or 30 days based on astronomical new moon conjunction before sunset.

### 2. Tabular Civil (`TABULAR_CIVIL`)
- Also known as the arithmetic or Kuwaiti algorithm.
- Follows a 30-year cycle with 11 leap years (years 2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29).
- Leap years have 355 days (Dhul-Hijja has 30 days instead of 29).
- Epoch: Julian Day Number `1948440` (16 July 622 CE civil).

### 3. Tabular Astronomical (`TABULAR_ASTRONOMICAL`)
- Follows the same 30-year cycle but with leap year in year 15 instead of 16 (years 2, 5, 7, 10, 13, 15, 18, 21, 24, 26, 29).
- Epoch: Julian Day Number `1948439` (15 July 622 CE astronomical).

### 4. User Adjusted (`AdjustedEngine`)
- Decorates any active engine by shifting the input civil date by `[-2, +2]` days.
- Invertible: `toGregorian(fromGregorian(date)) == date`.
- Tags output `HijriDate` instances with `source: HijriDateSource.userAdjusted`.

---

## 5. Timezone Handling Pipeline

Calendar dates and instants are never mixed:

```
Instant (UTC timestamp)
   ↓
TimeZone (IANA ID + offset)
   ↓
LocalDateTime (civil date + civil time)
   ↓
GregorianDate (year, month, day)
   ↓
HijriDate (year, month, day, source, method)
```

No calculation assumes UTC midnight as equivalent to local civil day boundaries.

---

## 6. Test Strategy & Reference Vectors

Comprehensive unit tests in `test/calendar_engine/` verify:
1. **Fliegel & Van Flandern JDN algorithm**: Reference JDN 2451545 (2000-01-01) and 2299161 (1582-10-15).
2. **Umm al-Qura conversion vectors**:
   - 2026-09-11 ↔ 1448-03-29
   - 2024-03-11 ↔ 1445-09-01 (1 Ramadan 1445)
   - 2024-04-10 ↔ 1445-10-01 (1 Shawwal 1445 / Eid al-Fitr)
   - 2024-06-16 ↔ 1445-12-10 (10 Dhul-Hijja 1445 / Eid al-Adha)
   - 2024-07-07 ↔ 1446-01-01 (Islamic New Year 1446)
3. **Bi-directional symmetry**: `engine.toGregorian(engine.fromGregorian(d)) == d`.
4. **Leap year consistency**: 30-year cycle assertions for tabular engines.
5. **Adjustment boundaries**: `AdjustedEngine` applying ±1 and ±2 shifts across month/year edges.
