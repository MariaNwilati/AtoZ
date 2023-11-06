// To parse this JSON data, do
//
//     final hotelModel = hotelModelFromJson(jsonString);

import 'dart:convert';

List<HotelModel> hotelModelFromJson(String str) =>
    List<HotelModel>.from(json.decode(str).map((x) => HotelModel.fromJson(x)));

String hotelModelToJson(List<HotelModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HotelModel {
  HotelModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.location,
    required this.stars,
    required this.views,
    required this.imgUrl,
    required this.userId,
    required this.covernorateId2,
    required this.createdAt,
    required this.updatedAt,
    required this.users,
    required this.roomtypes,
    required this.covernorates,
  });

  int id;
  String name;
  String phone;
  String location;
  int stars;
  int views;
  String imgUrl;
  int userId;
  int covernorateId2;
  DateTime createdAt;
  DateTime updatedAt;
  Users users;
  List<dynamic> roomtypes;
  Covernorates covernorates;

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        location: json["location"],
        stars: json["stars"],
        views: json["views"],
        imgUrl: json["img_url"],
        userId: json["user_id"],
        covernorateId2: json["covernorate_id2"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        users: Users.fromJson(json["users"]),
        roomtypes: List<dynamic>.from(json["roomtypes"].map((x) => x)),
        covernorates: Covernorates.fromJson(json["covernorates"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "location": location,
        "stars": stars,
        "views": views,
        "img_url": imgUrl,
        "user_id": userId,
        "covernorate_id2": covernorateId2,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "users": users.toJson(),
        "roomtypes": List<dynamic>.from(roomtypes.map((x) => x)),
        "covernorates": covernorates.toJson(),
      };
}

class Covernorates {
  Covernorates({
    required this.id,
    required this.name,
    required this.countryId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int countryId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Covernorates.fromJson(Map<String, dynamic> json) => Covernorates(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Users {
  Users({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    // required this.emailVerifiedAt,
    required this.point,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String fName;
  String lName;
  String email;
  // DateTime emailVerifiedAt;
  int point;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        fName: json["f_name"],
        lName: json["l_name"],
        email: json["email"],
        // emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        point: json["point"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "f_name": fName,
        "l_name": lName,
        "email": email,
        // "email_verified_at": emailVerifiedAt.toIso8601String(),
        "point": point,
        "phone": phone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
