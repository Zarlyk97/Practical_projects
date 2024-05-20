import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? email;
  String? username;
  String? password;
  UserNameModel? name;
  AddressModel? address;
  String? phone;

  UserModel({
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.address,
    this.phone,
  });

  UserModel copyWith({
    int? id,
    String? email,
    String? username,
    String? password,
    UserNameModel? name,
    AddressModel? address,
    String? phone,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
        name: name ?? this.name,
        address: address ?? this.address,
        phone: phone ?? this.phone,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name:
            json["name"] == null ? null : UserNameModel.fromJson(json["name"]),
        address: json["address"] == null
            ? null
            : AddressModel.fromJson(json["address"]),
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "name": name?.toJson(),
        "address": address?.toJson(),
        "phone": phone,
      };
}

class AddressModel {
  String? city;
  String? street;
  int? number;
  String? zipcode;
  GeolocationModel? geolocation;

  AddressModel({
    this.city,
    this.street,
    this.number,
    this.zipcode,
    this.geolocation,
  });

  AddressModel copyWith({
    String? city,
    String? street,
    int? number,
    String? zipcode,
    GeolocationModel? geolocation,
  }) =>
      AddressModel(
        city: city ?? this.city,
        street: street ?? this.street,
        number: number ?? this.number,
        zipcode: zipcode ?? this.zipcode,
        geolocation: geolocation ?? this.geolocation,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        city: json["city"],
        street: json["street"],
        number: json["number"],
        zipcode: json["zipcode"],
        geolocation: json["geolocation"] == null
            ? null
            : GeolocationModel.fromJson(json["geolocation"]),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        "number": number,
        "zipcode": zipcode,
        "geolocation": geolocation?.toJson(),
      };
}

class GeolocationModel {
  double? lat;
  double? long;

  GeolocationModel({
    this.lat,
    this.long,
  });

  GeolocationModel copyWith({
    double? lat,
    double? long,
  }) =>
      GeolocationModel(
        lat: lat ?? this.lat,
        long: long ?? this.long,
      );

  factory GeolocationModel.fromJson(Map<String, dynamic> json) =>
      GeolocationModel(
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}

class UserNameModel {
  String? firstname;
  String? lastname;

  UserNameModel({
    this.firstname,
    this.lastname,
  });

  UserNameModel copyWith({
    String? firstname,
    String? lastname,
  }) =>
      UserNameModel(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
      );

  factory UserNameModel.fromJson(Map<String, dynamic> json) => UserNameModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
      };
}
