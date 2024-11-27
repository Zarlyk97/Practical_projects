import 'package:either_dart/either.dart';
import 'package:firebase_auth_cubit/core/failure.dart';
import 'package:firebase_auth_cubit/features/auth/data/data_source.dart/auth_data_source.dart';
import 'package:firebase_auth_cubit/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth_cubit/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      final user = await authDataSource.login(email, password);
      return Right(user); // Success
    } catch (e) {
      return Left(Failure(message: 'Login failed: $e')); // Failure
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(
      String email, String password) async {
    try {
      final user = await authDataSource.register(email, password);
      return Right(user); // Success
    } catch (e) {
      return Left(Failure(message: 'Register failed: $e')); // Failure
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser(
      String uid, String email) async {
    try {
      final user = await authDataSource.getCurrentUser(uid, email);
      return Right(user); // Success
    } catch (e) {
      return Left(Failure(message: 'Get current user failed: $e')); // Failure
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await authDataSource.signOut();
    } catch (e) {
      throw Exception('Sign out failed: $e'); // Ката иштетүү
    }
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    try {
      final user = await authDataSource.signInWithGoogle();
      return user; // Success
    } catch (e) {
      throw Exception('Google sign-in failed: $e'); // Ката иштетүү
    }
  }
}
