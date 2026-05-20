import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/exercise_series.dart';
import 'builder_provider.dart';

class SeriesTileWidget extends ConsumerStatefulWidget {
  const SeriesTileWidget({
    super.key,
    required this.exerciseId,
    required this.series,
  });

  final String exerciseId;
  final ExerciseSeries series;

  @override
  ConsumerState<SeriesTileWidget> createState() => _SeriesTileWidgetState();
}

class _SeriesTileWidgetState extends ConsumerState<SeriesTileWidget> {
  late final TextEditingController _repsCtrl;
  late final TextEditingController _weightCtrl;

  @override
  void initState() {
    super.initState();
    _repsCtrl = TextEditingController(text: widget.series.reps.toString());
    _weightCtrl = TextEditingController(text: widget.series.weightKg.toString());
  }

  @override
  void dispose() {
    _repsCtrl.dispose();
    _weightCtrl.dispose();
    super.dispose();
  }

  void _onRepsChanged(String v) {
    final reps = int.tryParse(v);
    if (reps == null) return;
    ref.read(workoutBuilderNotifierProvider.notifier).updateSeries(
          widget.exerciseId,
          widget.series.copyWith(reps: reps),
        );
  }

  void _onWeightChanged(String v) {
    final weight = double.tryParse(v.replaceAll(',', '.'));
    if (weight == null) return;
    ref.read(workoutBuilderNotifierProvider.notifier).updateSeries(
          widget.exerciseId,
          widget.series.copyWith(weightKg: weight),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              '${widget.series.setNumber}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: _weightCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'kg',
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              onChanged: _onWeightChanged,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: _repsCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'powt.',
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              onChanged: _onRepsChanged,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: () => ref
                .read(workoutBuilderNotifierProvider.notifier)
                .removeSeries(widget.exerciseId, widget.series.id),
          ),
        ],
      ),
    );
  }
}
