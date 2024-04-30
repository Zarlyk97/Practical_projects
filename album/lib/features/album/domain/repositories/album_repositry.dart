import 'package:album/features/album/domain/entities/album_entity.dart';

abstract class AlbumRepository {
  Future<AlbumEntity> getAlbum();
}
