import 'package:dio/dio.dart';
import 'package:fakestore/core/constants/constants.dart';
import 'package:fakestore/features/auth/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  Future<void> login(String email, String password);

  Future<void> register(UserModel user);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;
  AuthRemoteDataSourceImpl(this.dio, this.sharedPreferences);
  @override
  Future<void> login(String email, String password) async {
    final response = await dio.post("https://fakestoreapi.com/auth/login",
        data: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      await sharedPreferences.setString(
          ApiConsts.token, response.data['token']);
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<void> register(UserModel user) async {
    final response = await dio.post('/users', data: {
      "username": user.email,
      "password": user.password,
      "name": user.name?.firstname ?? 'No name'
    });

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to register');
    }
  }
}
