import '../models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);

  Future<UserModel> register(String email, String password);

  Future<UserModel> getUser();

  Future<bool> logout();

  Future<bool> saveUser(UserModel user);

  Future<bool> removeUser();
}
