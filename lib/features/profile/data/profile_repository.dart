import '../../../core/errors/app_exception.dart';
import '../../../core/supabase/supabase_client.dart';
import '../domain/user_profile.dart';

class ProfileRepository {
  static const _table = 'profiles';

  Future<UserProfile?> getProfile(String userId) async {
    try {
      final data = await supabase
          .from(_table)
          .select()
          .eq('id', userId)
          .maybeSingle();
      if (data == null) return null;
      return _fromRow(data);
    } catch (e) {
      throw NetworkException('Nie mozna zaladowac profilu: $e');
    }
  }

  Future<UserProfile> createProfile(UserProfile profile) async {
    try {
      final data = await supabase
          .from(_table)
          .upsert(_toRow(profile))
          .select()
          .single();
      return _fromRow(data);
    } catch (e) {
      throw NetworkException('Nie mozna zapisac profilu: $e');
    }
  }

  Future<UserProfile> updateProfile(UserProfile profile) async {
    try {
      final data = await supabase
          .from(_table)
          .update(_toRow(profile))
          .eq('id', profile.id)
          .select()
          .single();
      return _fromRow(data);
    } catch (e) {
      throw NetworkException('Nie mozna zaktualizowac profilu: $e');
    }
  }

  Map<String, dynamic> _toRow(UserProfile p) => {
        'id': p.id,
        'weight_kg': p.weightKg,
        'height_cm': p.heightCm,
        'age': p.age,
        'gender': p.gender,
        'activity_level': p.activityLevel,
      };

  UserProfile _fromRow(Map<String, dynamic> row) => UserProfile(
        id: row['id'] as String,
        weightKg: (row['weight_kg'] as num).toDouble(),
        heightCm: (row['height_cm'] as num).toDouble(),
        age: row['age'] as int,
        gender: row['gender'] as String,
        activityLevel: row['activity_level'] as String,
        createdAt: row['created_at'] != null
            ? DateTime.parse(row['created_at'] as String)
            : null,
        updatedAt: row['updated_at'] != null
            ? DateTime.parse(row['updated_at'] as String)
            : null,
      );
}
