import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rick_and_morty/core/platform/network_info.dart';
import 'package:rick_and_morty/feature/data/datasources/person_local_data_source.dart';
import 'package:rick_and_morty/feature/data/datasources/person_remote_data_sourse.dart';
import 'package:rick_and_morty/feature/data/repositories/person_repository_impl.dart';
import 'package:rick_and_morty/feature/domain/repositories/person_repository.dart';
import 'package:rick_and_morty/feature/domain/usecases/get_all_persons.dart';
import 'package:rick_and_morty/feature/domain/usecases/search_persons.dart';
import 'package:rick_and_morty/feature/presentation/bloc/bloc/search_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/cubit/search_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
// Bloc / cubit
  sl.registerFactory(
    () => PersonsListcubit(getAllPersons: sl()),
  );
  sl.registerFactory(
    () => PersonSearchBloc(searchPerson: sl()),
  );

// useCase
  sl.registerLazySingleton(
    () => GetAllPersons(sl()),
  );
  sl.registerLazySingleton(
    () => SearchPerson(sl()),
  );

// Repository
  sl.registerLazySingleton<PersonRepository>(
    () => PersonRepositoryimpl(
      remoteDataSourse: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<PersonRemoteDataSourse>(
    () => PersonRemoteDataSourseImple(client: http.Client()),
  );
  sl.registerLazySingleton<PersonLocalDataSource>(
    () => PersonLocalDataSourceImpl(sharedPreferences: sl()),
  );

// Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl()),
  );

//External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
