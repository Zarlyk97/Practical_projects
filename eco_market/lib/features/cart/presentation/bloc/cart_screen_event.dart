import 'package:equatable/equatable.dart';

abstract class CartScreenEvent extends Equatable {
  const CartScreenEvent();

  @override
  List<Object> get props => [];
}

class AddProduct extends CartScreenEvent {
  final int productIndex;

  const AddProduct(this.productIndex);

  @override
  List<Object> get props => [productIndex];

  @override
  String toString() => 'AddProduct { index: $productIndex }';
}

class RemoveProduct extends CartScreenEvent {
  final int productIndex;

  const RemoveProduct(this.productIndex);

  @override
  List<Object> get props => [productIndex];

  @override
  String toString() => 'RemoveProduct { index: $productIndex }';
}
