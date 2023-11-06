// To parse this JSON data, do
//
//     final taxiDetailsModelResponse = taxiDetailsModelResponseFromJson(jsonString);

import 'dart:convert';

TaxiDetailsModelResponse taxiDetailsModelResponseFromJson(String str) =>
    TaxiDetailsModelResponse.fromJson(json.decode(str));

String taxiDetailsModelResponseToJson(TaxiDetailsModelResponse data) =>
    json.encode(data.toJson());

class TaxiDetailsModelResponse {
  TaxiDetailsModelResponse({
    required this.id,
    required this.name,
    required this.countryId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int countryId;
  dynamic createdAt;
  dynamic updatedAt;

  factory TaxiDetailsModelResponse.fromJson(Map<String, dynamic> json) =>
      TaxiDetailsModelResponse(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
