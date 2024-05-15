import 'package:album/album/domain/models/album.model.dart';

abstract class AlbumRepository {
  Future<List<AlbumModel>> getAlbum();
}
