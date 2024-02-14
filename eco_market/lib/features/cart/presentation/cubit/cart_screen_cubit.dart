import 'dart:developer';
import 'package:eco_market/features/cart/domain/repositories/repositories.dart';
import 'package:eco_market/features/cart/presentation/cubit/cart_screen_state.dart';
import 'package:eco_market/features/search/data/models/product_model.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenCubit extends Cubit<CartScreenState> {
  final CartRepository _cartRepository;
  CartScreenCubit(this._cartRepository)
      : super(
          CartScreenInitial(),
        );

  Stream<List<ProductEntity>> cart = const Stream.empty();

  getCartItems() async {
    try {
      emit(CartScreenLoading());
      cart = _cartRepository.getAllCartItems();
      emit(CartScreenLoaded(cart: cart));
      await getCartItems();
    } catch (e) {
      emit(CartScreenFailure(e));
    }
  }

  addToCart(ProductModel product) async {
    try {
      await _cartRepository.addToCart(product);
      await getCartItems();
    } catch (e) {
      log("$e");
    }
  }

  incrementCart(int productId) async {
    try {
      await _cartRepository.incrementCart(productId);
      await getCartItems();
    } catch (e) {
      log("$e");
    }
  }

  decrementCart(int productId) async {
    try {
      await _cartRepository.decrementCart(productId);
      await getCartItems();
    } catch (e) {
      log("$e");
    }
  }

  removeFromCart(int productId) async {
    try {
      await _cartRepository.removeFromCart(productId);
      await getCartItems();
    } catch (e) {
      log("$e");
    }
  }
}
