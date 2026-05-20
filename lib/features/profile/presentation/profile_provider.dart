import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/profile_repository.dart';
import '../domain/user_profile.dart';
import '../../auth/presentation/auth_provider.dart';
import '../../../core/supabase/supabase_client.dart';

part 'profile_provider.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) => ProfileRepository();

@Riverpod(keepAlive: true)
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<UserProfile?> build() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return null;
    return ref.read(profileRepositoryProvider).getProfile(userId);
  }

  Future<void> saveProfile(UserProfile profile) async {
    final existing = state.valueOrNull;
    state = const AsyncValue.loading();
    try {
      final saved = existing == null
          ? await ref.read(profileRepositoryProvider).createProfile(profile)
          : await ref.read(profileRepositoryProvider).updateProfile(profile);
      state = AsyncValue.data(saved);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
