// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:eco_market/features/cart/domain/entities/order_entity.dart';
import 'package:eco_market/features/cart/domain/repositories/repositories.dart';

part 'cart_screen_state.dart';

class CartScreenCubit extends Cubit<CartScreenState> {
  final CartRepository _cartRepository;

  CartScreenCubit(this._cartRepository) : super(CartScreenInitial());
  getOrders() async {
    emit(CartScreenLoading());
    try {
      var list = await _cartRepository.getOrders();
      emit(CartScreenLoaded(orders: list));
    } catch (e) {
      emit(CartScreenFailure());
    }
  }
}
