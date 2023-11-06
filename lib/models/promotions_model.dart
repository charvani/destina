// To parse this JSON data, do
//
//     final promotionsModel = promotionsModelFromJson(jsonString);

import 'dart:convert';

PromotionsModel promotionsModelFromJson(String str) =>
    PromotionsModel.fromJson(json.decode(str));

String promotionsModelToJson(PromotionsModel data) =>
    json.encode(data.toJson());

class PromotionsModel {
  String image;
  String title;
  String date;
  bool isBigPromotion;

  PromotionsModel({
    required this.image,
    required this.title,
    required this.date,
    required this.isBigPromotion,
  });

  factory PromotionsModel.fromJson(Map<String, dynamic> json) =>
      PromotionsModel(
        image: json["image"],
        title: json["title"],
        date: json["date"],
        isBigPromotion: json["isBigPromotion"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "date": date,
        "isBigPromotion": isBigPromotion,
      };
}
