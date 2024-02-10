import 'dart:developer';
import 'package:eco_market/features/cart/domain/repositories/repositories.dart';
import 'package:eco_market/features/cart/presentation/cubit/cart_screen_state.dart';
import 'package:eco_market/features/search/data/models/product_model.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenCubit extends Cubit<CartScreenState> {
  final CartRepository _cartRepository;
  CartScreenCubit(this._cartRepository) : super(CartScreenInitial());

  Stream<List<ProductEntity>> cart = const Stream.empty();

  getCartItems() async {
    try {
      emit(CartScreenLoading());
      cart = _cartRepository.getAllCartItems();
      emit(CartScreenLoaded(cart: cart));
    } catch (e) {
      emit(CartScreenFailure(e));
    }
  }

  addToCart(ProductModel product) async {
    try {
      await _cartRepository.addToCart(product);
    } catch (e) {
      log("$e");
    }
  }

  incrementCart(int productId) async {
    try {
      await _cartRepository.incrementCart(productId);
    } catch (e) {
      log("$e");
    }
  }

  removeFromCart(int productId) async {
    try {
      await _cartRepository.removeFromCart(productId);
    } catch (e) {
      log("$e");
    }
  }
}
