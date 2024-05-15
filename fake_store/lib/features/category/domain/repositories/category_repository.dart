import 'package:fakestore/features/category/domain/models/product_model.dart';

abstract class CategoryRepository {
  Future<List<String>> getCategories();
  Future<List<ProductModel>> getProductsByCategory(String category);
  Future<ProductModel> getProductById(int id);
}
