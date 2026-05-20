import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/analytics_repository.dart';
import '../domain/stats_snapshot.dart';
import '../../profile/presentation/profile_provider.dart';

part 'analytics_provider.g.dart';

@riverpod
AnalyticsRepository analyticsRepository(Ref ref) => AnalyticsRepository();

@riverpod
Future<StatsSnapshot> statsSnapshot(Ref ref, String period) async {
  final userId = ref.watch(profileNotifierProvider).valueOrNull?.id;
  if (userId == null) {
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
  return ref.read(analyticsRepositoryProvider).getSnapshot(
        userId: userId,
        period: period,
      );
}
