import 'package:eco_market/features/search/data/models/product_model.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel extends ChangeNotifier {
  var productLists = <ProductEntity>[];
  var cartLists = <ProductEntity>[];
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

  addCart(ProductEntity item) {
    cartLists.add(item);
    notifyListeners();
  }

  removeCart(ProductEntity item) {
    cartLists.remove(item);
    notifyListeners();
  }

  clearCart() {
    cartLists.clear();
  }
}
