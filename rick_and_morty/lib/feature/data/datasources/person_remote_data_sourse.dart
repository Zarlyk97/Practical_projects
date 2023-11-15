import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/data/models/person_model.dart';

abstract class PersonRemoteDataSourse {
  /// kkfkfkf[ServerException]
  Future<List<PersonModel>> getAllPersons(int page);
  ///////////[ServerException]///////////////////////////
  Future<List<PersonModel>> searchPerson(String query);
}

class PersonRemoteDataSourseImple implements PersonRemoteDataSourse {
  final http.Client client;

  PersonRemoteDataSourseImple({required this.client});

  @override
  Future<List<PersonModel>> getAllPersons(int page) =>
      getPersonFromUrl('https://rickandmortyapi.com/api/character/?page=$page');

  @override
  Future<List<PersonModel>> searchPerson(String query) => getPersonFromUrl(
      'https://rickandmortyapi.com/api/character/?name=$query');

  Future<List<PersonModel>> getPersonFromUrl(String query) async {
    final response = await client.get(
        Uri.parse("https://rickandmortyapi.com/api/character/?name=$query"),
        headers: {'Content-Type ': 'aplication/json'});

    if (response.statusCode == 200) {
      final persons = json.decode(response.body);
      return (persons['results'] as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
