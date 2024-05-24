import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CartRemoteDataSource {
  Future<void> addProductToCart(
      {required int productId, required int quantity});
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final Dio dio;
  final SharedPreferences prefs;
  CartRemoteDataSourceImpl(this.dio, this.prefs);
  @override
  Future<void> addProductToCart(
      {required int productId, required int quantity}) async {
    final response = await dio.post('/carts', data: {});
    prefs.setInt('cartId', response.data['id']);
    await dio.post('/carts/${response.data['id']}/products',
        data: {"productId": productId, "quantity": quantity});
  }
}
