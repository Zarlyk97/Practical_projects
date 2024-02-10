import 'package:eco_market/features/cart/data/datasources/datasources.dart';
import 'package:eco_market/features/cart/domain/repositories/repositories.dart';
import 'package:eco_market/features/search/data/models/product_model.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';

class CartRepoImpl implements CartRepository {
  final CartRemoteDataSourse _cartRemoteDataSourse;
  CartRepoImpl(this._cartRemoteDataSourse);

  @override
  Future<void> addToCart(ProductModel product) async =>
      await _cartRemoteDataSourse.addToCart(product);

  @override
  Stream<List<ProductEntity>> getAllCartItems() =>
      _cartRemoteDataSourse.getAllCartItems();

  @override
  Future<void> removeFromCart(int productId) async =>
      await _cartRemoteDataSourse.removeFromCart(productId);

  @override
  Future<void> incrementCart(int productId) async =>
      await _cartRemoteDataSourse.incrementCart(productId);
}
