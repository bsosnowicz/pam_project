import '../../../core/errors/app_exception.dart';
import '../../../core/supabase/supabase_client.dart';

class WorkoutHistoryItem {
  const WorkoutHistoryItem({
    required this.id,
    required this.title,
    required this.startedAt,
    required this.durationSec,
    required this.totalVolumeKg,
    required this.caloriesBurned,
    required this.totalSets,
  });

  final String id;
  final String? title;
  final DateTime startedAt;
  final int durationSec;
  final double totalVolumeKg;
  final int caloriesBurned;
  final int totalSets;

  factory WorkoutHistoryItem.fromJson(Map<String, dynamic> json) =>
      WorkoutHistoryItem(
        id: json['id'] as String,
        title: json['title'] as String?,
        startedAt: DateTime.parse(json['started_at'] as String),
        durationSec: (json['duration_sec'] as int?) ?? 0,
        totalVolumeKg: (json['total_volume_kg'] as num?)?.toDouble() ?? 0,
        caloriesBurned: (json['calories_burned'] as int?) ?? 0,
        totalSets: (json['total_sets'] as int?) ?? 0,
      );
}

class HistoryRepository {
  Future<List<WorkoutHistoryItem>> getWorkouts({
    required String userId,
    DateTime? dateFrom,
    DateTime? dateTo,
    String? exerciseNameFilter,
  }) async {
    try {
      var query = supabase
          .from('workouts')
          .select('id, title, started_at, duration_sec, total_volume_kg, calories_burned, total_sets')
          .eq('user_id', userId)
          .eq('status', 'completed')
          .order('started_at', ascending: false);

      if (dateFrom != null) {
        query = query.gte('started_at', dateFrom.toIso8601String());
      }
      if (dateTo != null) {
        query = query.lte('started_at', dateTo.toIso8601String());
      }

      final rows = await query;

      if (exerciseNameFilter != null && exerciseNameFilter.isNotEmpty) {
        // Filter client-side for exercise name (avoids complex join for now)
        final ids = rows.map((r) => r['id'] as String).toList();
        if (ids.isEmpty) return [];

        final matchingExercises = await supabase
            .from('workout_exercises')
            .select('workout_id')
            .inFilter('workout_id', ids)
            .ilike('exercise_name', '%$exerciseNameFilter%');

        final matchingIds = matchingExercises
            .map((r) => r['workout_id'] as String)
            .toSet();

        return rows
            .where((r) => matchingIds.contains(r['id']))
            .map(WorkoutHistoryItem.fromJson)
            .toList();
      }

      return rows.map(WorkoutHistoryItem.fromJson).toList();
    } catch (e) {
      throw NetworkException('Nie mozna zaladowac historii: $e');
    }
  }

  Future<Map<String, dynamic>> getWorkoutDetail(String workoutId) async {
    try {
      final workout = await supabase
          .from('workouts')
          .select('*, workout_exercises(*, exercise_sets(*))')
          .eq('id', workoutId)
          .single();
      return workout;
    } catch (e) {
      throw NetworkException('Nie mozna zaladowac szczegolow: $e');
    }
  }

  Future<List<DateTime>> getWorkoutDates(String userId) async {
    try {
      final rows = await supabase
          .from('workouts')
          .select('started_at')
          .eq('user_id', userId)
          .eq('status', 'completed');
      return rows
          .map((r) => DateTime.parse(r['started_at'] as String))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
