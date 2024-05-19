import 'package:dio/dio.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';

abstract class CatergoryRemoteDataSource {
  Future<List<String>> getCategories();
  Future<List<ProductModel>> getProductsByCategory(String category);
  Future<ProductModel> getProductById(int id);
}

class CatergoryRemoteDataSourceImpl implements CatergoryRemoteDataSource {
  Dio dio;
  CatergoryRemoteDataSourceImpl(
    this.dio,
  );

  //get categories
  @override
  Future<List<String>> getCategories() async {
    try {
      var res = await dio.get('products/categories');
      List<String> categories = [];
      for (var category in res.data) {
        categories.add(category.toString());
      }

      return categories;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //get products

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      var res = await dio.get('products/category/$category');
      List data = res.data;
      return data
          .map<ProductModel>((product) => ProductModel.fromJson(product))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //get product by id
  @override
  Future<ProductModel> getProductById(int id) async {
    try {
      var res = await dio.get('products/$id');
      return ProductModel.fromJson(res.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
