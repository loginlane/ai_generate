// To parse this JSON data, do
//
//     final seeAllModel = seeAllModelFromJson(jsonString);

import 'dart:convert';

SeeAllModel seeAllModelFromJson(String str) => SeeAllModel.fromJson(json.decode(str));

String seeAllModelToJson(SeeAllModel data) => json.encode(data.toJson());

class SeeAllModel {
  bool? success;
  List<Datum>? data;
  String? message;

  SeeAllModel({
    this.success,
    this.data,
    this.message,
  });

  factory SeeAllModel.fromJson(Map<String, dynamic> json) => SeeAllModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int? id;
  int? categoryId;
  String? imageName;
  int? isTrend;

  Datum({
    this.id,
    this.categoryId,
    this.imageName,
    this.isTrend,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    categoryId: json["category_id"],
    imageName: json["image_name"],
    isTrend: json["is_trend"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "image_name": imageName,
    "is_trend": isTrend,
  };
}
