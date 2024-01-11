import 'package:dio/dio.dart';
import 'package:eco_market/core/error/error.dart';
import 'package:eco_market/features/main/data/models/product_model.dart';

abstract class MainRemoteDataSource {
  Future<List<CotegoryModel>> getProducts();
}

class MainRemoteDataSourceImpl implements MainRemoteDataSource {
  final Dio _dio;

  MainRemoteDataSourceImpl(this._dio);

  @override
  Future<List<CotegoryModel>> getProducts() async {
    try {
      var response = await _dio
          .get('https://neobook.online/ecobak/product-category-list/');

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> data = response.data;

        return data.map((e) => CotegoryModel.fromJson(e)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
