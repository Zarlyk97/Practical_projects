import 'package:fakestore/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:fakestore/features/cart/domain/models/cart_model.dart';
import 'package:fakestore/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImple implements CartRepository {
  final CartRemoteDataSource remote;
  CartRepositoryImple(this.remote);
  @override
  Future<void> addProductToCart(
      {required int productId, required int quantity}) {
    return remote.addProductToCart(productId: productId, quantity: quantity);
  }

  @override
  Future<void> decrement() async {
    return await remote.decrement();
  }

  @override
  Future<void> deleteAllCart() async {
    return await remote.deleteAllCart();
  }

  @override
  Future<void> deleteProductFromCart({required int productId}) async {
    return await remote.deleteProductFromCart(productId: productId);
  }

  @override
  Future<List<Product>> gytAllCartItems() async {
    return await remote.gytAllCartItems();
  }

  @override
  Future<void> increment() async {
    return await remote.increment();
  }
}
