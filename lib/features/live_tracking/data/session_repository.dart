import '../../../core/errors/app_exception.dart';
import '../../../core/supabase/supabase_client.dart';
import '../../workout_summary/domain/workout_summary.dart';

class SessionRepository {
  Future<String> saveWorkout(WorkoutSummary summary, String userId) async {
    try {
      // Insert workout header
      final workoutRow = await supabase.from('workouts').insert({
        'user_id': userId,
        'title': summary.title,
        'status': 'completed',
        'started_at': summary.startedAt.toIso8601String(),
        'ended_at': DateTime.now().toIso8601String(),
        'duration_sec': summary.durationSec,
        'total_volume_kg': summary.totalVolumeKg,
        'total_sets': summary.totalSets,
        'total_reps': summary.totalReps,
        'total_rest_sec': summary.totalRestSec,
        'calories_burned': summary.caloriesBurned,
        'notes': summary.notes,
      }).select('id').single();

      final workoutId = workoutRow['id'] as String;

      // Insert exercises and sets
      for (var i = 0; i < summary.exercises.length; i++) {
        final exercise = summary.exercises[i];
        final exRow = await supabase.from('workout_exercises').insert({
          'workout_id': workoutId,
          'exercise_name': exercise.exerciseName,
          'rest_seconds': exercise.restSeconds,
          'position': i,
        }).select('id').single();

        final exerciseId = exRow['id'] as String;

        if (exercise.series.isNotEmpty) {
          await supabase.from('exercise_sets').insert(
                exercise.series.map((s) => {
                      'exercise_id': exerciseId,
                      'set_number': s.setNumber,
                      'reps': s.reps,
                      'weight_kg': s.weightKg,
                      'completed': s.completed,
                    }).toList(),
              );
        }
      }

      return workoutId;
    } catch (e) {
      throw NetworkException('Nie mozna zapisac treningu: $e');
    }
  }
}
