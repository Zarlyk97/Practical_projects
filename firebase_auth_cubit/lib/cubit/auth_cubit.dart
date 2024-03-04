import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_cubit/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  ResetPasswordCubit() : super(ResetPasswordInitial());

  Future<void> sendOTP(String email) async {
    try {
      emit(ResetPasswordLoading());
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      emit(OTPSentState());
    } catch (e) {
      emit(const PasswordResetFailure('Failed to send OTP. Please try again.'));
    }
  }

  Future<void> verifyOTP(String otp) async {
    try {
      emit(ResetPasswordLoading());
      await _firebaseAuth.verifyPasswordResetCode(otp);
      emit(OTPVerifiedState());
    } catch (e) {
      emit(const PasswordResetFailure('Invalid OTP. Please try again.'));
    }
  }

  Future<void> resetPassword(String email, String newPassword) async {
    try {
      emit(ResetPasswordLoading());
      await _firebaseAuth.confirmPasswordReset(
          code: email, newPassword: newPassword);
      emit(PasswordResetState());
    } catch (e) {
      emit(const PasswordResetFailure(
          'Failed to reset password. Please try again.'));
    }
  }
}
