import 'package:bloc/bloc.dart';
import 'package:eco_market/features/main/domain/entities/product_entity.dart';
import 'package:eco_market/features/main/domain/repositories/main_repository.dart';
import 'package:equatable/equatable.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  final MainRepoistory _mainRepoistory;
  MainScreenCubit(this._mainRepoistory) : super(MaineScreenInitial());

  getProducts() async {
    emit(MaineScreenLoading());
    try {
      var list = await _mainRepoistory.getProducts();

      emit(MaineScreenLoaded(products: list));
    } catch (e) {
      emit(MaineScreenFailure());
    }
  }
}
