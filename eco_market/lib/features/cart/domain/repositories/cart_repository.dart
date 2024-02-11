import 'package:eco_market/features/search/data/models/product_model.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';

abstract class CartRepository {
  Stream<List<ProductEntity>> getAllCartItems();
  Future<void> addToCart(ProductModel product);
  Future<void> removeFromCart(int productId);
  Future<void> incrementCart(int productId);
  Future<void> decrementCart(int productId);
}
