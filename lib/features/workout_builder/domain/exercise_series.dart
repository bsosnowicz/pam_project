import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_series.freezed.dart';
part 'exercise_series.g.dart';

@freezed
class ExerciseSeries with _$ExerciseSeries {
  const factory ExerciseSeries({
    required String id,
    required int setNumber,
    required int reps,
    required double weightKg,
    @Default(false) bool completed,
    int? durationSec,
  }) = _ExerciseSeries;

  factory ExerciseSeries.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSeriesFromJson(json);
}
