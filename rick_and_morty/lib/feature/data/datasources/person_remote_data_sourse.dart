import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/data/models/person_model.dart';

abstract class PersonRemoteDataSource {
  /// Calls the https://rickandmortyapi.com/api/character/?page=1 endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PersonModel>> getAllPersons(int page);

  /// Calls the https://rickandmortyapi.com/api/character/?name=rick endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PersonModel>> searchPerson(String query);
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final Dio client;

  PersonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PersonModel>> getAllPersons(int page) =>
      _getPersonFromUrl('/character/?page=$page');

  @override
  Future<List<PersonModel>> searchPerson(String query) =>
      _getPersonFromUrl('/character/?name=$query');

  Future<List<PersonModel>> _getPersonFromUrl(String url) async {
    try {
      final response = await client.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final persons = json.decode(response.data) as Map<String, dynamic>;
        return (persons['results'] as List)
            .map((e) => PersonModel.fromJson(e))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
