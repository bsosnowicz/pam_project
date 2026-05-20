import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/date_utils.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../workout_builder/presentation/builder_provider.dart';
import '../domain/live_session_state.dart';
import 'live_tracking_provider.dart';
import 'rest_timer_widget.dart';

class LiveTrackingScreen extends ConsumerWidget {
  const LiveTrackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveState = ref.watch(liveTrackingNotifierProvider);
    final notifier = ref.read(liveTrackingNotifierProvider.notifier);

    // Auto-start when entering screen if idle
    if (liveState is LiveIdle) {
      final exercises = ref.read(workoutBuilderNotifierProvider);
      if (exercises.isEmpty) {
        return Scaffold(
          appBar: AppBar(title: const Text('Trening')),
          body: const Center(child: Text('Brak cwiczen. Wróc i dodaj cwiczenia.')),
        );
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifier.startWorkout(exercises);
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (liveState is LiveFinished) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pushReplacement('/summary');
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final isPaused = liveState is LivePaused;
    final active = liveState is LiveActive ? liveState : null;

    final exercises = switch (liveState) {
      LiveActive(:final exercises) => exercises,
      LivePaused(:final exercises) => exercises,
      _ => <dynamic>[],
    };
    final elapsedSec = switch (liveState) {
      LiveActive(:final elapsedSec) => elapsedSec,
      LivePaused(:final elapsedSec) => elapsedSec,
      _ => 0,
    };
    final currentExIdx = switch (liveState) {
      LiveActive(:final currentExerciseIndex) => currentExerciseIndex,
      LivePaused(:final currentExerciseIndex) => currentExerciseIndex,
      _ => 0,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(formatDuration(elapsedSec)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => _confirmExit(context, ref),
        ),
        actions: [
          IconButton(
            icon: Icon(isPaused ? Icons.play_arrow : Icons.pause),
            onPressed: isPaused ? notifier.resumeWorkout : notifier.pauseWorkout,
          ),
        ],
      ),
      body: Column(
        children: [
          if (active != null && active.isResting)
            Padding(
              padding: const EdgeInsets.all(16),
              child: RestTimerWidget(
                remainingSeconds: active.restSecondsRemaining,
                totalSeconds: exercises.isNotEmpty
                    ? (exercises[currentExIdx] as dynamic).restSeconds as int
                    : 90,
                onSkip: notifier.skipRest,
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: exercises.length,
                itemBuilder: (context, exIdx) {
                  final exercise = exercises[exIdx];
                  final isCurrent = exIdx == currentExIdx;

                  return Card(
                    color: isCurrent
                        ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3)
                        : null,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (isCurrent)
                                Container(
                                  width: 8,
                                  height: 8,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              Expanded(
                                child: Text(
                                  exercise.exerciseName,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ...exercise.series.asMap().entries.map((entry) {
                            final sIdx = entry.key;
                            final series = entry.value;
                            return _SeriesRow(
                              exerciseIdx: exIdx,
                              seriesIdx: sIdx,
                              series: series,
                              isCurrent: isCurrent && !isPaused,
                              notifier: notifier,
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          if (!isPaused)
            Padding(
              padding: const EdgeInsets.all(16),
              child: PrimaryButton(
                label: 'Zakoncz trening',
                onPressed: notifier.finishWorkout,
                icon: Icons.stop,
              ),
            ),
          if (isPaused)
            Padding(
              padding: const EdgeInsets.all(16),
              child: PrimaryButton(
                label: 'Wznow trening',
                onPressed: notifier.resumeWorkout,
                icon: Icons.play_arrow,
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _confirmExit(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Przerwac trening?'),
        content: const Text('Postep nie zostanie zapisany.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Nie')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Tak', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      ref.read(liveTrackingNotifierProvider.notifier).reset();
      context.pop();
    }
  }
}

class _SeriesRow extends StatelessWidget {
  const _SeriesRow({
    required this.exerciseIdx,
    required this.seriesIdx,
    required this.series,
    required this.isCurrent,
    required this.notifier,
  });

  final int exerciseIdx;
  final int seriesIdx;
  final dynamic series;
  final bool isCurrent;
  final LiveTrackingNotifier notifier;

  @override
  Widget build(BuildContext context) {
    final completed = series.completed as bool;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 28,
            child: Text(
              '${series.setNumber}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text('${series.weightKg} kg x ${series.reps}'),
          const Spacer(),
          if (isCurrent && !completed)
            GestureDetector(
              onTap: () => notifier.completeSeries(exerciseIdx, seriesIdx),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.check, size: 20),
              ),
            )
          else if (completed)
            Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
        ],
      ),
    );
  }
}
