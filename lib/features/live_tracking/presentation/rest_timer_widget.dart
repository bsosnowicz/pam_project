import 'package:flutter/material.dart';
import '../../../core/utils/date_utils.dart';

class RestTimerWidget extends StatelessWidget {
  const RestTimerWidget({
    super.key,
    required this.remainingSeconds,
    required this.totalSeconds,
    required this.onSkip,
  });

  final int remainingSeconds;
  final int totalSeconds;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final progress = totalSeconds > 0 ? remainingSeconds / totalSeconds : 0.0;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Przerwa',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 8,
                  backgroundColor: colorScheme.onPrimaryContainer.withOpacity(0.2),
                  color: colorScheme.primary,
                ),
                Text(
                  formatDuration(remainingSeconds),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: onSkip,
            child: const Text('Pomin przerwe'),
          ),
        ],
      ),
    );
  }
}
