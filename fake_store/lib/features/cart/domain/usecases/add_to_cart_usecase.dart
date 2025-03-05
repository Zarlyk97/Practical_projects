import 'package:fakestore/features/cart/domain/repositories/cart_repository.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';

class AddToCartUsecase {
  final CartRepository cartRepository;

  AddToCartUsecase(this.cartRepository);

  Future<void> call(int userId, ProductModel product) async {
    return cartRepository.addProductTocart(
      userId,
      product,
    );
  }
}
