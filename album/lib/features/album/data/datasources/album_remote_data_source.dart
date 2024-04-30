import 'package:album/features/album/data/models/album.model.dart';
import 'package:dio/dio.dart';

abstract class AlbumRemoteDataSource {
  Future<AlbumModel> getAlbum();
}

class AlbumRemoteDataSourceImpl implements AlbumRemoteDataSource {
  final Dio _dio;

  AlbumRemoteDataSourceImpl(this._dio);
  @override
  Future<AlbumModel> getAlbum() async {
    try {
      var response =
          await _dio.get('https://jsonplaceholder.typicode.com/photos/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AlbumModel.fromJson(response.data[0]);
      } else {
        return AlbumModel.fromJson({
          'albumId': 0,
          'id': 0,
          'title': '',
          'url': '',
          'thumbnailUrl': '',
        });
      }
    } catch (e) {
      return AlbumModel.fromJson({});
    }
  }
}
