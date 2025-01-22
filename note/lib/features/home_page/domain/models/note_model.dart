class NoteModel {
  final String id;
  final String title;
  final String content;
  NoteModel({
    required this.id,
    required this.title,
    required this.content,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      NoteModel(id: json['id'], title: json['title'], content: json['content']);

  toJson() => {"id": id, "title": title, "content": content};
}
