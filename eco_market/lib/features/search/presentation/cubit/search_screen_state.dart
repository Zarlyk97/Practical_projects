part of 'search_screen_cubit.dart';

abstract class SearchScreenState extends Equatable {
  const SearchScreenState();

  @override
  List<Object> get props => [];
}

class SearchScreenInitial extends SearchScreenState {}

class SearchScreenLoading extends SearchScreenState {}

class SearchScreenLoaded extends SearchScreenState {
  final List<ProductEntity> products;

  const SearchScreenLoaded({required this.products});
}

class SearchScreenFailure extends SearchScreenState {}
