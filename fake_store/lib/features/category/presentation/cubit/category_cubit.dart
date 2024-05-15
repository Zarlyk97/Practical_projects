import 'package:equatable/equatable.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';
import 'package:fakestore/features/category/domain/repositories/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  getCategories() async {
    emit(GetCategoryLoading());
    try {
      final categories = await categoryRepository.getCategories();
      emit(GetCategoryLoaded(categories));
    } catch (e) {
      emit(GetCategoryError(e.toString()));
    }
  }

  getProductsByCategory(String category) async {
    emit(GetProductsByCategoryLoading());
    try {
      final products = await categoryRepository.getProductsByCategory(category);
      emit(GetProductsByCategoryLoaded(products));
    } catch (e) {
      emit(GetProductsByCategoryError(e.toString()));
    }
  }

  getProductById(int id) async {
    emit(GetProductByIdLoading());
    try {
      final products = await categoryRepository.getProductById(id);
      emit(GetProductByIdLoaded(products));
    } catch (e) {
      emit(GetProductByIdError(e.toString()));
    }
  }
}
