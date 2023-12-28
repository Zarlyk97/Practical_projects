import 'product.dart';

class ProductsScreen {
  List<Product> cart = [];
  void addToCart(Product product) {
    cart.add(product);
  }

  double getTotal() {
    double total = 0;
    for (var product in cart) {
      total += product.price;
    }

    return total;
  }
}
