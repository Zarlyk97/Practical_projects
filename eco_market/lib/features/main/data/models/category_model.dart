import 'package:eco_market/features/main/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({super.id, super.image, super.name});
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
