import 'package:freezed_annotation/freezed_annotation.dart';
import '../../workout_builder/domain/workout_exercise.dart';

part 'workout_summary.freezed.dart';
part 'workout_summary.g.dart';

@freezed
class WorkoutSummary with _$WorkoutSummary {
  const factory WorkoutSummary({
    required int durationSec,
    required double totalVolumeKg,
    required int totalSets,
    required int totalReps,
    required int totalRestSec,
    required int caloriesBurned,
    required List<WorkoutExercise> exercises,
    required DateTime startedAt,
    String? title,
    String? notes,
  }) = _WorkoutSummary;

  factory WorkoutSummary.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSummaryFromJson(json);
}
