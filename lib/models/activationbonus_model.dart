// To parse this JSON data, do
//
//     final activationBonusModel = activationBonusModelFromJson(jsonString);

import 'dart:convert';

ActivationBonusModel activationBonusModelFromJson(String str) =>
    ActivationBonusModel.fromJson(json.decode(str));

String activationBonusModelToJson(ActivationBonusModel data) =>
    json.encode(data.toJson());

class ActivationBonusModel {
  String lcode;
  String commType;
  String frmLcode;
  String date;
  String netCv;
  String percent;
  String profit;
  String redmption;
  String netProfit;

  ActivationBonusModel({
    required this.lcode,
    required this.commType,
    required this.frmLcode,
    required this.date,
    required this.netCv,
    required this.percent,
    required this.profit,
    required this.redmption,
    required this.netProfit,
  });

  factory ActivationBonusModel.fromJson(Map<String, dynamic> json) =>
      ActivationBonusModel(
        lcode: json["Lcode"],
        commType: json["CommType"],
        frmLcode: json["FrmLcode"],
        date: json["Date"],
        netCv: json["NetCV"],
        percent: json["Percent"],
        profit: json["Profit"],
        redmption: json["Redmption"],
        netProfit: json["NetProfit"],
      );

  Map<String, dynamic> toJson() => {
        "Lcode": lcode,
        "CommType": commType,
        "FrmLcode": frmLcode,
        "Date": date,
        "NetCV": netCv,
        "Percent": percent,
        "Profit": profit,
        "Redmption": redmption,
        "NetProfit": netProfit,
      };
}
