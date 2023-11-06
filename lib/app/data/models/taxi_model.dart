// To parse this JSON data, do
//
//     final allTaxiDetailsModelResponse = allTaxiDetailsModelResponseFromJson(jsonString);

import 'dart:convert';

List<AllTaxiDetailsModelResponse> allTaxiDetailsModelResponseFromJson(
        String str) =>
    List<AllTaxiDetailsModelResponse>.from(
        json.decode(str).map((x) => AllTaxiDetailsModelResponse.fromJson(x)));

String allTaxiDetailsModelResponseToJson(
        List<AllTaxiDetailsModelResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllTaxiDetailsModelResponse {
  AllTaxiDetailsModelResponse({
    required this.id,
    required this.name,
    required this.pricePer1Km,
    required this.phoneUrl,
    required this.covernorateId,
    required this.createdAt,
    required this.updatedAt,
    required this.covernorates,
  });

  int id;
  String name;
  int pricePer1Km;
  String phoneUrl;
  int covernorateId;
  DateTime createdAt;
  DateTime updatedAt;
  Covernorates covernorates;

  factory AllTaxiDetailsModelResponse.fromJson(Map<String, dynamic> json) =>
      AllTaxiDetailsModelResponse(
        id: json["id"],
        name: json["name"],
        pricePer1Km: json["price_per_1km"],
        phoneUrl: json["phone_url"],
        covernorateId: json["covernorate_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        covernorates: Covernorates.fromJson(json["covernorates"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price_per_1km": pricePer1Km,
        "phone_url": phoneUrl,
        "covernorate_id": covernorateId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "covernorates": covernorates.toJson(),
      };
}

class Covernorates {
  Covernorates({
    required this.id,
    required this.name,
    required this.countryId,
    required this.createdAt,
  });

  int id;
  String name;
  int countryId;
  DateTime createdAt;
  factory Covernorates.fromJson(Map<String, dynamic> json) => Covernorates(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
        "created_at": createdAt.toIso8601String(),
      };
}
