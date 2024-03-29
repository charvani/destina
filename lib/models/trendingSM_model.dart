// To parse this JSON data, do
//
//     final trendingOnSocialMModel = trendingOnSocialMModelFromJson(jsonString);

import 'dart:convert';

TrendingOnSocialMModel trendingOnSocialMModelFromJson(String str) =>
    TrendingOnSocialMModel.fromJson(json.decode(str));

String trendingOnSocialMModelToJson(TrendingOnSocialMModel data) =>
    json.encode(data.toJson());

class TrendingOnSocialMModel {
  int smid;
  String stype;
  String imgurl;
  String redirecturl;

  TrendingOnSocialMModel({
    required this.smid,
    required this.stype,
    required this.imgurl,
    required this.redirecturl,
  });

  factory TrendingOnSocialMModel.fromJson(Map<String, dynamic> json) =>
      TrendingOnSocialMModel(
        smid: json["SMID"],
        stype: json["Stype"],
        imgurl: json["Imgurl"],
        redirecturl: json["Redirecturl"],
      );

  Map<String, dynamic> toJson() => {
        "SMID": smid,
        "Stype": stype,
        "Imgurl": imgurl,
        "Redirecturl": redirecturl,
      };
}
