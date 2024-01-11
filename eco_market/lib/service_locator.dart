import 'package:dio/dio.dart';
import 'package:eco_market/features/main/data/datasources/main_remote_data_source.dart';
import 'package:eco_market/features/main/data/repositories/main_repo_impl.dart';
import 'package:eco_market/features/main/domain/repositories/main_repository.dart';
import 'package:eco_market/features/main/presentation/cubit/main_screen_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => MainScreenCubit(sl()));

  sl.registerLazySingleton<MainRepoistory>(() => MainRepoImpl(sl()));
  sl.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton(() => Dio());
}
