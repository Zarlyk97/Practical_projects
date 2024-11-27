import 'package:firebase_auth_cubit/features/home_page/data/data_source/home_remote_data_source.dart';
import 'package:firebase_auth_cubit/features/home_page/data/repository/home_repository.dart';
import 'package:firebase_auth_cubit/features/home_page/domain/repository/home_repo.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerFactory<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());
  sl.registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDataSource: sl()));
}
