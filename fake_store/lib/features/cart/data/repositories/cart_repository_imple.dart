import 'package:fakestore/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:fakestore/features/cart/domain/models/cart_model.dart';
import 'package:fakestore/features/cart/domain/repositories/cart_repository.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';

class CartRepositoryImple implements CartRepository {
  final CartRemoteDataSource remote;
  CartRepositoryImple(this.remote);

  @override
  Future<void> addProductTocart(int userId, ProductModel product) async {
    await remote.addProductToCart(userId, product);
  }

  @override
  Future<void> deleteProductFromCart(
    int userId,
    int productId,
  ) async {
    await remote.deleteProductFromCart(productId, userId);
  }

  @override
  Future<CartModel> getCart(int userId) async {
    return await remote.getCart(userId);
  }
}
