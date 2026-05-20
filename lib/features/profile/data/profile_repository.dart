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
      return UserProfile.fromJson(data);
    } catch (e) {
      throw NetworkException('Nie mozna zaladowac profilu: $e');
    }
  }

  Future<UserProfile> createProfile(UserProfile profile) async {
    try {
      final data = await supabase
          .from(_table)
          .insert(_toRow(profile))
          .select()
          .single();
      return UserProfile.fromJson(data);
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
      return UserProfile.fromJson(data);
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
}
