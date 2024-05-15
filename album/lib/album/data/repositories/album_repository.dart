import 'package:album/album/data/datasources/album_remote_data_source.dart';
import 'package:album/album/domain/models/album.model.dart';
import 'package:album/album/domain/repositories/album_repositry.dart';

class AlbumRepositoryimpl implements AlbumRepository {
  final AlbumRemoteDataSource _albumRemoteDataSource;

  AlbumRepositoryimpl(this._albumRemoteDataSource);

  @override
  Future<List<AlbumModel>> getAlbum() async {
    return _albumRemoteDataSource.getAlbum();
  }
}
