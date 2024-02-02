// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class CartScreenState {
  final List<int> cartItem;
  const CartScreenState({required this.cartItem});

  List<Object> get props => [];
}

class CartLoadInProgress extends CartScreenState {
  CartLoadInProgress({required super.cartItem});
}

class ProductAdded extends CartScreenState {
  @override
  // ignore: overridden_fields
  final List<int> cartItem;

  const ProductAdded({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductAdded { todos: $cartItem }';
}

class ProductRemoved extends CartScreenState {
  final List<int> cartItem;

  const ProductRemoved({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductRemoved { todos: $cartItem }';
}
