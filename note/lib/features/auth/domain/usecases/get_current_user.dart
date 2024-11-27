import 'package:either_dart/either.dart';
import 'package:firebase_auth_cubit/core/failure.dart';
import 'package:firebase_auth_cubit/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth_cubit/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository authRepository;
  GetCurrentUser(this.authRepository);
  Future<Either<Failure, UserEntity>> call(String uid, String email) async {
    return await authRepository.getCurrentUser(uid, email);
  }
}
