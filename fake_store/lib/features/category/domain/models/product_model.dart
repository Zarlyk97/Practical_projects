import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int? id;
  String? title;
  num? price;
  String? category;
  String? description;
  String? image;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        category: json["category"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "category": category,
        "description": description,
        "image": image,
      };
}
