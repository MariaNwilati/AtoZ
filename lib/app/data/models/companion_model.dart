// To parse this JSON data, do
//
//     final escortModel = escortModelFromJson(jsonString);

import 'dart:convert';

List<EscortModel> escortModelFromJson(String str) => List<EscortModel>.from(
    json.decode(str).map((x) => EscortModel.fromJson(x)));

String escortModelToJson(List<EscortModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EscortModel {
  EscortModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.userId,
    required this.imgUrl,
    required this.pricePerDay,
    required this.free,
    required this.covernorateId2,
    required this.covernorates,
    required this.langEscort,
  });

  int id;
  String fName;
  String lName;
  String phone;
  int userId;
  String imgUrl;
  int pricePerDay;
  String free;
  int covernorateId2;
  Covernorates covernorates;
  List<LangEscort> langEscort;

  factory EscortModel.fromJson(Map<String, dynamic> json) => EscortModel(
        id: json["id"],
        fName: json["f_name"],
        lName: json["l_name"],
        phone: json["phone"],
        userId: json["user_id"],
        imgUrl: json["img_url"],
        pricePerDay: json["price_per_day"],
        free: json["free"],
        covernorateId2: json["covernorate_id2"],
        covernorates: Covernorates.fromJson(json["covernorates"]),
        langEscort: List<LangEscort>.from(
            json["lang_escort"].map((x) => LangEscort.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "f_name": fName,
        "l_name": lName,
        "phone": phone,
        "user_id": userId,
        "img_url": imgUrl,
        "price_per_day": pricePerDay,
        "free": free,
        "covernorate_id2": covernorateId2,
        "covernorates": covernorates.toJson(),
        "lang_escort": List<dynamic>.from(langEscort.map((x) => x.toJson())) ,
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

class LangEscort {
  LangEscort({
    required this.id,
    required this.name,
    required this.escortId,
  });

  int id;
  String name;
  int escortId;

  factory LangEscort.fromJson(Map<String, dynamic> json) => LangEscort(
        id: json["id"],
        name: json["name"],
        escortId: json["escort_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "escort_id": escortId,
      };
}
