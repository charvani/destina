// To parse this JSON data, do
//
//     final awardTableDataModel = awardTableDataModelFromJson(jsonString);

import 'dart:convert';

AwardTableDataModel awardTableDataModelFromJson(String str) =>
    AwardTableDataModel.fromJson(json.decode(str));

String awardTableDataModelToJson(AwardTableDataModel data) =>
    json.encode(data.toJson());

class AwardTableDataModel {
  String title;
  String qualify;
  String youHaveDone;
  String moreToGo;

  AwardTableDataModel({
    required this.title,
    required this.qualify,
    required this.youHaveDone,
    required this.moreToGo,
  });

  factory AwardTableDataModel.fromJson(Map<String, dynamic> json) =>
      AwardTableDataModel(
        title: json["title"],
        qualify: json["qualify"],
        youHaveDone: json["you_have_done"],
        moreToGo: json["more_to_go"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "qualify": qualify,
        "you_have_done": youHaveDone,
        "more_to_go": moreToGo,
      };
}
