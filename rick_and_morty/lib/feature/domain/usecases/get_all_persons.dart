// import 'package:dartz/dartz.dart' as dartz;
import 'package:either_dart/src/either.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/core/usecases/usecase.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/domain/repositories/person_repository.dart';

class GetAllPersons extends UseCase<List<PersonEntity>, GetAllPersonsParams> {
  final PersonRepository personRepository;

  GetAllPersons(this.personRepository);

  @override
  Future<Either<Failure, List<PersonEntity>>> call(GetAllPersonsParams params) {
    return personRepository.getAllPersons(params.page);
  }
}

class GetAllPersonsParams extends Equatable {
  final int page;

  const GetAllPersonsParams({required this.page});

  @override
  List<Object?> get props => [page];
}
