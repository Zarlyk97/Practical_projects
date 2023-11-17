import 'package:either_dart/either.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/core/platform/network_info.dart';
import 'package:rick_and_morty/feature/data/datasources/person_local_data_source.dart';
import 'package:rick_and_morty/feature/data/datasources/person_remote_data_sourse.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/domain/repositories/person_repository.dart';

class PersonRepositoryimpl implements PersonRepository {
  final PersonRemoteDataSourse remoteDataSourse;
  final PersonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryimpl({
    required this.remoteDataSourse,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await remoteDataSourse.getAllPersons(page);
        localDataSource.personsToCache(remotePerson);
        return Right(remotePerson.cast<PersonEntity>());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationPerson = await localDataSource.getLastPersonFromCache();
        return Right(locationPerson.cast<PersonEntity>());
      } on CashException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await remoteDataSourse.searchPerson(query);
        localDataSource.personsToCache(remotePerson);
        return Right(remotePerson.cast<PersonEntity>());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationPerson = await localDataSource.getLastPersonFromCache();
        return Right(locationPerson.cast<PersonEntity>());
      } on CashException {
        return Left(CacheFailure());
      }
    }
  }
}
