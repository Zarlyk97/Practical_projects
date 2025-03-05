import 'package:dio/dio.dart';
import 'package:fakestore/features/cart/domain/models/cart_model.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart(int userId);
  Future<void> deleteProductFromCart(int userId, int productId);
  Future<void> addProductToCart(int userId, ProductModel product);
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final Dio dio;
  CartRemoteDataSourceImpl(this.dio);

  @override
  Future<CartModel> getCart(int userId) async {
    try {
      final response = await dio.get('carts/user/$userId');
      CartModel cart = CartModel.fromJson(response.data[0]);

      for (var item in cart.products) {
        final productResponse = await dio.get('products/${item.productId}');
        item.product = ProductModel.fromJson(productResponse.data);
      }
      return cart;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? "Unknown error");
    }
  }

  @override
  Future<void> addProductToCart(int userId, ProductModel product) async {
    try {
      final cart = await getCart(userId);

      List<CartItem> updatedProducts = List.from(cart.products);
      bool productExists = false;

      for (var item in updatedProducts) {
        if (item.product.id == product.id) {
          item.quantity += 1;
          productExists = true;
          break;
        }
      }

      if (!productExists) {
        updatedProducts.add(
            CartItem(productId: product.id!, product: product, quantity: 1));
      }

      await dio.put('carts/${cart.id}', data: {
        'userId': userId,
        'date': DateTime.now().toIso8601String(),
        'products': updatedProducts
            .map((p) => {'productId': p.product.id, 'quantity': p.quantity})
            .toList(),
      });
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? "Unknown error");
    }
  }

  @override
  Future<void> deleteProductFromCart(int userId, int productId) async {
    try {
      final cart = await getCart(userId);

      List<CartItem> updatedProducts =
          cart.products.where((p) => p.product.id != productId).toList();

      await dio.put('carts/${cart.id}', data: {
        'userId': userId,
        'date': DateTime.now().toIso8601String(),
        'products': updatedProducts
            .map((p) => {'productId': p.product.id, 'quantity': p.quantity})
            .toList(),
      });
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? "Unknown error");
    }
  }
}
