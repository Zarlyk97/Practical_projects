import 'package:album/features/album/data/datasources/album_remote_data_source.dart';
import 'package:album/features/album/domain/entities/album_entity.dart';
import 'package:album/features/album/domain/repositories/album_repositry.dart';

abstract class AlbumRepoImple implements AlbumRepository {
  final AlbumRemoteDataSource _albumRemoteDataSource;

  AlbumRepoImple(this._albumRemoteDataSource);

  @override
  Future<AlbumEntity> getAlbum() async {
    return _albumRemoteDataSource.getAlbum();
  }
}
