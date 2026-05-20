import 'package:flutter_test/flutter_test.dart';
import 'package:pam_project/core/utils/date_utils.dart';

void main() {
  group('calculateStreak', () {
    test('empty list returns 0', () {
      expect(calculateStreak([]), 0);
    });

    test('single workout today returns 1', () {
      final today = DateTime.now();
      expect(calculateStreak([today]), 1);
    });

    test('consecutive days returns correct streak', () {
      final today = DateTime.now();
      final dates = [
        today,
        today.subtract(const Duration(days: 1)),
        today.subtract(const Duration(days: 2)),
      ];
      expect(calculateStreak(dates), 3);
    });

    test('gap in days breaks streak', () {
      final today = DateTime.now();
      final dates = [
        today,
        today.subtract(const Duration(days: 3)), // gap
      ];
      expect(calculateStreak(dates), 1);
    });

    test('workout two days ago with gap returns 0', () {
      final twoDaysAgo = DateTime.now().subtract(const Duration(days: 2));
      expect(calculateStreak([twoDaysAgo]), 0);
    });
  });

  group('formatDuration', () {
    test('formats seconds correctly', () {
      expect(formatDuration(90), '01:30');
      expect(formatDuration(3661), '1h 01m');
      expect(formatDuration(0), '00:00');
    });
  });
}
