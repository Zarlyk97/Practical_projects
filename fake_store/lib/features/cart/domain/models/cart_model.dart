import 'package:fakestore/features/category/domain/models/product_model.dart';

class CartModel {
  final int id;
  final int userId;
  final DateTime date;
  final List<CartItem> products;

  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["id"],
      userId: json["userId"],
      date: DateTime.parse(json["date"]),
      products: (json["products"] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date.toIso8601String(),
        "products": products.map((item) => item.toJson()).toList(),
      };
}

class CartItem {
  int productId;
  ProductModel product;
  int quantity;

  CartItem(
      {required this.productId, required this.product, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }
}
