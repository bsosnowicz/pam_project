import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/history_repository.dart';
import '../../profile/presentation/profile_provider.dart';

part 'history_provider.g.dart';

@riverpod
HistoryRepository historyRepository(Ref ref) => HistoryRepository();

class HistoryFilter {
  const HistoryFilter({this.dateFrom, this.dateTo, this.exerciseName});
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final String? exerciseName;
}

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  HistoryFilter _filter = const HistoryFilter();

  @override
  Future<List<WorkoutHistoryItem>> build() async {
    final userId = ref.watch(profileNotifierProvider).valueOrNull?.id;
    if (userId == null) return [];
    return ref.read(historyRepositoryProvider).getWorkouts(
          userId: userId,
          dateFrom: _filter.dateFrom,
          dateTo: _filter.dateTo,
          exerciseNameFilter: _filter.exerciseName,
        );
  }

  Future<void> applyFilter(HistoryFilter filter) async {
    _filter = filter;
    ref.invalidateSelf();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
