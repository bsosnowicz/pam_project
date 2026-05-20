import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  String toDisplayDate() => DateFormat('dd MMM yyyy', 'pl_PL').format(this);
  String toDisplayTime() => DateFormat('HH:mm').format(this);
  String toDisplayDateTime() => DateFormat('dd MMM, HH:mm', 'pl_PL').format(this);

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
}

String formatDuration(int seconds) {
  final h = seconds ~/ 3600;
  final m = (seconds % 3600) ~/ 60;
  final s = seconds % 60;
  if (h > 0) return '${h}h ${m.toString().padLeft(2, '0')}m';
  return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
}

/// Returns current streak: consecutive days (ending today or yesterday) with at least one workout.
int calculateStreak(List<DateTime> workoutDates) {
  if (workoutDates.isEmpty) return 0;

  final uniqueDays = workoutDates
      .map((d) => DateTime(d.year, d.month, d.day))
      .toSet()
      .toList()
    ..sort((a, b) => b.compareTo(a));

  final today = DateTime.now();
  final todayNorm = DateTime(today.year, today.month, today.day);
  final yesterday = todayNorm.subtract(const Duration(days: 1));

  // Streak must touch today or yesterday
  if (uniqueDays.first != todayNorm && uniqueDays.first != yesterday) return 0;

  int streak = 1;
  for (int i = 0; i < uniqueDays.length - 1; i++) {
    final diff = uniqueDays[i].difference(uniqueDays[i + 1]).inDays;
    if (diff == 1) {
      streak++;
    } else {
      break;
    }
  }
  return streak;
}
