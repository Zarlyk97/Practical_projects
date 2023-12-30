import 'product_model.dart';

class OrderManager {
  List<Product> _orders = [];
  List<Product> get orders => _orders;

  void addOrder(Product order) {
    _orders.add(order);
  }

  void removeOrder(Product order) {
    if (_orders.contains(order)) {
      _orders.remove(order);
    }
  }

  List<Product> getAllOrders() {
    return _orders;
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in _orders) {
      total += item.price;
    }
    return total;
  }
}
