import 'package:eco_market/features/cart/data/datasources/datasources.dart';
import 'package:eco_market/features/cart/domain/entities/order_entity.dart';
import 'package:eco_market/features/cart/domain/repositories/repositories.dart';

class CartRepoImple implements CartRepository {
  final CartRemoteDataSourse _cartRemoteDataSourse;
  CartRepoImple(this._cartRemoteDataSourse);

  @override
  Future<List<OrderEntity>> getOrders() async =>
      await _cartRemoteDataSourse.getOrders();
}
