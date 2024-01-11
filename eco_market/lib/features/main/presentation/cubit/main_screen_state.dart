part of 'main_screen_cubit.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();

  @override
  List<Object> get props => [];
}

class MaineScreenInitial extends MainScreenState {}

class MaineScreenLoading extends MainScreenState {}

class MaineScreenLoaded extends MainScreenState {
  final List<CotegoryEntity> products;

  const MaineScreenLoaded({required this.products});
}

class MaineScreenFailure extends MainScreenState {}
