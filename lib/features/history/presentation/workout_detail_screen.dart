import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/date_utils.dart';
import '../data/history_repository.dart';

class WorkoutDetailScreen extends ConsumerWidget {
  const WorkoutDetailScreen({super.key, required this.workoutId});
  final String workoutId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(_workoutDetailProvider(workoutId));

    return Scaffold(
      appBar: AppBar(title: const Text('Szczegoły treningu')),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Blad: $e')),
        data: (detail) {
          final exercises = (detail['workout_exercises'] as List?) ?? [];
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail['title'] as String? ?? 'Trening',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  DateTime.parse(detail['started_at'] as String).toDisplayDateTime(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _StatChip('Czas', formatDuration((detail['duration_sec'] as int?) ?? 0)),
                    const SizedBox(width: 8),
                    _StatChip('Kalorie', '${detail['calories_burned'] ?? 0} kcal'),
                    const SizedBox(width: 8),
                    _StatChip('Objetosc', '${(detail['total_volume_kg'] as num?)?.toStringAsFixed(0) ?? 0} kg'),
                  ],
                ),
                const SizedBox(height: 24),
                ...exercises.map((e) {
                  final sets = (e['exercise_sets'] as List?) ?? [];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e['exercise_name'] as String,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      ...sets.map((s) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              'Seria ${s['set_number']}: ${s['weight_kg']} kg x ${s['reps']}',
                            ),
                          )),
                      const Divider(height: 24),
                    ],
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$label: $value', style: const TextStyle(fontSize: 12)),
    );
  }
}

final _workoutDetailProvider = FutureProvider.family<Map<String, dynamic>, String>(
  (ref, workoutId) => HistoryRepository().getWorkoutDetail(workoutId),
);
