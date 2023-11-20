import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/domain/usecases/get_all_persons.dart';
import 'package:rick_and_morty/feature/presentation/bloc/cubit/search_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PersonListcubit extends Cubit<PersonState> {
  final GetAllPersons getAllPersons;
  PersonListcubit({required this.getAllPersons}) : super(Personempty());
  int page = 1;
  void loadPerson() async {
    if (state is PersonLoading) return;
    final currentState = state;

    var oldPerson = <PersonEntity>[];
    if (currentState is PersonLoaded) {
      oldPerson = currentState.personsList;

      emit(PersonLoading(oldPerson, isFirstFech: page == 1));
      final failureOrPerson = await getAllPersons(PagePersonParams(page: page));
      failureOrPerson.fold(
        (error) => emit(PersonError(message: _mapFailureToMessage(error))),
        (character) {
          page++;
          final persons = (state as PersonLoading).oldPersonsList;
          persons.addAll(character);
          emit(PersonLoaded(persons));
        },
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
