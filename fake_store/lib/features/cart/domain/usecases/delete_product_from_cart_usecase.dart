import 'package:fakestore/features/cart/domain/repositories/cart_repository.dart';

class DeleteProductFromCartUsecase {
  final CartRepository cartRepository;

  DeleteProductFromCartUsecase(this.cartRepository);

  Future<void> call(
    int userId,
    int productId,
  ) async =>
      cartRepository.deleteProductFromCart(
        userId,
        productId,
      );
}
