import 'package:equatable/equatable.dart';
import 'package:fakestore/features/auth/domain/models/user_model.dart';
import 'package:fakestore/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository loginRepository;
  AuthCubit(this.loginRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());

      final user = await loginRepository.login(email, password);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
