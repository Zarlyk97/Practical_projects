import 'package:eco_market/features/main/data/datasources/main_remote_data_source.dart';
import 'package:eco_market/features/main/domain/entities/category_entity.dart';
import 'package:eco_market/features/main/domain/repositories/main_repository.dart';

class MainRepoImpl implements MainRepoistory {
  final MainRemoteDataSource _remoteDataSource;

  MainRepoImpl(this._remoteDataSource);

  @override
  Future<List<CategoryEntity>> getCategory() async =>
      await _remoteDataSource.getCategory();
}
