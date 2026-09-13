/// Domain model representing an Islamic (Hijri) calendar date.
library;

import 'package:meta/meta.dart';

/// The authority or source of the Hijri date.
enum HijriDateSource {
  calculated,
  official,
  observed,
  userAdjusted,
  regional,
}

@immutable
final class HijriDate implements Comparable<HijriDate> {
  const HijriDate({
    required this.year,
    required this.month,
    required this.day,
    this.source = HijriDateSource.calculated,
    this.method = 'UMM_AL_QURA',
    this.region,
    this.metadata = const {},
  })  : assert(month >= 1 && month <= 12, 'Hijri month must be between 1 and 12'),
        assert(day >= 1 && day <= 30, 'Hijri day must be between 1 and 30');

  final int year;
  final int month;
  final int day;
  final HijriDateSource source;
  final String method;
  final String? region;
  final Map<String, Object?> metadata;

  /// English transliterated month names.
  static const List<String> monthNamesEn = [
    'Muharram',
    'Safar',
    "Rabi' al-Awwal",
    "Rabi' al-Thani",
    'Jumada al-Ula',
    'Jumada al-Akhira',
    'Rajab',
    "Sha'ban",
    'Ramadan',
    'Shawwal',
    "Dhul-Qa'dah",
    'Dhul-Hijja',
  ];

  /// Arabic month names.
  static const List<String> monthNamesAr = [
    'مُحرَّم',
    'صَفَر',
    'رَبيع الأوَّل',
    'رَبيع الثاني',
    'جُمادى الأولى',
    'جُمادى الآخِرة',
    'رَجَب',
    'شَعبان',
    'رَمَضان',
    'شَوَّال',
    'ذُو القَعدة',
    'ذُو الحِجَّة',
  ];

  /// Transliterated English month name for this date.
  String get monthNameEn => monthNamesEn[month - 1];

  /// Arabic month name for this date.
  String get monthNameAr => monthNamesAr[month - 1];

  /// Returns a formatted representation: e.g. "25 Rabi' al-Awwal 1448 AH".
  String formatEn({bool includeSuffix = true}) =>
      '$day $monthNameEn $year${includeSuffix ? ' AH' : ''}';

  /// Returns an Arabic formatted representation: e.g. "25 رَبيع الأوَّل 1448 هـ".
  String formatAr({bool includeSuffix = true}) =>
      '$day $monthNameAr $year${includeSuffix ? ' هـ' : ''}';

  /// Creates a copy with the given fields replaced.
  HijriDate copyWith({
    int? year,
    int? month,
    int? day,
    HijriDateSource? source,
    String? method,
    String? region,
    Map<String, Object?>? metadata,
  }) =>
      HijriDate(
        year: year ?? this.year,
        month: month ?? this.month,
        day: day ?? this.day,
        source: source ?? this.source,
        method: method ?? this.method,
        region: region ?? this.region,
        metadata: metadata ?? this.metadata,
      );

  @override
  int compareTo(HijriDate other) {
    if (year != other.year) return year.compareTo(other.year);
    if (month != other.month) return month.compareTo(other.month);
    return day.compareTo(other.day);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HijriDate &&
          runtimeType == other.runtimeType &&
          year == other.year &&
          month == other.month &&
          day == other.day &&
          source == other.source &&
          method == other.method &&
          region == other.region;

  @override
  int get hashCode => Object.hash(year, month, day, source, method, region);

  @override
  String toString() => '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')} ($method/$source)';
}
