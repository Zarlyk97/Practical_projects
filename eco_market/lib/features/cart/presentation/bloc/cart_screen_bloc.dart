import 'package:eco_market/features/cart/presentation/bloc/cart_screen_event.dart';
import 'package:eco_market/features/cart/presentation/bloc/cart_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(const ProductAdded(cartItem: [])) {
    on<AddProduct>((event, emit) {
      _cartItems.add(event.productIndex);
      emit(ProductAdded(cartItem: _cartItems));
    });

    on<RemoveProduct>((event, emit) {
      _cartItems.remove(event.productIndex);
      emit(ProductRemoved(cartItem: _cartItems));
    });
  }

  final List<int> _cartItems = [];
  List<int> get items => _cartItems;
}
