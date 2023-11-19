// import 'package:rick_and_morty/feature/data/models/location_model.dart';
// import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';

// class PersonModel extends LocationEntity {
//   int id;
//  String name;
//   String status;
//   String species;
//   String type;
//   String gender;
//   LocationModel origin;
//   LocationModel location;
//   String image;
//   List<String> episode;

//   DateTime created;

//   PersonModel({
//     required this.id,
//     required this.name,
//     required this.status,
//     required this.species,
//     required this.type,
//     required this.gender,
//     required this.origin,
//     required this.location,
//     required this.image,
//     required this.episode,
//     required this.created,
//   }) :  super(
//     id: id,
//     name: name,
//     status: status,
//     species: species,
//     type: type,
//     gender: gender,
//     origin: origin,
//     location: location,
//     image: image,
//     episode: episode,
//     created: created,
//   );

//   factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
//         id: json["id"],
//         name: json["name"],
//         status: json["status"],
//         species: json["species"]!,
//         type: json["type"],
//         gender: json["gender"]!,
//        origin: json['origin'] != null ? LocationModel.fromJson(json['origin']) : null,
//       location: json['location'] != null ? LocationModel.fromJson(json['location']) : null,
//         image: json["image"],
//         episode:
//             (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
//         created: DateTime.parse(json["created"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "status": status,
//         "species": species,
//         "type": type,
//         "gender": gender,
//         "origin": origin,
//         "location": location,
//         "image": image,
//         "episode": List<dynamic>.from(episode.map((x) => x)),
//         "created": created.toIso8601String(),
//       };
// }
// // To parse this JSON data, do
// //
// //     final personModel = personModelFromJson(jsonString);

import 'dart:convert';

PersonModel personModelFromJson(String str) =>
    PersonModel.fromJson(json.decode(str));

String personModelToJson(PersonModel data) => json.encode(data.toJson());

class PersonModel {
  Info info;
  List<Result> results;

  PersonModel({
    required this.info,
    required this.results,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        info: Info.fromJson(json["info"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  int count;
  int pages;
  String next;
  dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

class Result {
  int id;
  String name;
  Status status;
  Species species;
  String type;
  Gender gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  Result({
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
    required this.url,
    required this.created,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        species: speciesValues.map[json["species"]]!,
        type: json["type"],
        gender: genderValues.map[json["gender"]]!,
        origin: Location.fromJson(json["origin"]),
        location: Location.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": statusValues.reverse[status],
        "species": speciesValues.reverse[species],
        "type": type,
        "gender": genderValues.reverse[gender],
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}

enum Gender { FEMALE, MALE, UNKNOWN }

final genderValues = EnumValues(
    {"Female": Gender.FEMALE, "Male": Gender.MALE, "unknown": Gender.UNKNOWN});

class Location {
  String name;
  String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

enum Species { ALIEN, HUMAN }

final speciesValues =
    EnumValues({"Alien": Species.ALIEN, "Human": Species.HUMAN});

enum Status { ALIVE, DEAD, UNKNOWN }

final statusValues = EnumValues(
    {"Alive": Status.ALIVE, "Dead": Status.DEAD, "unknown": Status.UNKNOWN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
