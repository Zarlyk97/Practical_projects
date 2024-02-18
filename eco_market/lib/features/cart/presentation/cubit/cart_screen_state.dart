// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:eco_market/features/search/domain/entities/products_entity.dart';

abstract class CartScreenState extends Equatable {
  const CartScreenState();
  @override
  List<Object?> get props => [];
}

class CartScreenInitial extends CartScreenState {}

class CartScreenLoading extends CartScreenState {}

class CartScreenLoaded extends CartScreenState {
  final Stream<List<ProductEntity>> cart;

  const CartScreenLoaded({
    required this.cart,
  });
  @override
  List<Object?> get props => [cart];
}

class ProductRemovedFromCart extends CartScreenState {
  final int productId;
  const ProductRemovedFromCart(
    this.productId,
  );
}

class CartScreenFailure extends CartScreenState {
  final Object? exception;

  const CartScreenFailure(this.exception);
}

class AddToCartLoading extends CartScreenState {}

class AddToCartLoaded extends CartScreenState {}
