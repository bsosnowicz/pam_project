import 'dart:math';
import '../constants/app_constants.dart';

/// Mixed model: MET-based (Ainsworth) + volumetric component.
/// Returns estimated kcal burned during a strength training session.
int calculateCalories({
  required double weightKg,
  required int durationSec,
  required double totalVolumeKg,
  required int restSec,
}) {
  if (durationSec <= 0) return AppConstants.minCaloriesBurned;

  final timeMin = durationSec / 60.0;
  final activeTimeSec = (durationSec - restSec).clamp(0, durationSec);
  final activeRatio = activeTimeSec / durationSec;

  // Scale MET by intensity (volume density + active time ratio)
  final intensityFactor = (0.5 + (totalVolumeKg / 1000.0) + activeRatio)
      .clamp(AppConstants.intensityMin, AppConstants.intensityMax);
  final met = AppConstants.metBase * intensityFactor;

  // Keys-Taylor formula: kcal = MET * kg * hours
  final metCalories = met * weightKg * (timeMin / 60.0);

  // Mechanical energy component
  final volumeCalories = totalVolumeKg * AppConstants.volumeCalorieCoefficient;

  return max(AppConstants.minCaloriesBurned, (metCalories + volumeCalories).round());
}

/// Computes total volume (kg) from all completed sets across a workout.
double computeTotalVolume(Iterable<({int reps, double weightKg})> sets) {
  return sets.fold(0.0, (sum, s) => sum + s.reps * s.weightKg);
}
