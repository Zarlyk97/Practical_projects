import 'package:eco_market/features/search/data/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel extends ChangeNotifier {
  var productLists = <ProductModel>[];
  var cartLists = <ProductModel>[];
  var isLoading = true;

  int get countCart => cartLists.length;
  String get totalPrice => cartLists.fold(
      '0', (previousValue, element) => previousValue + element.price!);

  setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  Future<void> getAllProducts() async {
    // var product = await  SearchRemoteDataSourse.getProducts();
    // productLists = product;
    setLoading(false);
  }

  void addProduct(ProductModel p) {
    productLists.add(p);
  }

  void removeProduct(ProductModel p) {
    productLists.remove(p);
  }

  addCart(ProductModel item) {
    cartLists.remove(item);
    notifyListeners();
  }

  removeCart(ProductModel item) {
    cartLists.remove(item);
    notifyListeners();
  }

  clearCart() {
    cartLists.clear();
  }
}
