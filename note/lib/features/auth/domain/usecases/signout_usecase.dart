import 'package:firebase_auth_cubit/features/auth/domain/repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository repository;

  SignOutUsecase(this.repository);

  Future<void> call() async {
    return await repository.signOut();
  }
}
