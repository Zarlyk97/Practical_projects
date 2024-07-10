import 'package:dio/dio.dart';
import 'package:fakestore/features/cart/domain/models/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CartRemoteDataSource {
  Future<void> addProductToCart(
      {required int productId, required int quantity});

  Future<void> increment();

  Future<void> decrement();

  Future<void> deleteProductFromCart({required int productId});

  Future<void> deleteAllCart();

  Future<List<Product>> gytAllCartItems();
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

  @override
  Future<void> decrement() {
    // TODO: implement decrement
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllCart() {
    // TODO: implement deleteAllCart
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProductFromCart({required int productId}) {
    // TODO: implement deleteProductFromCart
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> gytAllCartItems() {
    // TODO: implement gytAllCartItems
    throw UnimplementedError();
  }

  @override
  Future<void> increment() {
    // TODO: implement increment
    throw UnimplementedError();
  }
}
