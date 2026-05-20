import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_snapshot.freezed.dart';
part 'stats_snapshot.g.dart';

@freezed
class ChartDataPoint with _$ChartDataPoint {
  const factory ChartDataPoint({
    required DateTime date,
    required double value,
    String? label,
  }) = _ChartDataPoint;

  factory ChartDataPoint.fromJson(Map<String, dynamic> json) =>
      _$ChartDataPointFromJson(json);
}

@freezed
class StatsSnapshot with _$StatsSnapshot {
  const factory StatsSnapshot({
    required String period,
    required int totalWorkouts,
    required double avgDurationMin,
    required double avgCalories,
    required double totalVolumeKg,
    required List<ChartDataPoint> volumeHistory,
    required List<ChartDataPoint> strengthProgress,
  }) = _StatsSnapshot;

  factory StatsSnapshot.fromJson(Map<String, dynamic> json) =>
      _$StatsSnapshotFromJson(json);
}
