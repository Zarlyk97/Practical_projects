import 'package:album/album/domain/models/album.model.dart';
import 'package:dio/dio.dart';

abstract class AlbumRemoteDataSource {
  Future<List<AlbumModel>> getAlbum();
}

class AlbumRemoteDataSourceImpl implements AlbumRemoteDataSource {
  final Dio _dio;

  AlbumRemoteDataSourceImpl(this._dio);

  @override
  Future<List<AlbumModel>> getAlbum() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/albums');
      List<AlbumModel> album = [];
      for (var i = 0; i < response.data.length; i++) {
        album.add(AlbumModel.fromJson(response.data[i]));
      }
      return album;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
