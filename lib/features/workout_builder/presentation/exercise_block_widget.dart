import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/workout_exercise.dart';
import 'builder_provider.dart';
import 'series_tile_widget.dart';

class ExerciseBlockWidget extends ConsumerStatefulWidget {
  const ExerciseBlockWidget({
    required super.key, // GlobalKey required for ReorderableListView
    required this.exercise,
  });

  final WorkoutExercise exercise;

  @override
  ConsumerState<ExerciseBlockWidget> createState() => _ExerciseBlockWidgetState();
}

class _ExerciseBlockWidgetState extends ConsumerState<ExerciseBlockWidget> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _restCtrl;
  bool _expanded = true;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.exercise.exerciseName);
    _restCtrl = TextEditingController(text: widget.exercise.restSeconds.toString());
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _restCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exercise = widget.exercise;
    final notifier = ref.read(workoutBuilderNotifierProvider.notifier);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
            leading: ReorderableDragStartListener(
              index: 0,
              child: const Icon(Icons.drag_handle),
            ),
            title: TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                hintText: 'Nazwa cwiczenia',
                border: InputBorder.none,
                filled: false,
              ),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              onChanged: (v) => notifier.updateExerciseName(exercise.id, v),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () => setState(() => _expanded = !_expanded),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () => notifier.removeExercise(exercise.id),
                ),
              ],
            ),
          ),
          if (_expanded) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ...exercise.series.map(
                    (s) => SeriesTileWidget(
                      key: ValueKey(s.id),
                      exerciseId: exercise.id,
                      series: s,
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () => notifier.addSeries(exercise.id),
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Dodaj serie'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.timer_outlined, size: 18),
                      const SizedBox(width: 8),
                      const Text('Przerwa:'),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 72,
                        child: TextFormField(
                          controller: _restCtrl,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            suffixText: 's',
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          ),
                          onChanged: (v) {
                            final secs = int.tryParse(v);
                            if (secs != null) notifier.updateRestSeconds(exercise.id, secs);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
