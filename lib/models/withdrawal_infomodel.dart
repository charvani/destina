// To parse this JSON data, do
//
//     final withdrawalnfoModel = withdrawalnfoModelFromJson(jsonString);

import 'dart:convert';

WithdrawalnfoModel withdrawalnfoModelFromJson(String str) =>
    WithdrawalnfoModel.fromJson(json.decode(str));

String withdrawalnfoModelToJson(WithdrawalnfoModel data) =>
    json.encode(data.toJson());

class WithdrawalnfoModel {
  String msg;
  String message;
  String userId;
  String name;
  String city;
  String balance;
  dynamic withdrawalAmount;
  String minWithdrawalAmount;
  String tChrgsType;
  String scChrgsType;
  String symbol;
  String schead;
  String tchead;
  String scChrgs;
  String tChrgs;
  String dollarValue;
  bool ecardButton;
  bool withdrawalButton;

  WithdrawalnfoModel({
    required this.msg,
    required this.message,
    required this.userId,
    required this.name,
    required this.city,
    required this.balance,
    required this.withdrawalAmount,
    required this.minWithdrawalAmount,
    required this.tChrgsType,
    required this.scChrgsType,
    required this.symbol,
    required this.schead,
    required this.tchead,
    required this.scChrgs,
    required this.tChrgs,
    required this.dollarValue,
    required this.ecardButton,
    required this.withdrawalButton,
  });

  factory WithdrawalnfoModel.fromJson(Map<String, dynamic> json) =>
      WithdrawalnfoModel(
        msg: json["Msg"],
        message: json["Message"],
        userId: json["UserID"],
        name: json["Name"],
        city: json["City"],
        balance: json["Balance"],
        withdrawalAmount: json["WithdrawalAmount"],
        minWithdrawalAmount: json["MinWithdrawalAmount"],
        tChrgsType: json["TChrgsType"],
        scChrgsType: json["SCChrgsType"],
        symbol: json["Symbol"],
        schead: json["Schead"],
        tchead: json["Tchead"],
        scChrgs: json["SCChrgs"],
        tChrgs: json["TChrgs"],
        dollarValue: json["DollarValue"],
        ecardButton: json["EcardButton"],
        withdrawalButton: json["WithdrawalButton"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "Message": message,
        "UserID": userId,
        "Name": name,
        "City": city,
        "Balance": balance,
        "WithdrawalAmount": withdrawalAmount,
        "MinWithdrawalAmount": minWithdrawalAmount,
        "TChrgsType": tChrgsType,
        "SCChrgsType": scChrgsType,
        "Symbol": symbol,
        "Schead": schead,
        "Tchead": tchead,
        "SCChrgs": scChrgs,
        "TChrgs": tChrgs,
        "DollarValue": dollarValue,
        "EcardButton": ecardButton,
        "WithdrawalButton": withdrawalButton,
      };
}
