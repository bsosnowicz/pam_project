import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../../shared/widgets/primary_button.dart';
import 'builder_provider.dart';
import 'exercise_block_widget.dart';

class BuilderScreen extends ConsumerWidget {
  const BuilderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercises = ref.watch(workoutBuilderNotifierProvider);
    final notifier = ref.read(workoutBuilderNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buduj trening'),
        actions: [
          if (exercises.isNotEmpty)
            TextButton(
              onPressed: () {
                notifier.reset();
              },
              child: const Text('Wyczysc'),
            ),
        ],
      ),
      body: exercises.isEmpty
          ? EmptyStateWidget(
              icon: Icons.fitness_center,
              title: 'Brak cwiczen',
              subtitle: 'Dodaj pierwsze cwiczenie, aby zaczac budowac trening.',
              action: ElevatedButton.icon(
                onPressed: notifier.addExercise,
                icon: const Icon(Icons.add),
                label: const Text('Dodaj cwiczenie'),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ReorderableListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    itemCount: exercises.length,
                    onReorder: notifier.reorderExercises,
                    itemBuilder: (context, index) {
                      final e = exercises[index];
                      return ExerciseBlockWidget(
                        key: GlobalObjectKey(e.id),
                        exercise: e,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Column(
                    children: [
                      OutlinedButton.icon(
                        onPressed: notifier.addExercise,
                        icon: const Icon(Icons.add),
                        label: const Text('Dodaj cwiczenie'),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                        ),
                      ),
                      const SizedBox(height: 12),
                      PrimaryButton(
                        label: 'Rozpocznij trening',
                        icon: Icons.play_arrow,
                        onPressed: exercises.any((e) => e.exerciseName.trim().isEmpty)
                            ? null
                            : () => context.push('/live'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
