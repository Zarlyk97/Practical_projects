import 'package:dio/dio.dart';
import 'package:eco_market/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:eco_market/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:eco_market/features/cart/domain/repositories/repositories.dart';
import 'package:eco_market/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:eco_market/features/main/data/datasources/main_remote_data_source.dart';
import 'package:eco_market/features/main/data/repositories/main_repo_impl.dart';
import 'package:eco_market/features/main/domain/repositories/main_repository.dart';
import 'package:eco_market/features/main/presentation/cubit/main_screen_cubit.dart';
import 'package:eco_market/features/search/data/datasources/search_remote_data_source.dart';
import 'package:eco_market/features/search/data/repositories/search_repo_imple.dart';
import 'package:eco_market/features/search/domain/repositories/search_repository.dart';
import 'package:eco_market/features/search/presentation/cubit/search_screen_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/main/presentation/cubit/connection/connection_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => MainScreenCubit(sl()));

  sl.registerLazySingleton<MainRepoistory>(() => MainRepoImpl(sl()));
  sl.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(sl()));

  sl.registerFactory(() => SearchScreenCubit(sl()));

  sl.registerLazySingleton<SearchRepository>(() => SearchRepoImple(sl()));
  sl.registerLazySingleton<SearchRemoteDataSourse>(
      () => SearchRemoteDataSourseImple(sl()));

  sl.registerFactory(() => CartScreenCubit(sl()));
  sl.registerLazySingleton<CartRepository>(() => CartRepoImpl(sl()));
  sl.registerLazySingleton<CartRemoteDataSourse>(
      () => CartRemoteDataSourseImple());
  sl.registerFactory(() => ConnectionCubit());
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => Dio());
}
