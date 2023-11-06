// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromJson(jsonString);

import 'dart:convert';

List<RestaurantModel> restaurantModelFromJson(String str) => List<RestaurantModel>.from(json.decode(str).map((x) => RestaurantModel.fromJson(x)));

String restaurantModelToJson(List<RestaurantModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantModel {
    RestaurantModel({
   required    this.id,
   required    this.name,
   required    this.openTime,
   required    this.closeTime,
   required    this.phone,
   required    this.location,
   required    this.stars,
   required    this.views,
   required    this.imgUrl,
   required    this.covernorateId2,
   required    this.userId,
   required    this.createdAt,
   required    this.updatedAt,
   required    this.users,
   required    this.tablets,
   required    this.covernorates,
    });

    int id;
    String name;
    String openTime;
    String closeTime;
    String phone;
    String location;
    int stars;
    int views;
    String imgUrl;
    int covernorateId2;
    int userId;
    DateTime createdAt;
    DateTime updatedAt;
    Users users;
    List<dynamic> tablets;
    Covernorates covernorates;

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
        id: json["id"],
        name: json["name"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        phone: json["phone"],
        location: json["location"],
        stars: json["stars"],
        views: json["views"],
        imgUrl: json["img_url"],
        covernorateId2: json["covernorate_id2"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        users: Users.fromJson(json["users"]),
        tablets: List<dynamic>.from(json["tablets"].map((x) => x)),
        covernorates: Covernorates.fromJson(json["covernorates"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "open_time": openTime,
        "close_time": closeTime,
        "phone": phone,
        "location": location,
        "stars": stars,
        "views": views,
        "img_url": imgUrl,
        "covernorate_id2": covernorateId2,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "users": users.toJson(),
        "tablets": List<dynamic>.from(tablets.map((x) => x)),
        "covernorates": covernorates.toJson(),
    };
}

class Covernorates {
    Covernorates({
     required  this.id,
     required  this.name,
     required  this.countryId,
     required  this.createdAt,
     required  this.updatedAt,
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
   required    this.id,
   required    this.fName,
   required    this.lName,
   required    this.email,
   required    this.emailVerifiedAt,
   required    this.point,
   required    this.phone,
   required    this.createdAt,
   required    this.updatedAt,
    });

    int id;
    String fName;
    String lName;
    String email;
    DateTime emailVerifiedAt;
    int point;
    String phone;
    DateTime createdAt;
    DateTime updatedAt;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        fName: json["f_name"],
        lName: json["l_name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
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
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "point": point,
        "phone": phone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
