import 'package:fakestore/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:fakestore/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImple implements CartRepository {
  final CartRemoteDataSource remote;
  CartRepositoryImple(this.remote);
  @override
  Future<void> addProductToCart(
      {required int productId, required int quantity}) {
    return remote.addProductToCart(productId: productId, quantity: quantity);
  }
}
