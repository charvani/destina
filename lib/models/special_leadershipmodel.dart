// To parse this JSON data, do
//
//     final specialLeadershipBonusModel = specialLeadershipBonusModelFromJson(jsonString);

import 'dart:convert';

SpecialLeadershipBonusModel specialLeadershipBonusModelFromJson(String str) =>
    SpecialLeadershipBonusModel.fromJson(json.decode(str));

String specialLeadershipBonusModelToJson(SpecialLeadershipBonusModel data) =>
    json.encode(data.toJson());

class SpecialLeadershipBonusModel {
  String distbutorId;
  String frmDist;
  String month;
  String date;
  String matching;
  String team;
  String percentage;
  String bonus;
  String redmption;
  String netBonus;

  SpecialLeadershipBonusModel({
    required this.distbutorId,
    required this.frmDist,
    required this.month,
    required this.date,
    required this.matching,
    required this.team,
    required this.percentage,
    required this.bonus,
    required this.redmption,
    required this.netBonus,
  });

  factory SpecialLeadershipBonusModel.fromJson(Map<String, dynamic> json) =>
      SpecialLeadershipBonusModel(
        distbutorId: json["DistbutorId"],
        frmDist: json["FrmDist"],
        month: json["Month"],
        date: json["Date"],
        matching: json["Matching"],
        team: json["Team"],
        percentage: json["Percentage"],
        bonus: json["Bonus"],
        redmption: json["Redmption"],
        netBonus: json["NetBonus"],
      );

  Map<String, dynamic> toJson() => {
        "DistbutorId": distbutorId,
        "FrmDist": frmDist,
        "Month": month,
        "Date": date,
        "Matching": matching,
        "Team": team,
        "Percentage": percentage,
        "Bonus": bonus,
        "Redmption": redmption,
        "NetBonus": netBonus,
      };
}
