import 'product_model.dart';

class ProductsScreenModel {
  final List<ProductModel> _cart = [];
  List<ProductModel> get cart => _cart;

  void addToCart(ProductModel product) {
    _cart.add(product);
  }

  double getTotal() {
    double total = 0;
    for (var product in _cart) {
      total += product.price;
    }

    return total;
  }
}
