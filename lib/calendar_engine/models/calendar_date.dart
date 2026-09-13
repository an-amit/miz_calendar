/// Combined dual calendar date representing both Gregorian and Hijri views of a day.
library;

import 'package:meta/meta.dart';
import 'gregorian_date.dart';
import 'hijri_date.dart';

@immutable
final class CalendarDate implements Comparable<CalendarDate> {
  const CalendarDate({
    required this.gregorian,
    required this.hijri,
  });

  final GregorianDate gregorian;
  final HijriDate hijri;

  @override
  int compareTo(CalendarDate other) => gregorian.compareTo(other.gregorian);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarDate &&
          runtimeType == other.runtimeType &&
          gregorian == other.gregorian &&
          hijri == other.hijri;

  @override
  int get hashCode => Object.hash(gregorian, hijri);

  @override
  String toString() => 'CalendarDate(G: $gregorian, H: ${hijri.formatEn()})';
}
