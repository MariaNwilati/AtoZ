// To parse this JSON data, do
//
//     final cuponModel = cuponModelFromJson(jsonString);

import 'dart:convert';

List<CuponModel> cuponModelFromJson(String str) =>
    List<CuponModel>.from(json.decode(str).map((x) => CuponModel.fromJson(x)));

String cuponModelToJson(List<CuponModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CuponModel {
  CuponModel({
    required this.name,
    required this.price,
    required this.type,
    required this.percentage,
    required this.expDate,
  });

  String name;
  int price;
  String type;
  int percentage;
  DateTime expDate;

  factory CuponModel.fromJson(Map<String, dynamic> json) => CuponModel(
        name: json["name"],
        price: json["price"],
        type: json["type"],
        percentage: json["percentage"],
        expDate: DateTime.parse(json["exp_date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "type": type,
        "percentage": percentage,
        "exp_date":
            "${expDate.year.toString().padLeft(4, '0')}-${expDate.month.toString().padLeft(2, '0')}-${expDate.day.toString().padLeft(2, '0')}",
      };
}
