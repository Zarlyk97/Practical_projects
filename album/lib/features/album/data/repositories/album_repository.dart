import 'package:album/features/album/data/models/album.model.dart';

class AlbumRepository {
  Future<AlbumModel> getAlbum() async {
    return AlbumModel(
        albumId: 1,
        id: 1,
        title: "title",
        url: "url",
        thumbnailUrl: "thumbnailUrl");
  }
}
