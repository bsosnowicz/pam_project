import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import '../../../core/errors/app_exception.dart';
import '../../../core/supabase/supabase_client.dart';

class AuthRepository {
  Future<sb.User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) throw const AuthException('Rejestracja nie powiodla sie');
      return user;
    } on sb.AuthException catch (e) {
      throw AuthException(e.message);
    }
  }

  Future<sb.User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) throw const AuthException('Logowanie nie powiodlo sie');
      return user;
    } on sb.AuthException catch (e) {
      throw AuthException(e.message);
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  sb.User? get currentUser => supabase.auth.currentUser;

  Stream<sb.AuthState> get authStateChanges =>
      supabase.auth.onAuthStateChange;
}
