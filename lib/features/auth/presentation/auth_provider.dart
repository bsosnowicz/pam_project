import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/auth_repository.dart';
import '../domain/auth_state.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => AuthRepository();

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user != null) return AuthState.authenticated(user);

    // Listen to Supabase auth state stream
    ref.read(authRepositoryProvider).authStateChanges.listen((event) {
      final u = event.session?.user;
      if (u != null) {
        state = AuthState.authenticated(u);
      } else {
        state = const AuthState.unauthenticated();
      }
    });

    return const AuthState.unauthenticated();
  }

  Future<void> signIn({required String email, required String password}) async {
    state = const AuthState.loading();
    try {
      final user = await ref.read(authRepositoryProvider).signIn(
            email: email,
            password: password,
          );
      state = AuthState.authenticated(user);
    } catch (_) {
      state = const AuthState.unauthenticated();
      rethrow;
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    state = const AuthState.loading();
    try {
      final user = await ref.read(authRepositoryProvider).signUp(
            email: email,
            password: password,
          );
      state = AuthState.authenticated(user);
    } catch (_) {
      state = const AuthState.unauthenticated();
      rethrow;
    }
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
    state = const AuthState.unauthenticated();
  }
}
