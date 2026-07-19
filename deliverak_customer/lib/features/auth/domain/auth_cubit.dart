import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/auth_repository.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState {
  final AuthStatus status;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.errorMessage,
  });
}

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository(),
        super(const AuthState());

  Future<void> sendOtp({required String phoneNumber}) async {
    emit(const AuthState(status: AuthStatus.loading));
    try {
      await _authRepository.sendOtp(phoneNumber: phoneNumber);
      emit(const AuthState(status: AuthStatus.success));
    } catch (e) {
      emit(AuthState(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    emit(const AuthState(status: AuthStatus.loading));
    try {
      await _authRepository.verifyOtp(
        phoneNumber: phoneNumber,
        otp: otp,
      );
      emit(const AuthState(status: AuthStatus.success));
    } catch (e) {
      emit(AuthState(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
      emit(const AuthState(status: AuthStatus.initial));
    } catch (e) {
      emit(AuthState(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
