import 'package:freezed_annotation/freezed_annotation.dart';
import '../../workout_builder/domain/workout_exercise.dart';
import '../../workout_summary/domain/workout_summary.dart';

part 'live_session_state.freezed.dart';

@freezed
class LiveSessionState with _$LiveSessionState {
  const factory LiveSessionState.idle() = LiveIdle;

  const factory LiveSessionState.active({
    required List<WorkoutExercise> exercises,
    required int currentExerciseIndex,
    required int currentSeriesIndex,
    required DateTime startedAt,
    required bool isResting,
    required int restSecondsRemaining,
    required int elapsedSec,
  }) = LiveActive;

  const factory LiveSessionState.paused({
    required List<WorkoutExercise> exercises,
    required int currentExerciseIndex,
    required int currentSeriesIndex,
    required DateTime startedAt,
    required int elapsedSec,
  }) = LivePaused;

  const factory LiveSessionState.finished({
    required WorkoutSummary summary,
  }) = LiveFinished;
}
