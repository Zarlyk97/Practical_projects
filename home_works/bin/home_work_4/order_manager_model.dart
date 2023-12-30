import 'product_model.dart';

class OrderManager {
  final List<ProductModel> _orders = [];
  List<ProductModel> get orders => _orders;
  set order(int value) => order = value;

  void addOrder(ProductModel order) {
    _orders.add(order);
  }

  void removeOrder(ProductModel order) {
    if (_orders.contains(order)) {
      _orders.remove(order);
    }
  }

  List<ProductModel> getAllOrders() {
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
