import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/network/supabase_client.dart';

class AuthRemoteDataSource {
  final SupabaseClient _client = SupabaseClientHelper.client;

  Future<void> sendOtp({required String phoneNumber}) async {
    await _client.auth.signInWithOtp(
      phone: phoneNumber,
    );
  }

  Future<AuthResponse> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    final response = await _client.auth.verifyOTP(
      phone: phoneNumber,
      token: otp,
      type: OtpType.sms,
    );
    return response;
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  User? get currentUser => _client.auth.currentUser;
  
  Session? get currentSession => _client.auth.currentSession;
}
