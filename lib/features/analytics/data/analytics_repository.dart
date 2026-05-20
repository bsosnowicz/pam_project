import '../../../core/errors/app_exception.dart';
import '../../../core/supabase/supabase_client.dart';
import '../domain/stats_snapshot.dart';

class AnalyticsRepository {
  Future<StatsSnapshot> getSnapshot({
    required String userId,
    required String period, // 'week' | 'month'
  }) async {
    try {
      final now = DateTime.now();
      final from = period == 'week'
          ? now.subtract(const Duration(days: 7))
          : DateTime(now.year, now.month, 1);

      final rows = await supabase
          .from('workouts')
          .select('started_at, duration_sec, total_volume_kg, calories_burned')
          .eq('user_id', userId)
          .eq('status', 'completed')
          .gte('started_at', from.toIso8601String())
          .order('started_at');

      if (rows.isEmpty) {
        return StatsSnapshot(
          period: period,
          totalWorkouts: 0,
          avgDurationMin: 0,
          avgCalories: 0,
          totalVolumeKg: 0,
          volumeHistory: [],
          strengthProgress: [],
        );
      }

      final total = rows.length;
      final avgDuration = rows.fold<int>(0, (s, r) => s + ((r['duration_sec'] as int?) ?? 0)) / total / 60;
      final avgCal = rows.fold<int>(0, (s, r) => s + ((r['calories_burned'] as int?) ?? 0)) / total;
      final totalVol = rows.fold<double>(0, (s, r) => s + ((r['total_volume_kg'] as num?)?.toDouble() ?? 0));

      final volumeHistory = rows
          .map((r) => ChartDataPoint(
                date: DateTime.parse(r['started_at'] as String),
                value: (r['total_volume_kg'] as num?)?.toDouble() ?? 0,
              ))
          .toList();

      // Strength progress: max weight per exercise over time (simplified — from sets)
      final strengthProgress = await _getStrengthProgress(userId, from);

      return StatsSnapshot(
        period: period,
        totalWorkouts: total,
        avgDurationMin: avgDuration,
        avgCalories: avgCal,
        totalVolumeKg: totalVol,
        volumeHistory: volumeHistory,
        strengthProgress: strengthProgress,
      );
    } catch (e) {
      throw NetworkException('Nie mozna zaladowac statystyk: $e');
    }
  }

  Future<List<ChartDataPoint>> _getStrengthProgress(String userId, DateTime from) async {
    try {
      final rows = await supabase.rpc('get_strength_progress', params: {
        'p_user_id': userId,
        'p_from': from.toIso8601String(),
      });
      return (rows as List)
          .map((r) => ChartDataPoint(
                date: DateTime.parse(r['date'] as String),
                value: (r['max_weight'] as num).toDouble(),
                label: r['exercise_name'] as String?,
              ))
          .toList();
    } catch (_) {
      // RPC not available — return empty
      return [];
    }
  }
}
