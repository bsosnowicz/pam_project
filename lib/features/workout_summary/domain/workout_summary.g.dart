// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSummaryImpl _$$WorkoutSummaryImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutSummaryImpl(
      durationSec: (json['durationSec'] as num).toInt(),
      totalVolumeKg: (json['totalVolumeKg'] as num).toDouble(),
      totalSets: (json['totalSets'] as num).toInt(),
      totalReps: (json['totalReps'] as num).toInt(),
      totalRestSec: (json['totalRestSec'] as num).toInt(),
      caloriesBurned: (json['caloriesBurned'] as num).toInt(),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => WorkoutExercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      startedAt: DateTime.parse(json['startedAt'] as String),
      title: json['title'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$WorkoutSummaryImplToJson(
        _$WorkoutSummaryImpl instance) =>
    <String, dynamic>{
      'durationSec': instance.durationSec,
      'totalVolumeKg': instance.totalVolumeKg,
      'totalSets': instance.totalSets,
      'totalReps': instance.totalReps,
      'totalRestSec': instance.totalRestSec,
      'caloriesBurned': instance.caloriesBurned,
      'exercises': instance.exercises,
      'startedAt': instance.startedAt.toIso8601String(),
      'title': instance.title,
      'notes': instance.notes,
    };
