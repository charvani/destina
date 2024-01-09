// To parse this JSON data, do
//
//     final personalBonusModel = personalBonusModelFromJson(jsonString);

import 'dart:convert';

PersonalBonusModel personalBonusModelFromJson(String str) =>
    PersonalBonusModel.fromJson(json.decode(str));

String personalBonusModelToJson(PersonalBonusModel data) =>
    json.encode(data.toJson());

class PersonalBonusModel {
  String distbutorId;
  String distbutorName;
  String orderNo;
  String date;
  String cv;
  String percentage;
  String bonus;
  String redmption;
  String netBonus;

  PersonalBonusModel({
    required this.distbutorId,
    required this.distbutorName,
    required this.orderNo,
    required this.date,
    required this.cv,
    required this.percentage,
    required this.bonus,
    required this.redmption,
    required this.netBonus,
  });

  factory PersonalBonusModel.fromJson(Map<String, dynamic> json) =>
      PersonalBonusModel(
        distbutorId: json["DistbutorId"],
        distbutorName: json["DistbutorName"],
        orderNo: json["OrderNo"],
        date: json["Date"],
        cv: json["CV"],
        percentage: json["Percentage"],
        bonus: json["Bonus"],
        redmption: json["Redmption"],
        netBonus: json["NetBonus"],
      );

  Map<String, dynamic> toJson() => {
        "DistbutorId": distbutorId,
        "DistbutorName": distbutorName,
        "OrderNo": orderNo,
        "Date": date,
        "CV": cv,
        "Percentage": percentage,
        "Bonus": bonus,
        "Redmption": redmption,
        "NetBonus": netBonus,
      };
}
