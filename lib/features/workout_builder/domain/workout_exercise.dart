import 'package:freezed_annotation/freezed_annotation.dart';
import 'exercise_series.dart';

part 'workout_exercise.freezed.dart';
part 'workout_exercise.g.dart';

@freezed
class WorkoutExercise with _$WorkoutExercise {
  const factory WorkoutExercise({
    required String id,
    required String exerciseName,
    required int restSeconds,
    required List<ExerciseSeries> series,
    int? position,
  }) = _WorkoutExercise;

  factory WorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$WorkoutExerciseFromJson(json);
}
