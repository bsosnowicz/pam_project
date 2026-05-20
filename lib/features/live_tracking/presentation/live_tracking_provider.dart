import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../workout_builder/domain/workout_exercise.dart';
import '../../workout_builder/presentation/builder_provider.dart';
import '../../workout_summary/domain/workout_summary.dart';
import '../domain/live_session_state.dart';
import '../../../core/utils/calorie_calculator.dart';
import '../../../features/profile/presentation/profile_provider.dart';

part 'live_tracking_provider.g.dart';

@Riverpod(keepAlive: true)
class LiveTrackingNotifier extends _$LiveTrackingNotifier {
  Timer? _clockTimer;
  Timer? _restTimer;

  @override
  LiveSessionState build() => const LiveSessionState.idle();

  void startWorkout(List<WorkoutExercise> exercises) {
    state = LiveSessionState.active(
      exercises: exercises,
      currentExerciseIndex: 0,
      currentSeriesIndex: 0,
      startedAt: DateTime.now(),
      isResting: false,
      restSecondsRemaining: 0,
      elapsedSec: 0,
    );
    _startClock();
  }

  void completeSeries(int exerciseIdx, int seriesIdx) {
    final s = state;
    if (s is! LiveActive) return;

    // Mark series as completed
    final exercises = s.exercises.map((e) {
      if (s.exercises.indexOf(e) != exerciseIdx) return e;
      return e.copyWith(
        series: e.series.map((series) {
          if (e.series.indexOf(series) != seriesIdx) return series;
          return series.copyWith(completed: true);
        }).toList(),
      );
    }).toList();

    final currentExercise = exercises[exerciseIdx];
    final allSeriesDone = currentExercise.series.every((s) => s.completed);
    final isLastExercise = exerciseIdx == exercises.length - 1;

    if (allSeriesDone && isLastExercise) {
      // All done, no rest needed — just update state
      state = s.copyWith(exercises: exercises);
      return;
    }

    // Start rest timer
    _restTimer?.cancel();
    final restSeconds = currentExercise.restSeconds;
    state = s.copyWith(
      exercises: exercises,
      isResting: true,
      restSecondsRemaining: restSeconds,
    );
    _startRestTimer(exercises, exerciseIdx, seriesIdx, restSeconds);
  }

  void skipRest() {
    final s = state;
    if (s is! LiveActive || !s.isResting) return;
    _restTimer?.cancel();
    _advanceToNextSeries(s.exercises, s.currentExerciseIndex, s.currentSeriesIndex);
  }

  void pauseWorkout() {
    final s = state;
    if (s is! LiveActive) return;
    _clockTimer?.cancel();
    _restTimer?.cancel();
    state = LiveSessionState.paused(
      exercises: s.exercises,
      currentExerciseIndex: s.currentExerciseIndex,
      currentSeriesIndex: s.currentSeriesIndex,
      startedAt: s.startedAt,
      elapsedSec: s.elapsedSec,
    );
  }

  void resumeWorkout() {
    final s = state;
    if (s is! LivePaused) return;
    state = LiveSessionState.active(
      exercises: s.exercises,
      currentExerciseIndex: s.currentExerciseIndex,
      currentSeriesIndex: s.currentSeriesIndex,
      startedAt: s.startedAt,
      isResting: false,
      restSecondsRemaining: 0,
      elapsedSec: s.elapsedSec,
    );
    _startClock();
  }

  void finishWorkout() {
    final s = state;
    if (s is! LiveActive && s is! LivePaused) return;
    _clockTimer?.cancel();
    _restTimer?.cancel();

    final (exercises, startedAt, elapsedSec) = switch (s) {
      LiveActive(:final exercises, :final startedAt, :final elapsedSec) =>
        (exercises, startedAt, elapsedSec),
      LivePaused(:final exercises, :final startedAt, :final elapsedSec) =>
        (exercises, startedAt, elapsedSec),
      _ => ([], DateTime.now(), 0),
    };

    final completedSets = exercises
        .expand((e) => e.series)
        .where((s) => s.completed)
        .toList();

    final totalVolume = computeTotalVolume(
      completedSets.map((s) => (reps: s.reps, weightKg: s.weightKg)),
    );

    final totalRestSec = exercises.fold<int>(
      0,
      (sum, e) => sum + (e.series.where((s) => s.completed).length * e.restSeconds),
    );

    final profile = ref.read(profileNotifierProvider).valueOrNull;
    final weightKg = profile?.weightKg ?? 75.0;

    final calories = calculateCalories(
      weightKg: weightKg,
      durationSec: elapsedSec,
      totalVolumeKg: totalVolume,
      restSec: totalRestSec,
    );

    state = LiveSessionState.finished(
      summary: WorkoutSummary(
        durationSec: elapsedSec,
        totalVolumeKg: totalVolume,
        totalSets: completedSets.length,
        totalReps: completedSets.fold(0, (sum, s) => sum + s.reps),
        totalRestSec: totalRestSec,
        caloriesBurned: calories,
        exercises: exercises,
        startedAt: startedAt,
      ),
    );
  }

  void reset() {
    _clockTimer?.cancel();
    _restTimer?.cancel();
    state = const LiveSessionState.idle();
    ref.read(workoutBuilderNotifierProvider.notifier).reset();
  }

  // -----------------------------------------------------------------------

  void _startClock() {
    _clockTimer?.cancel();
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final s = state;
      if (s is LiveActive) {
        state = s.copyWith(elapsedSec: s.elapsedSec + 1);
      }
    });
  }

  void _startRestTimer(
    List<WorkoutExercise> exercises,
    int exerciseIdx,
    int seriesIdx,
    int restSeconds,
  ) {
    int remaining = restSeconds;
    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remaining--;
      final s = state;
      if (s is LiveActive) {
        if (remaining <= 0) {
          timer.cancel();
          _advanceToNextSeries(exercises, exerciseIdx, seriesIdx);
        } else {
          state = s.copyWith(restSecondsRemaining: remaining);
        }
      } else {
        timer.cancel();
      }
    });
  }

  void _advanceToNextSeries(
    List<WorkoutExercise> exercises,
    int exerciseIdx,
    int seriesIdx,
  ) {
    final s = state;
    if (s is! LiveActive) return;

    final currentExercise = exercises[exerciseIdx];
    final nextSeriesIdx = seriesIdx + 1;

    if (nextSeriesIdx < currentExercise.series.length) {
      state = s.copyWith(
        exercises: exercises,
        currentSeriesIndex: nextSeriesIdx,
        isResting: false,
        restSecondsRemaining: 0,
      );
    } else {
      // Move to next exercise
      final nextExerciseIdx = exerciseIdx + 1;
      if (nextExerciseIdx < exercises.length) {
        state = s.copyWith(
          exercises: exercises,
          currentExerciseIndex: nextExerciseIdx,
          currentSeriesIndex: 0,
          isResting: false,
          restSecondsRemaining: 0,
        );
      } else {
        // All done
        state = s.copyWith(
          exercises: exercises,
          isResting: false,
          restSecondsRemaining: 0,
        );
      }
    }
  }
}
