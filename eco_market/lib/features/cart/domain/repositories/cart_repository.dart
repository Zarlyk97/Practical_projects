import 'package:eco_market/features/cart/domain/entities/order_entity.dart';

abstract class CartRepository {
  Future<List<OrderEntity>> getOrders();
}

abstract class SendAnOrderRepository {
  Future<List<SendOrderEntity>> sendAnOrder();
}
