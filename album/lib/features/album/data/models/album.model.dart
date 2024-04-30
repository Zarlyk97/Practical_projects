import 'package:album/features/album/domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  AlbumModel({
    super.albumId,
    super.id,
    super.title,
    super.url,
    super.thumbnailUrl,
  });
  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl'],
      );
  Map<String, dynamic> toJson() => <String, dynamic>{
        'albumId': albumId,
        'id': id,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
      };
}
