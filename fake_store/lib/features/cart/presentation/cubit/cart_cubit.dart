import 'package:equatable/equatable.dart';
import 'package:fakestore/features/cart/domain/models/cart_model.dart';
import 'package:fakestore/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:fakestore/features/cart/domain/usecases/delete_product_from_cart_usecase.dart';
import 'package:fakestore/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final AddToCartUsecase addToCartUsecase;
  final DeleteProductFromCartUsecase deleteProductFromCartUsecase;
  final GetCartUsecase getCartUsecase;

  CartCubit(this.addToCartUsecase, this.deleteProductFromCartUsecase,
      this.getCartUsecase)
      : super(CartInitial());

  Future<void> getCart(int userId) async {
    emit(CartLoading());
    try {
      final cart = await getCartUsecase(
        userId,
      );
      emit(CartLoaded(cartItems: cart.products));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> addToCart(int userId, ProductModel product) async {
    emit(CartLoading());
    try {
      await addToCartUsecase(userId, product);
      final updatedCart = await getCartUsecase(
        userId,
      );
      emit(CartLoaded(
        cartItems: updatedCart.products,
      ));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> deleteProductFromCart(int userId, int productId) async {
    emit(CartLoading());
    try {
      await deleteProductFromCartUsecase(userId, productId);
      final updatedCart = await getCartUsecase(
        userId,
      );
      emit(CartLoaded(cartItems: updatedCart.products));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
