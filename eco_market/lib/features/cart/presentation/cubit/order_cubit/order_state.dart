part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class Orderloading extends OrderState {}

final class OrderLoaded extends OrderState {}

final class OrderFailure extends OrderState {}
