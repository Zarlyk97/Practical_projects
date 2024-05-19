import 'package:dio/dio.dart';
import 'package:fakestore/features/auth/domain/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl(this.dio);
  @override
  Future<UserModel> login(String email, String password) async {
    try {
      var res = await dio
          .post('auth/login', data: {'email': email, 'password': password});
      return UserModel.fromJson(res.data);
    } catch (e) {
      return const UserModel(token: 'token');
    }
  }
}
