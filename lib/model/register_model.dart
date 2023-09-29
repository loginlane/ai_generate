// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  bool? success;
  Data? data;
  String? message;

  RegisterModel({
    this.success,
    this.data,
    this.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  String? token;
  User? user;

  Data({
    this.token,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  String? firstName;
  String? lastName;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    updatedAt: json["updated_at"].toString(),
    createdAt: json["created_at"].toString(),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "updated_at": updatedAt,
    "created_at": createdAt,
    "id": id,
  };
}
