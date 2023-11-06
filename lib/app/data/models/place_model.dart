 // To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'dart:convert';

List<PlaceModel> placeModelFromJson(String str) => List<PlaceModel>.from(json.decode(str).map((x) => PlaceModel.fromJson(x)));

String placeModelToJson(List<PlaceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlaceModel {
    PlaceModel({
      required this.id,
      required this.name,
      required this.freePrice,
      required this.description,
      required this.views,
      required this.imgUrl,
      required this.openTime,
      required this.closeTime,
      required this.location,
      required this.categoryId,
      required this.covernorateId2,
      required this.createdAt,
      required this.updatedAt,
      required this.categories,
      required this.covernorates,
    });

    int id;
    String name;
    int freePrice;
    String description;
    int views;
    String imgUrl;
    String openTime;
    String closeTime;
    String location;
    int categoryId;
    int covernorateId2;
    DateTime createdAt;
    DateTime updatedAt;
    Categories categories;
    Categories covernorates;

    factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        id: json["id"],
        name: json["name"],
        freePrice: json["free_price"],
        description: json["description"],
        views: json["views"],
        imgUrl: json["img_url"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        location: json["location"],
        categoryId: json["category_id"],
        covernorateId2: json["covernorate_id2"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categories: Categories.fromJson(json["categories"]),
        covernorates: Categories.fromJson(json["covernorates"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "free_price": freePrice,
        "description": description,
        "views": views,
        "img_url": imgUrl,
        "open_time": openTime,
        "close_time": closeTime,
        "location": location,
        "category_id": categoryId,
        "covernorate_id2": covernorateId2,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "categories": categories.toJson(),
        "covernorates": covernorates.toJson(),
    };
}

class Categories {
    Categories({
      required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.countryId,
    });

    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;
    int countryId;

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        countryId: json["country_id"] == null ? null : json["country_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "country_id": countryId == null ? null : countryId,
    };
}
