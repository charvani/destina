// To parse this JSON data, do
//
//     final rollupBonusModel = rollupBonusModelFromJson(jsonString);

import 'dart:convert';

RollupBonusModel rollupBonusModelFromJson(String str) =>
    RollupBonusModel.fromJson(json.decode(str));

String rollupBonusModelToJson(RollupBonusModel data) =>
    json.encode(data.toJson());

class RollupBonusModel {
  String yrDistId;
  String yrPakageCatg;
  String frmDistId;
  String toDistId;
  String date;
  String sponPkgCatg;
  String newSinupCatg;
  String cv;
  String percentage;
  String bonus;
  String redmption;
  String netBonus;

  RollupBonusModel({
    required this.yrDistId,
    required this.yrPakageCatg,
    required this.frmDistId,
    required this.toDistId,
    required this.date,
    required this.sponPkgCatg,
    required this.newSinupCatg,
    required this.cv,
    required this.percentage,
    required this.bonus,
    required this.redmption,
    required this.netBonus,
  });

  factory RollupBonusModel.fromJson(Map<String, dynamic> json) =>
      RollupBonusModel(
        yrDistId: json["YrDistId"],
        yrPakageCatg: json["YrPakageCatg"],
        frmDistId: json["FrmDistId"],
        toDistId: json["ToDistId"],
        date: json["Date"],
        sponPkgCatg: json["sponPkgCatg"],
        newSinupCatg: json["NewSinupCatg"],
        cv: json["CV"],
        percentage: json["Percentage"],
        bonus: json["Bonus"],
        redmption: json["Redmption"],
        netBonus: json["NetBonus"],
      );

  Map<String, dynamic> toJson() => {
        "YrDistId": yrDistId,
        "YrPakageCatg": yrPakageCatg,
        "FrmDistId": frmDistId,
        "ToDistId": toDistId,
        "Date": date,
        "sponPkgCatg": sponPkgCatg,
        "NewSinupCatg": newSinupCatg,
        "CV": cv,
        "Percentage": percentage,
        "Bonus": bonus,
        "Redmption": redmption,
        "NetBonus": netBonus,
      };
}
