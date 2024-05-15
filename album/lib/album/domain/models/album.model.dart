import 'dart:convert';

class AlbumModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  AlbumModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory AlbumModel.fromRawJson(String str) =>
      AlbumModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
