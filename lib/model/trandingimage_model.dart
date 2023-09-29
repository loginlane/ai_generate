// To parse this JSON data, do
//
//     final trandingImageModel = trandingImageModelFromJson(jsonString);

import 'dart:convert';

TrandingImageModel trandingImageModelFromJson(String str) => TrandingImageModel.fromJson(json.decode(str));

String trandingImageModelToJson(TrandingImageModel data) => json.encode(data.toJson());

class TrandingImageModel {
  bool? success;
  List<Datum>? data;
  String? message;

  TrandingImageModel({
    this.success,
    this.data,
    this.message,
  });

  factory TrandingImageModel.fromJson(Map<String, dynamic> json) => TrandingImageModel(
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
  String? categoryName;
  String? categoryId;
  List<CategoryImage>? categoryImage;

  Datum({
    this.categoryName,
    this.categoryId,
    this.categoryImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryName: json["category_name"],
    categoryId: json["category_id"].toString(),
    categoryImage: List<CategoryImage>.from(json["category_image"].map((x) => CategoryImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "category_image": List<dynamic>.from(categoryImage!.map((x) => x.toJson())),
  };
}

class CategoryImage {
  int? id;
  int? categoryId;
  String? imageName;
  int? isTrend;

  CategoryImage({
    this.id,
    this.categoryId,
    this.imageName,
    this.isTrend,
  });

  factory CategoryImage.fromJson(Map<String, dynamic> json) => CategoryImage(
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
