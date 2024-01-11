import 'package:eco_market/features/main/domain/entities/product_entity.dart';

// class ProductModel extends ProductEntity {
//   ProductModel({
//     super.category,
//     super.description,
//     super.id,
//     super.image,
//     super.price,
//     super.quantity,
//     super.title,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         category: json["category"],
//         image: json["image"],
//         quantity: json["quantity"],
//         price: json["price"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "category": category,
//         "image": image,
//         "quantity": quantity,
//         "price": price,
//       };
// }
class CotegoryModel extends CotegoryEntity {
  CotegoryModel({super.id, super.image, super.name});
  factory CotegoryModel.fromJson(Map<String, dynamic> json) => CotegoryModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
