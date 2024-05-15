// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fakestore/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';
import 'package:fakestore/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImple implements CategoryRepository {
  CatergoryRemoteDataSource remoteDataSource;
  CategoryRepositoryImple(this.remoteDataSource);

  @override
  Future<List<String>> getCategories() {
    return remoteDataSource.getCategories();
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) {
    return remoteDataSource.getProductsByCategory(category);
  }

  @override
  Future<ProductModel> getProductById(int id) {
    return remoteDataSource.getProductById(id);
  }
}
