import 'package:eco_market/features/search/domain/entities/products_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    super.category,
    super.description,
    super.id,
    super.image,
    super.price,
    super.quantity,
    super.title,
    super.count,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        quantity: json["quantity"],
        price: json["price"],
        count: json["count"] == null ? null : json['count'],
      );

  factory ProductModel.fromEntity(ProductEntity product) => ProductModel(
        category: product.category,
        description: product.description,
        id: product.id,
        image: product.image,
        price: product.price,
        quantity: product.quantity,
        title: product.title,
        count: product.count,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "image": image,
        "quantity": quantity,
        "price": price,
        if (count != null) "count": count,
      };
}
