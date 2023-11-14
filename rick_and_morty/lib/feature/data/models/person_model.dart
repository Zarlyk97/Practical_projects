import 'package:rick_and_morty/feature/data/models/location_model.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';

class PersonModel extends LocationEntity {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  LocationModel origin;
  LocationModel location;
  String image;
  List<String> episode;

  DateTime created;

  PersonModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.created,
  }) : super(name: name, url: '', id: id);

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"]!,
        type: json["type"],
        gender: json["gender"]!,
        origin: json["origin"],
        location: json["location"],
        image: json["image"],
        episode:
            (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin,
        "location": location,
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "created": created.toIso8601String(),
      };
}
