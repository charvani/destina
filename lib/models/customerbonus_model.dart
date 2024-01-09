// To parse this JSON data, do
//
//     final customerBonusModel = customerBonusModelFromJson(jsonString);

import 'dart:convert';

CustomerBonusModel customerBonusModelFromJson(String str) =>
    CustomerBonusModel.fromJson(json.decode(str));

String customerBonusModelToJson(CustomerBonusModel data) =>
    json.encode(data.toJson());

class CustomerBonusModel {
  String fromDistId;
  String toDistId;
  String date;
  String yrPakageCatg;
  String newSinupCatg;
  String cv;
  String percentage;
  String bonus;
  String redmption;
  String netBonus;

  CustomerBonusModel({
    required this.fromDistId,
    required this.toDistId,
    required this.date,
    required this.yrPakageCatg,
    required this.newSinupCatg,
    required this.cv,
    required this.percentage,
    required this.bonus,
    required this.redmption,
    required this.netBonus,
  });

  factory CustomerBonusModel.fromJson(Map<String, dynamic> json) =>
      CustomerBonusModel(
        fromDistId: json["FromDistId"],
        toDistId: json["ToDistId"],
        date: json["Date"],
        yrPakageCatg: json["YrPakageCatg"],
        newSinupCatg: json["NewSinupCatg"],
        cv: json["CV"],
        percentage: json["Percentage"],
        bonus: json["Bonus"],
        redmption: json["Redmption"],
        netBonus: json["NetBonus"],
      );

  Map<String, dynamic> toJson() => {
        "FromDistId": fromDistId,
        "ToDistId": toDistId,
        "Date": date,
        "YrPakageCatg": yrPakageCatg,
        "NewSinupCatg": newSinupCatg,
        "CV": cv,
        "Percentage": percentage,
        "Bonus": bonus,
        "Redmption": redmption,
        "NetBonus": netBonus,
      };
}
