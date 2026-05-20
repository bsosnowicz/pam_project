// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseSeriesImpl _$$ExerciseSeriesImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseSeriesImpl(
      id: json['id'] as String,
      setNumber: (json['setNumber'] as num).toInt(),
      reps: (json['reps'] as num).toInt(),
      weightKg: (json['weightKg'] as num).toDouble(),
      completed: json['completed'] as bool? ?? false,
      durationSec: (json['durationSec'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ExerciseSeriesImplToJson(
        _$ExerciseSeriesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'setNumber': instance.setNumber,
      'reps': instance.reps,
      'weightKg': instance.weightKg,
      'completed': instance.completed,
      'durationSec': instance.durationSec,
    };
