import '../data/auth_remote_data_source.dart';
import '../../../core/errors/failures.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepository({AuthRemoteDataSource? remoteDataSource})
      : _remoteDataSource = remoteDataSource ?? AuthRemoteDataSource();

  Future<void> sendOtp({required String phoneNumber}) async {
    try {
      await _remoteDataSource.sendOtp(phoneNumber: phoneNumber);
    } catch (e) {
      throw AuthFailure(message: 'فشل إرسال رمز التحقق');
    }
  }

  Future<void> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      await _remoteDataSource.verifyOtp(
        phoneNumber: phoneNumber,
        otp: otp,
      );
    } catch (e) {
      throw AuthFailure(message: 'رمز التحقق غير صحيح');
    }
  }

  Future<void> signOut() async {
    try {
      await _remoteDataSource.signOut();
    } catch (e) {
      throw AuthFailure(message: 'فشل تسجيل الخروج');
    }
  }

  bool isLoggedIn() {
    return _remoteDataSource.currentUser != null;
  }
}
