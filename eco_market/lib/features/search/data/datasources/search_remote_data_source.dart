import 'package:dio/dio.dart';
import 'package:eco_market/core/error/exception.dart';
import 'package:eco_market/features/search/data/models/product_model.dart';

abstract class SearchRemoteDataSourse {
  Future<List<ProductModel>> getProducts({String? productType, String? search});
}

class SearchRemoteDataSourseImple implements SearchRemoteDataSourse {
  final Dio _dio;
  SearchRemoteDataSourseImple(this._dio);

  @override
  Future<List<ProductModel>> getProducts(
      {String? productType, String? search}) async {
    try {
      var response = await _dio
          .get('https://neobook.online/ecobak/product-list/', queryParameters: {
        if (productType != null) "category_name": productType,
        if (search != null) "search": search
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> data = response.data;
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
