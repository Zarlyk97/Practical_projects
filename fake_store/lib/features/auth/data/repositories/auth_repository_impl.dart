import 'package:fakestore/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:fakestore/features/auth/domain/models/user_model.dart';
import 'package:fakestore/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<UserModel> login(String email, String password) async {
    return await authRemoteDataSource.login(email, password);
  }

  @override
  Future<UserModel> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserModel> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<bool> removeUser() {
    // TODO: implement removeUser
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUser(UserModel user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
