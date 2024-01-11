import 'package:eco_market/features/main/data/datasources/main_remote_data_source.dart';
import 'package:eco_market/features/main/domain/entities/product_entity.dart';
import 'package:eco_market/features/main/domain/repositories/main_repository.dart';

class MainRepoImpl implements MainRepoistory {
  final MainRemoteDataSource _remoteDataSource;

  MainRepoImpl(this._remoteDataSource);

  @override
  Future<List<CotegoryEntity>> getProducts() async =>
      await _remoteDataSource.getProducts();
}
