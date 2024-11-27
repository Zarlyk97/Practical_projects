import 'package:firebase_auth_cubit/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:firebase_auth_cubit/features/auth/domain/usecases/signout_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/entities/user_entity.dart';

class AuthState {
  final UserEntity? user;
  final bool isLoading;
  final String? error;

  AuthState({this.user, this.isLoading = false, this.error});
}

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase loginUseCase;
  final SignUpUsecase registerUseCase;
  final SignOutUsecase signOutUseCase; // Add Register Usecase

  AuthCubit(this.loginUseCase, this.signOutUseCase, this.registerUseCase)
      : super(AuthState());

  Future<void> login(String email, String password) async {
    emit(AuthState(isLoading: true));
    final result = await loginUseCase(email, password);
    result.fold(
      (failure) => emit(AuthState(error: failure.message)), // Failure
      (user) => emit(AuthState(user: user)), // Success
    );
  }

  Future<void> register(String email, String password) async {
    emit(AuthState(isLoading: true));
    final result =
        await registerUseCase(email, password); // Call Register Usecase
    result.fold(
      (failure) => emit(AuthState(error: failure.message)), // Handle Failure
      (user) => emit(AuthState(user: user)), // Handle Success
    );
  }

  Future<void> signOut() async {
    emit(AuthState(isLoading: true)); // Loading абалын баштоо
    try {
      await signOutUseCase(); // UseCase аркылуу чыгуу
      emit(AuthState(user: null)); // Колдонуучу жок абалды жөнөтүү
    } catch (e) {
      emit(AuthState(error: e.toString())); // Ката болсо иштетүү
    }
  }

  Future<void> googlSignIn() async {
    try {
      emit(AuthState(isLoading: true)); // Loading абалын баштоо

      await signOutUseCase(); // Бул void болгондуктан, кайтаруу маанисин колдонбойбуз

      emit(AuthState(user: null)); // Колдонуучу жок абалды жөнөтүү
    } catch (e) {
      emit(AuthState(error: e.toString())); // Ката болсо иштетүү
    }
  }
}
