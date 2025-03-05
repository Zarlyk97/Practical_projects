import 'package:fakestore/features/cart/domain/models/cart_model.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';

abstract class CartRepository {
  Future<CartModel> getCart(int userId);

  Future<void> deleteProductFromCart(int userId, int productId);

  Future<void> addProductTocart(int userId, ProductModel product);
}
