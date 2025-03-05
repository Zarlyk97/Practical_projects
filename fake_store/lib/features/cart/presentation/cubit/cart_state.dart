part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  List<Object> get props => [];
}

class CartLoading extends CartState {
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;
  const CartLoaded({required this.cartItems});

  @override
  List<Object> get props => [cartItems];
}

class CartError extends CartState {
  final String message;
  const CartError({required this.message});

  @override
  List<Object> get props => [message];
}
