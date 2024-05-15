import 'package:album/album/data/datasources/album_remote_data_source.dart';
import 'package:album/album/data/repositories/album_repository.dart';
import 'package:album/album/domain/repositories/album_repositry.dart';
import 'package:album/album/presentation/cubit/album_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> serviceLocator() async {
  sl.registerFactory(() => AlbumCubit(sl()));
  sl.registerLazySingleton<AlbumRepository>(() => AlbumRepositoryimpl(sl()));
  sl.registerLazySingleton<AlbumRemoteDataSource>(
      () => AlbumRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton(() => Dio());
}
