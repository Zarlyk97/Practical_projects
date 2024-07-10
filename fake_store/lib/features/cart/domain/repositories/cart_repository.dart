import 'package:fakestore/features/cart/domain/models/cart_model.dart';

abstract class CartRepository {
  Future<void> addProductToCart(
      {required int productId, required int quantity});

  Future<void> increment();

  Future<void> decrement();

  Future<void> deleteProductFromCart({required int productId});

  Future<void> deleteAllCart();

  Future<List<Product>> gytAllCartItems();
}
