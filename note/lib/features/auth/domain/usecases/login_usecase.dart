import 'package:either_dart/either.dart';
import 'package:firebase_auth_cubit/core/failure.dart';
import 'package:firebase_auth_cubit/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth_cubit/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);
  Future<Either<Failure, UserEntity>> call(
      String email, String password) async {
    return await authRepository.login(email, password);
  }
}
