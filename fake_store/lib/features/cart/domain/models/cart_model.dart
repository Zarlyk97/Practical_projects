// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartModel {
  int? id;
  int? userId;
  DateTime? date;
  List<Product>? products;
  int? v;

  CartModel({
    this.id,
    this.userId,
    this.date,
    this.products,
    this.v,
  });

  CartModel copyWith({
    int? id,
    int? userId,
    DateTime? date,
    List<Product>? products,
    int? v,
  }) =>
      CartModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        date: date ?? this.date,
        products: products ?? this.products,
        v: v ?? this.v,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'date': date?.millisecondsSinceEpoch,
      'products': products!.map((x) => x.toMap()).toList(),
      'v': v,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] != null ? map['id'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : null,
      products: map['products'] != null
          ? List<Product>.from(
              (map['products'] as List<int>).map<Product?>(
                (x) => Product.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      v: map['v'] != null ? map['v'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Product {
  int? productId;
  int? quantity;

  Product({
    this.productId,
    this.quantity,
  });

  Product copyWith({
    int? productId,
    int? quantity,
  }) =>
      Product(
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'] != null ? map['productId'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
