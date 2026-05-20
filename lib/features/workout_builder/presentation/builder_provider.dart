import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../domain/exercise_series.dart';
import '../domain/workout_exercise.dart';
import '../../../core/constants/app_constants.dart';

part 'builder_provider.g.dart';

const _uuid = Uuid();

@riverpod
class WorkoutBuilderNotifier extends _$WorkoutBuilderNotifier {
  @override
  List<WorkoutExercise> build() => [];

  void addExercise() {
    final exercise = WorkoutExercise(
      id: _uuid.v4(),
      exerciseName: '',
      restSeconds: AppConstants.defaultRestSeconds,
      series: [_newSeries(1)],
    );
    state = [...state, exercise];
  }

  void removeExercise(String id) {
    state = state.where((e) => e.id != id).toList();
  }

  void updateExerciseName(String id, String name) {
    state = state
        .map((e) => e.id == id ? e.copyWith(exerciseName: name) : e)
        .toList();
  }

  void updateRestSeconds(String id, int seconds) {
    state = state
        .map((e) => e.id == id ? e.copyWith(restSeconds: seconds) : e)
        .toList();
  }

  void addSeries(String exerciseId) {
    state = state.map((e) {
      if (e.id != exerciseId) return e;
      final nextNum = e.series.length + 1;
      return e.copyWith(series: [...e.series, _newSeries(nextNum)]);
    }).toList();
  }

  void removeSeries(String exerciseId, String seriesId) {
    state = state.map((e) {
      if (e.id != exerciseId) return e;
      final updated = e.series.where((s) => s.id != seriesId).toList();
      // Re-number
      final renumbered = [
        for (var i = 0; i < updated.length; i++)
          updated[i].copyWith(setNumber: i + 1),
      ];
      return e.copyWith(series: renumbered);
    }).toList();
  }

  void updateSeries(String exerciseId, ExerciseSeries updated) {
    state = state.map((e) {
      if (e.id != exerciseId) return e;
      return e.copyWith(
        series: e.series.map((s) => s.id == updated.id ? updated : s).toList(),
      );
    }).toList();
  }

  void reorderExercises(int oldIndex, int newIndex) {
    final list = [...state];
    if (newIndex > oldIndex) newIndex--;
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
    state = list;
  }

  void loadFromTemplate(List<WorkoutExercise> exercises) {
    state = exercises
        .map((e) => e.copyWith(
              id: _uuid.v4(),
              series: e.series
                  .map((s) => s.copyWith(id: _uuid.v4(), completed: false))
                  .toList(),
            ))
        .toList();
  }

  void reset() => state = [];

  ExerciseSeries _newSeries(int num) => ExerciseSeries(
        id: _uuid.v4(),
        setNumber: num,
        reps: AppConstants.defaultReps,
        weightKg: AppConstants.defaultWeightKg,
      );
}
