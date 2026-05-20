import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/errors/app_exception.dart';
import '../../../core/utils/date_utils.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../live_tracking/data/session_repository.dart';
import '../../live_tracking/domain/live_session_state.dart';
import '../../live_tracking/presentation/live_tracking_provider.dart';
import '../../profile/presentation/profile_provider.dart';

class SummaryScreen extends ConsumerStatefulWidget {
  const SummaryScreen({super.key});

  @override
  ConsumerState<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends ConsumerState<SummaryScreen> {
  bool _saving = false;
  final _sessionRepo = SessionRepository();

  Future<void> _save() async {
    final liveState = ref.read(liveTrackingNotifierProvider);
    if (liveState is! LiveFinished) return;

    final userId = ref.read(profileNotifierProvider).valueOrNull?.id;
    if (userId == null) return;

    setState(() => _saving = true);
    try {
      await _sessionRepo.saveWorkout(liveState.summary, userId);
      ref.read(liveTrackingNotifierProvider.notifier).reset();
      if (mounted) context.go('/');
    } on AppException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final liveState = ref.watch(liveTrackingNotifierProvider);

    if (liveState is! LiveFinished) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final summary = liveState.summary;

    return Scaffold(
      appBar: AppBar(title: const Text('Podsumowanie treningu')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _StatGrid(
              stats: [
                ('Czas', formatDuration(summary.durationSec), Icons.timer_outlined),
                ('Kalorie', '${summary.caloriesBurned} kcal', Icons.local_fire_department_outlined),
                ('Objetosc', '${summary.totalVolumeKg.toStringAsFixed(0)} kg', Icons.fitness_center),
                ('Serie', '${summary.totalSets}', Icons.check_circle_outline),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cwiczenia', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...summary.exercises.map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.exerciseName, style: const TextStyle(fontWeight: FontWeight.w600)),
                              ...e.series.where((s) => s.completed).map(
                                    (s) => Text(
                                      '  Seria ${s.setNumber}: ${s.weightKg} kg x ${s.reps}',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Zapisz trening',
              loading: _saving,
              onPressed: _save,
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                ref.read(liveTrackingNotifierProvider.notifier).reset();
                context.go('/');
              },
              child: const Text('Odrzuc i wróc'),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatGrid extends StatelessWidget {
  const _StatGrid({required this.stats});
  final List<(String, String, IconData)> stats;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: stats
          .map((s) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(s.$3, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(height: 8),
                      Text(s.$2,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      Text(s.$1, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
