import 'package:either_dart/either.dart';
import 'package:rick_and_morty/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
