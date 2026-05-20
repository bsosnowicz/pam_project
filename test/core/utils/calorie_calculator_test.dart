import 'package:flutter_test/flutter_test.dart';
import 'package:pam_project/core/utils/calorie_calculator.dart';

void main() {
  group('calculateCalories', () {
    test('returns minimum when duration is 0', () {
      expect(calculateCalories(weightKg: 80, durationSec: 0, totalVolumeKg: 0, restSec: 0), 50);
    });

    test('60 min session, 80kg user, 3000kg volume returns reasonable range', () {
      final cal = calculateCalories(
        weightKg: 80,
        durationSec: 3600,
        totalVolumeKg: 3000,
        restSec: 1200,
      );
      expect(cal, greaterThan(300));
      expect(cal, lessThan(700));
    });

    test('heavier user burns more calories same workout', () {
      final lighter = calculateCalories(weightKg: 60, durationSec: 3600, totalVolumeKg: 2000, restSec: 1200);
      final heavier = calculateCalories(weightKg: 100, durationSec: 3600, totalVolumeKg: 2000, restSec: 1200);
      expect(heavier, greaterThan(lighter));
    });

    test('longer workout burns more calories', () {
      final shorter = calculateCalories(weightKg: 80, durationSec: 1800, totalVolumeKg: 1500, restSec: 600);
      final longer = calculateCalories(weightKg: 80, durationSec: 3600, totalVolumeKg: 3000, restSec: 1200);
      expect(longer, greaterThan(shorter));
    });
  });

  group('computeTotalVolume', () {
    test('computes correctly', () {
      final sets = [
        (reps: 8, weightKg: 80.0),
        (reps: 8, weightKg: 80.0),
        (reps: 6, weightKg: 75.0),
      ];
      final volume = computeTotalVolume(sets);
      expect(volume, closeTo(8 * 80 + 8 * 80 + 6 * 75, 0.001));
    });

    test('returns 0 for empty sets', () {
      expect(computeTotalVolume([]), 0.0);
    });
  });
}
