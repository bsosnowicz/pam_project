// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutExerciseImpl _$$WorkoutExerciseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutExerciseImpl(
      id: json['id'] as String,
      exerciseName: json['exerciseName'] as String,
      restSeconds: (json['restSeconds'] as num).toInt(),
      series: (json['series'] as List<dynamic>)
          .map((e) => ExerciseSeries.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: (json['position'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WorkoutExerciseImplToJson(
        _$WorkoutExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exerciseName': instance.exerciseName,
      'restSeconds': instance.restSeconds,
      'series': instance.series,
      'position': instance.position,
    };
