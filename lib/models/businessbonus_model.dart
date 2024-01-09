// To parse this JSON data, do
//
//     final businessBonusModel = businessBonusModelFromJson(jsonString);

import 'dart:convert';

BusinessBonusModel businessBonusModelFromJson(String str) =>
    BusinessBonusModel.fromJson(json.decode(str));

String businessBonusModelToJson(BusinessBonusModel data) =>
    json.encode(data.toJson());

class BusinessBonusModel {
  String distId;
  String date;
  String prvCfcvLeft;
  String prvCfcvRight;
  String newAcctCvLeft;
  String newAcctCvRight;
  String netCalcLeft;
  String netCalcRight;
  String steps;
  String bonus;
  String redmption;
  String netBonus;

  BusinessBonusModel({
    required this.distId,
    required this.date,
    required this.prvCfcvLeft,
    required this.prvCfcvRight,
    required this.newAcctCvLeft,
    required this.newAcctCvRight,
    required this.netCalcLeft,
    required this.netCalcRight,
    required this.steps,
    required this.bonus,
    required this.redmption,
    required this.netBonus,
  });

  factory BusinessBonusModel.fromJson(Map<String, dynamic> json) =>
      BusinessBonusModel(
        distId: json["DistId"],
        date: json["Date"],
        prvCfcvLeft: json["PrvCFCVLeft"],
        prvCfcvRight: json["PrvCFCVRight"],
        newAcctCvLeft: json["NewAcctCVLeft"],
        newAcctCvRight: json["NewAcctCVRight"],
        netCalcLeft: json["NetCalcLeft"],
        netCalcRight: json["NetCalcRight"],
        steps: json["Steps"],
        bonus: json["Bonus"],
        redmption: json["Redmption"],
        netBonus: json["NetBonus"],
      );

  Map<String, dynamic> toJson() => {
        "DistId": distId,
        "Date": date,
        "PrvCFCVLeft": prvCfcvLeft,
        "PrvCFCVRight": prvCfcvRight,
        "NewAcctCVLeft": newAcctCvLeft,
        "NewAcctCVRight": newAcctCvRight,
        "NetCalcLeft": netCalcLeft,
        "NetCalcRight": netCalcRight,
        "Steps": steps,
        "Bonus": bonus,
        "Redmption": redmption,
        "NetBonus": netBonus,
      };
}
