import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/date_utils.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import 'history_provider.dart';
import '../data/history_repository.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final historyAsync = ref.watch(historyNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Historia treningów')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              controller: _searchCtrl,
              decoration: const InputDecoration(
                hintText: 'Szukaj po cwiczeniu...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: null,
              ),
              onSubmitted: (v) => ref
                  .read(historyNotifierProvider.notifier)
                  .applyFilter(HistoryFilter(exerciseName: v.trim().isEmpty ? null : v.trim())),
            ),
          ),
          Expanded(
            child: historyAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Blad: $e')),
              data: (workouts) => workouts.isEmpty
                  ? const EmptyStateWidget(
                      icon: Icons.history,
                      title: 'Brak treningów',
                      subtitle: 'Twoja historia treningów pojawi sie tutaj.',
                    )
                  : RefreshIndicator(
                      onRefresh: () => ref.read(historyNotifierProvider.notifier).refresh(),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: workouts.length,
                        itemBuilder: (_, i) => _WorkoutCard(workout: workouts[i]),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  const _WorkoutCard({required this.workout});
  final WorkoutHistoryItem workout;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.push('/history/${workout.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    workout.title ?? 'Trening',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    workout.startedAt.toDisplayDate(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _Chip(icon: Icons.timer_outlined, label: formatDuration(workout.durationSec)),
                  const SizedBox(width: 8),
                  _Chip(icon: Icons.local_fire_department_outlined, label: '${workout.caloriesBurned} kcal'),
                  const SizedBox(width: 8),
                  _Chip(icon: Icons.fitness_center, label: '${workout.totalVolumeKg.toStringAsFixed(0)} kg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
