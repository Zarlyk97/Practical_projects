import 'package:either_dart/either.dart';
import 'package:firebase_auth_cubit/core/failure.dart';
import 'package:firebase_auth_cubit/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, UserEntity>> register(String email, String password);
  Future<Either<Failure, UserEntity>> getCurrentUser(String uid, String email);
  Future<UserEntity> signInWithGoogle();
  Future<void> signOut();
}
