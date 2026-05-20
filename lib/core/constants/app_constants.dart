class AppConstants {
  AppConstants._();

  // MET values for strength training (Ainsworth compendium)
  static const double metBase = 5.0;
  static const double metMin = 3.5;
  static const double metMax = 7.0;

  // Calorie calculation
  static const double volumeCalorieCoefficient = 0.04;
  static const int minCaloriesBurned = 50;
  static const double intensityMin = 0.6;
  static const double intensityMax = 1.4;

  // Default workout values
  static const int defaultRestSeconds = 90;
  static const int defaultReps = 8;
  static const double defaultWeightKg = 20.0;

  // Streak
  static const int streakGracePeriodHours = 30;
}
