import 'package:either_dart/either.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/feature/data/datasources/person_local_data_source.dart';
import 'package:rick_and_morty/feature/data/datasources/person_remote_data_sourse.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/domain/repositories/person_repository.dart';

class PersonRepositoryimpl implements PersonRepository {
  final PersonRemoteDataSource remoteDataSourse;
  final PersonLocalDataSource localDataSource;

  PersonRepositoryimpl({
    required this.remoteDataSourse,
    required this.localDataSource,
  });
/////////////////////////////////////////
  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page) async {
    final remotePerson = await remoteDataSourse.getAllPersons(page);
    localDataSource.personsToCache(remotePerson);
    return Right(remotePerson.cast<PersonEntity>());
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query) async {
    try {
      final remotePerson = await remoteDataSourse.searchPerson(query);
      localDataSource.personsToCache(remotePerson);
      return Right(remotePerson.cast<PersonEntity>());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
