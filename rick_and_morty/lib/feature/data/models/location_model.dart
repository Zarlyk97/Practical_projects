import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    id,
    name,
    url,
  }) : super(id: id, name: name, url: url);

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
