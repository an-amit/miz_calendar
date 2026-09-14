/// Seed catalogue of canonical Islamic events and holidays.
library;

import '../domain/event_day_boundary.dart';
import '../domain/islamic_event.dart';

abstract final class IslamicEventsSeed {
  IslamicEventsSeed._();

  static const List<IslamicEvent> events = [
    // 1. Islamic New Year (1 Muharram)
    IslamicEvent(
      id: 'islamic_new_year',
      nameKey: 'eventIslamicNewYear',
      descriptionKey: 'eventIslamicNewYearDesc',
      hijriMonth: 1,
      hijriDay: 1,
      isMajor: true,
      dayBoundary: EventDayBoundary.sunsetBased,
    ),

    // 2. Day of Ashura (10 Muharram)
    IslamicEvent(
      id: 'ashura',
      nameKey: 'eventAshura',
      descriptionKey: 'eventAshuraDesc',
      hijriMonth: 1,
      hijriDay: 10,
    ),

    // 3. Mawlid al-Nabi (12 Rabi al-Awwal)
    IslamicEvent(
      id: 'mawlid_al_nabi',
      nameKey: 'eventMawlidAlNabi',
      descriptionKey: 'eventMawlidAlNabiDesc',
      hijriMonth: 3,
      hijriDay: 12,
    ),

    // 4. Isra and Mi'raj (27 Rajab)
    IslamicEvent(
      id: 'isra_wal_miraj',
      nameKey: 'eventIsraWalMiraj',
      descriptionKey: 'eventIsraWalMirajDesc',
      hijriMonth: 7,
      hijriDay: 27,
      dayBoundary: EventDayBoundary.sunsetBased,
    ),

    // 5. Mid-Sha'ban (15 Sha'ban)
    IslamicEvent(
      id: 'nisf_shaban',
      nameKey: 'eventNisfShaban',
      descriptionKey: 'eventNisfShabanDesc',
      hijriMonth: 8,
      hijriDay: 15,
      dayBoundary: EventDayBoundary.sunsetBased,
    ),

    // 6. First day of Ramadan (1 Ramadan)
    IslamicEvent(
      id: 'ramadan_start',
      nameKey: 'eventRamadan',
      descriptionKey: 'eventRamadanDesc',
      hijriMonth: 9,
      hijriDay: 1,
      durationDays: 30,
      isMajor: true,
      dayBoundary: EventDayBoundary.moonSightingBased,
    ),

    // 7. Laylat al-Qadr (observed 27 Ramadan)
    IslamicEvent(
      id: 'laylat_al_qadr',
      nameKey: 'eventLaylatAlQadr',
      descriptionKey: 'eventLaylatAlQadrDesc',
      hijriMonth: 9,
      hijriDay: 27,
      isMajor: true,
      dayBoundary: EventDayBoundary.sunsetBased,
    ),

    // 8. Eid al-Fitr (1 Shawwal)
    IslamicEvent(
      id: 'eid_al_fitr',
      nameKey: 'eventEidAlFitr',
      descriptionKey: 'eventEidAlFitrDesc',
      hijriMonth: 10,
      hijriDay: 1,
      durationDays: 3,
      isMajor: true,
      dayBoundary: EventDayBoundary.moonSightingBased,
    ),

    // 9. Day of Tarwiyah (8 Dhul-Hijja)
    IslamicEvent(
      id: 'day_of_tarwiyah',
      nameKey: 'eventDayOfTarwiyah',
      descriptionKey: 'eventDayOfTarwiyahDesc',
      hijriMonth: 12,
      hijriDay: 8,
    ),

    // 10. Day of Arafah (9 Dhul-Hijja)
    IslamicEvent(
      id: 'day_of_arafah',
      nameKey: 'eventDayOfArafah',
      descriptionKey: 'eventDayOfArafahDesc',
      hijriMonth: 12,
      hijriDay: 9,
      isMajor: true,
    ),

    // 11. Eid al-Adha (10 Dhul-Hijja)
    IslamicEvent(
      id: 'eid_al_adha',
      nameKey: 'eventEidAlAdha',
      descriptionKey: 'eventEidAlAdhaDesc',
      hijriMonth: 12,
      hijriDay: 10,
      durationDays: 4,
      isMajor: true,
    ),

    // 12. Days of Tashreeq (11-13 Dhul-Hijja)
    IslamicEvent(
      id: 'days_of_tashreeq',
      nameKey: 'eventDaysOfTashreeq',
      descriptionKey: 'eventDaysOfTashreeqDesc',
      hijriMonth: 12,
      hijriDay: 11,
      durationDays: 3,
    ),
  ];
}
