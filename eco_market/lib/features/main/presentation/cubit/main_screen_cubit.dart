import 'package:eco_market/features/main/domain/entities/category_entity.dart';
import 'package:eco_market/features/main/domain/repositories/main_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  final MainRepoistory _mainRepoistory;
  MainScreenCubit(this._mainRepoistory) : super(MainScreenInitial());

  getCategory() async {
    try {
      if (state is! MainScreenLoaded) {
        emit(MainScreenLoading());
      }

      var list = await _mainRepoistory.getCategory();

      emit(MainScreenLoaded(category: list));
    } catch (e) {
      emit(MainScreenFailure());
    }
  }
}
