import 'package:dio/dio.dart';
import 'package:fakestore/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:fakestore/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fakestore/features/auth/domain/repositories/auth_repository.dart';
import 'package:fakestore/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fakestore/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:fakestore/features/cart/data/repositories/cart_repository_imple.dart';
import 'package:fakestore/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:fakestore/features/cart/domain/usecases/delete_product_from_cart_usecase.dart';
import 'package:fakestore/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:fakestore/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fakestore/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:fakestore/features/category/data/repositories/category_repository_impl.dart';
import 'package:fakestore/features/category/domain/repositories/category_repository.dart';
import 'package:fakestore/features/category/presentation/cubit/category_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/cart/domain/repositories/cart_repository.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  //cubits
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerFactory(() => CategoryCubit(sl()));
  sl.registerFactory(() => CartCubit(sl(), sl(), sl()));

  //repositories

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl(), sl()));

  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImple(sl()));
  sl.registerLazySingleton<CatergoryRemoteDataSource>(
      () => CatergoryRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImple(sl()));
  sl.registerLazySingleton<CartRemoteDataSource>(() => CartRemoteDataSourceImpl(
        sl(),
      ));
  //usecases

  sl.registerLazySingleton(() => GetCartUsecase(sl()));
  sl.registerLazySingleton(() => AddToCartUsecase(sl()));
  sl.registerLazySingleton(() => DeleteProductFromCartUsecase(sl()));

  final sharedPrefences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefences);
  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(baseUrl: 'https://fakestoreapi.com/'),
    ),
  );
}
