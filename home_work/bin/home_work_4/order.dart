import 'product.dart';

class Order {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
  }

  double getTotal() {
    double total = 0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }
}
