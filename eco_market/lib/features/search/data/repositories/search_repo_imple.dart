// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eco_market/features/search/data/datasources/search_remote_data_source.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';
import 'package:eco_market/features/search/domain/repositories/search_repository.dart';

class SearchRepoImple implements SearchRepository {
  final SearchRemoteDataSourse _remoteDataSourse;
  SearchRepoImple(this._remoteDataSourse);
  @override
  Future<List<ProductEntity>> getProducts() async =>
      await _remoteDataSourse.getProducts();
}
