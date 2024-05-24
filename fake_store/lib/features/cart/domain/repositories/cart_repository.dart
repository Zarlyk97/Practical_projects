abstract class CartRepository {
  Future<void> addProductToCart(
      {required int productId, required int quantity});
}
