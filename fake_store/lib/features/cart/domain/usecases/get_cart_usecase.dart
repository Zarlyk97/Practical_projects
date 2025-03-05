import 'package:fakestore/features/cart/domain/models/cart_model.dart';
import 'package:fakestore/features/cart/domain/repositories/cart_repository.dart';

class GetCartUsecase {
  final CartRepository cartRepository;

  GetCartUsecase(this.cartRepository);

  Future<CartModel> call(
    int userId,
  ) async =>
      await cartRepository.getCart(
        userId,
      );
}
