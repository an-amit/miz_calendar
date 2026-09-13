/// Domain model representing a user-configured Hijri date adjustment.
///
/// In Islamic calendar practice, moon-sighting observations in different regions
/// may differ from algorithmic/astronomical calculations by ±1 or ±2 days.
library;

import 'package:meta/meta.dart';

@immutable
final class HijriAdjustment {
  const HijriAdjustment(this.days)
      : assert(days >= -2 && days <= 2, 'Adjustment must be between -2 and +2 days');

  /// Zero adjustment (standard algorithmic date).
  static const HijriAdjustment zero = HijriAdjustment(0);

  /// Number of days to adjust (can be -2, -1, 0, +1, +2).
  final int days;

  /// Returns true if an adjustment is actively configured.
  bool get hasAdjustment => days != 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HijriAdjustment &&
          runtimeType == other.runtimeType &&
          days == other.days;

  @override
  int get hashCode => days.hashCode;

  @override
  String toString() => days >= 0 ? '+$days' : '$days';
}
