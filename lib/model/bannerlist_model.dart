// To parse this JSON data, do
//
//     final bannerListModel = bannerListModelFromJson(jsonString);

import 'dart:convert';

BannerListModel bannerListModelFromJson(String str) => BannerListModel.fromJson(json.decode(str));

String bannerListModelToJson(BannerListModel data) => json.encode(data.toJson());

class BannerListModel {
  bool? success;
  List<Datum>? data;
  String? message;

  BannerListModel({
    this.success,
    this.data,
    this.message,
  });

  factory BannerListModel.fromJson(Map<String, dynamic> json) => BannerListModel(
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
  String? bannerName;
  String? bannerImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.bannerName,
    this.bannerImage,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    bannerName: json["banner_name"],
    bannerImage: json["banner_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "banner_name": bannerName,
    "banner_image": bannerImage,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
