// To parse this JSON data, do
//
//     final teamBuilderBonusModel = teamBuilderBonusModelFromJson(jsonString);

import 'dart:convert';

TeamBuilderBonusModel teamBuilderBonusModelFromJson(String str) =>
    TeamBuilderBonusModel.fromJson(json.decode(str));

String teamBuilderBonusModelToJson(TeamBuilderBonusModel data) =>
    json.encode(data.toJson());

class TeamBuilderBonusModel {
  String distbutorId;
  String distbutorName;
  String date;
  String sponId;
  String team;
  String bussDevBonus;
  String percentage;
  String bonus;
  String redmption;
  String netBonus;

  TeamBuilderBonusModel({
    required this.distbutorId,
    required this.distbutorName,
    required this.date,
    required this.sponId,
    required this.team,
    required this.bussDevBonus,
    required this.percentage,
    required this.bonus,
    required this.redmption,
    required this.netBonus,
  });

  factory TeamBuilderBonusModel.fromJson(Map<String, dynamic> json) =>
      TeamBuilderBonusModel(
        distbutorId: json["DistbutorId"],
        distbutorName: json["DistbutorName"],
        date: json["Date"],
        sponId: json["SponId"],
        team: json["Team"],
        bussDevBonus: json["BussDevBonus"],
        percentage: json["Percentage"],
        bonus: json["Bonus"],
        redmption: json["Redmption"],
        netBonus: json["NetBonus"],
      );

  Map<String, dynamic> toJson() => {
        "DistbutorId": distbutorId,
        "DistbutorName": distbutorName,
        "Date": date,
        "SponId": sponId,
        "Team": team,
        "BussDevBonus": bussDevBonus,
        "Percentage": percentage,
        "Bonus": bonus,
        "Redmption": redmption,
        "NetBonus": netBonus,
      };
}
