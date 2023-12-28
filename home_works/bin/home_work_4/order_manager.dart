import 'order.dart';

class OrderManager {
  List<Order> orders = [];
  void addOrder(Order order) {
    orders.add(order);
  }

  void removeOrder(Order order) {
    if (orders.contains(order)) {
      orders.remove(order);
    }
  }

  List<Order> getAllOrders() {
    return orders;
  }
}
