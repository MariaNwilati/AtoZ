// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
      required  this.user,
        required this.type,
        required this.token,
    });

    User user;
    String type;
    String token;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        user: User.fromJson(json["user"]),
        type: json["type"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "type": type,
        "token": token,
    };
}

class User {
    User({
   required     this.id,
       required this.fName,
 required       this.lName,
       required this.email,
        required this.emailVerifiedAt,
        required this.point,
        required this.phone,
        required this.createdAt,
        required this.updatedAt,
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

    factory User.fromJson(Map<String, dynamic> json) => User(
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
