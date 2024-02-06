import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final LocationEntity? origin;
  final LocationEntity? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  const PersonEntity({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created,
      ];
}

class LocationEntity extends Equatable {
  final String name;
  final String url;

  const LocationEntity({required this.name, required this.url});

  @override
  List<Object?> get props => [name, url];
}
