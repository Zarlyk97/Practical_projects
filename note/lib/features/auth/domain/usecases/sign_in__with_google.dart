import 'package:firebase_auth_cubit/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth_cubit/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository authRepository;

  SignInWithGoogle(this.authRepository);
  Future<UserEntity> call(String email, String password) async {
    return await authRepository.signInWithGoogle();
  }
}
