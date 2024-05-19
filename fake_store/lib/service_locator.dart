import 'package:dio/dio.dart';
import 'package:fakestore/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:fakestore/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fakestore/features/auth/domain/repositories/auth_repository.dart';
import 'package:fakestore/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fakestore/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:fakestore/features/category/data/repositories/category_repository_impl.dart';
import 'package:fakestore/features/category/domain/repositories/category_repository.dart';
import 'package:fakestore/features/category/presentation/cubit/category_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerFactory(() => CategoryCubit(sl()));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImple(sl()));
  sl.registerLazySingleton<CatergoryRemoteDataSource>(
      () => CatergoryRemoteDataSourceImpl(sl()));

  final sharedPrefences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefences);
  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(baseUrl: 'https://fakestoreapi.com/'),
    ),
  );
}
