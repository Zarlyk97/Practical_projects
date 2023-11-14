import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationEntity origin;
  final LocationEntity location;
  final String image;
  final List<String> episode;
  final String created;

  const PersonEntity(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.created});

  @override
  List<Object> get props => [
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        created,
      ];
}

class LocationEntity {
  String name;
  String url;

  LocationEntity({required this.name, required this.url, required id});
}
