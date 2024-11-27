import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_cubit/features/auth/data/data_source.dart/auth_data_source.dart';
import 'package:firebase_auth_cubit/features/auth/data/repository/auth_repository_impl.dart';
import 'package:firebase_auth_cubit/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth_cubit/features/auth/domain/usecases/login_usecase.dart';
import 'package:firebase_auth_cubit/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:firebase_auth_cubit/features/auth/domain/usecases/signout_usecase.dart';
import 'package:firebase_auth_cubit/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:firebase_auth_cubit/features/home_page/data/data_source/home_remote_data_source.dart';
import 'package:firebase_auth_cubit/features/home_page/data/repository/home_repository.dart';
import 'package:firebase_auth_cubit/features/home_page/domain/repository/home_repo.dart';
import 'package:firebase_auth_cubit/features/home_page/presentation/cubit/note_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Firebase Auth Instance
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerFactory<SignUpUsecase>(() => SignUpUsecase(sl<AuthRepository>()));
  ();

  // Data Sources
  sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSource(sl<FirebaseAuth>()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl<AuthDataSource>()));

  // UseCases
  sl.registerLazySingleton(() => LoginUsecase(sl<AuthRepository>()));
  sl.registerLazySingleton(
      () => SignOutUsecase(sl<AuthRepository>())); // UseCase каттоо

  // Cubits
  if (!sl.isRegistered<AuthCubit>()) {
    sl.registerFactory(() => AuthCubit(
        sl<LoginUsecase>(), sl<SignOutUsecase>(), sl<SignUpUsecase>()));
  }
  sl.registerFactory(() => NoteCubit(
        sl<HomeRepository>(),
      ));

  // Home Page Dependencies
  sl.registerFactory<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());
  sl.registerFactory<HomeRepository>(() =>
      HomeRepositoryImpl(homeRemoteDataSource: sl<HomeRemoteDataSource>()));
}
