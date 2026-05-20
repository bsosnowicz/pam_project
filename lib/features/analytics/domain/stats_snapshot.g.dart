// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChartDataPointImpl _$$ChartDataPointImplFromJson(Map<String, dynamic> json) =>
    _$ChartDataPointImpl(
      date: DateTime.parse(json['date'] as String),
      value: (json['value'] as num).toDouble(),
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$ChartDataPointImplToJson(
        _$ChartDataPointImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'value': instance.value,
      'label': instance.label,
    };

_$StatsSnapshotImpl _$$StatsSnapshotImplFromJson(Map<String, dynamic> json) =>
    _$StatsSnapshotImpl(
      period: json['period'] as String,
      totalWorkouts: (json['totalWorkouts'] as num).toInt(),
      avgDurationMin: (json['avgDurationMin'] as num).toDouble(),
      avgCalories: (json['avgCalories'] as num).toDouble(),
      totalVolumeKg: (json['totalVolumeKg'] as num).toDouble(),
      volumeHistory: (json['volumeHistory'] as List<dynamic>)
          .map((e) => ChartDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      strengthProgress: (json['strengthProgress'] as List<dynamic>)
          .map((e) => ChartDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StatsSnapshotImplToJson(_$StatsSnapshotImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'totalWorkouts': instance.totalWorkouts,
      'avgDurationMin': instance.avgDurationMin,
      'avgCalories': instance.avgCalories,
      'totalVolumeKg': instance.totalVolumeKg,
      'volumeHistory': instance.volumeHistory,
      'strengthProgress': instance.strengthProgress,
    };
