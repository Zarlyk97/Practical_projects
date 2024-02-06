class Location {
  String? name;
  String? url;

  Location({
    this.name,
    this.url,
  });

  Location copyWith({
    String? name,
    String? url,
  }) =>
      Location(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
