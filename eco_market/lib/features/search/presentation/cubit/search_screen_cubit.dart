import 'package:bloc/bloc.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';
import 'package:eco_market/features/search/domain/repositories/search_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  final Searchrepository _searchrepository;
  SearchScreenCubit(this._searchrepository) : super(SearchScreenInitial());
  getProducts() async {
    emit(SearchScreenLoading());
    try {
      var list = await _searchrepository.getProducts();
      emit(SearchScreenLoaded(products: list));
    } catch (e) {
      emit(SearchScreenFailure());
    }
  }
}
