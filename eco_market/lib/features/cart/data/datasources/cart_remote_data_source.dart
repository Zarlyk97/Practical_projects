import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_market/features/search/data/models/product_model.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';

abstract class CartRemoteDataSourse {
  Stream<List<ProductEntity>> getAllCartItems();
  Future<void> addToCart(ProductModel product);
  Future<void> removeFromCart(int productId);
  Future<void> incrementCart(int productId);
  Future<void> decrementCart(int productId);
}

class CartRemoteDataSourseImple implements CartRemoteDataSourse {
  final _fireStore = FirebaseFirestore.instance;

  @override
  Future<void> addToCart(ProductModel product) async {
    await _fireStore
        .collection('cart')
        .doc("${product.id}")
        .set(product.toJson());
  }

  @override
  Stream<List<ProductEntity>> getAllCartItems() {
    return _fireStore.collection('cart').snapshots().map((item) =>
        item.docs.map((e) => ProductModel.fromJson(e.data())).toList());
  }

  @override
  Future<void> removeFromCart(int productId) async {
    await _fireStore.collection('cart').doc("$productId").delete();
  }

  @override
  Future<void> incrementCart(int productId) async {
    var doc = _fireStore.collection('cart').doc("$productId");

    await _fireStore.runTransaction((transaction) async {
      final docSnapshot = await transaction.get(doc);

      if (docSnapshot.exists) {
        int newCount = docSnapshot.get('quantity') + 1;
        transaction.update(doc, {'quantity': newCount});
      }
    });
  }

  @override
  Future<void> decrementCart(int productId) async {
    var doc = _fireStore.collection('cart').doc("$productId");

    await _fireStore.runTransaction((transaction) async {
      final docSnapshot = await transaction.get(doc);

      if (docSnapshot.exists) {
        int newCount = docSnapshot.get('quantity') - 1;
        transaction.update(doc, {'quantity': newCount});
      }
    });
  }
}
