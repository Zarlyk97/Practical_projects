part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

//get categories

class GetCategoryLoading extends CategoryState {}

class GetCategoryLoaded extends CategoryState {
  final List<String> categories;
  const GetCategoryLoaded(this.categories);
  @override
  List<Object> get props => [categories];
}

class GetCategoryError extends CategoryState {
  final String message;

  const GetCategoryError(this.message);
}
//get products

class GetProductsByCategoryLoading extends CategoryState {}

class GetProductsByCategoryLoaded extends CategoryState {
  final List<ProductModel> products; //products
  const GetProductsByCategoryLoaded(this.products);
  @override
  List<Object> get props => [products];
}

class GetProductsByCategoryError extends CategoryState {
  final String message; //products
  const GetProductsByCategoryError(this.message);
  @override
  List<Object> get props => [message];
}

//get product by id

class GetProductByIdLoading extends CategoryState {}

class GetProductByIdLoaded extends CategoryState {
  final ProductModel product; //products
  const GetProductByIdLoaded(this.product);
  @override
  List<Object> get props => [product];
}

class GetProductByIdError extends CategoryState {
  final String message; //products
  const GetProductByIdError(this.message);
  @override
  List<Object> get props => [message];
}
