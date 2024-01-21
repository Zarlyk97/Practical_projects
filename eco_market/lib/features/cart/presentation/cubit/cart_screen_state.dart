// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_screen_cubit.dart';

abstract class CartScreenState extends Equatable {
  const CartScreenState();

  @override
  List<Object> get props => [];
}

class CartScreenInitial extends CartScreenState {}

class CartScreenLoading extends CartScreenState {}

class CartScreenLoaded extends CartScreenState {
  final List<OrderEntity> orders;
  const CartScreenLoaded({
    required this.orders,
  });
}

class CartScreenFailure extends CartScreenState {}
