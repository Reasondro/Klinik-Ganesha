import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<AuthResponse> signInWithEmailPassword(
      {required String email, required String password}) async {
    return await _supabase.auth
        .signInWithPassword(email: email, password: password);
  }

  Future<AuthResponse> signUpWithEmailPassword(
      {required String email, required String password}) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  Future<void> signOut() async {
    return await _supabase.auth.signOut();
  }

  String? getCurrentUserEmail() {
    final Session? session = _supabase.auth.currentSession;
    final User? user = session?.user;
    return user?.email;
  }

  String? getCurrentUserId() {
    final Session? session = _supabase.auth.currentSession;
    final User? user = session?.user;
    return user?.id;
  }
}
