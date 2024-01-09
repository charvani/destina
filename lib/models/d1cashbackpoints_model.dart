// To parse this JSON data, do
//
//     final d1CashBackPointsModel = d1CashBackPointsModelFromJson(jsonString);

import 'dart:convert';

D1CashBackPointsModel d1CashBackPointsModelFromJson(String str) =>
    D1CashBackPointsModel.fromJson(json.decode(str));

String d1CashBackPointsModelToJson(D1CashBackPointsModel data) =>
    json.encode(data.toJson());

class D1CashBackPointsModel {
  List<D1CreditRSummaryRpt> d1CreditRSummaryRpt;
  String msg;
  dynamic message;
  String totalD1Credit;
  String totalD1Debit;
  String d1BalenceAmount;
  bool ecardButton;
  bool withDrawButton;

  D1CashBackPointsModel({
    required this.d1CreditRSummaryRpt,
    required this.msg,
    required this.message,
    required this.totalD1Credit,
    required this.totalD1Debit,
    required this.d1BalenceAmount,
    required this.ecardButton,
    required this.withDrawButton,
  });

  factory D1CashBackPointsModel.fromJson(Map<String, dynamic> json) =>
      D1CashBackPointsModel(
        d1CreditRSummaryRpt: List<D1CreditRSummaryRpt>.from(
            json["D1CreditRSummaryRpt"]
                .map((x) => D1CreditRSummaryRpt.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
        totalD1Credit: json["TotalD1Credit"],
        totalD1Debit: json["TotalD1Debit"],
        d1BalenceAmount: json["D1BalenceAmount"],
        ecardButton: json["EcardButton"],
        withDrawButton: json["WithDrawButton"],
      );

  Map<String, dynamic> toJson() => {
        "D1CreditRSummaryRpt":
            List<dynamic>.from(d1CreditRSummaryRpt.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
        "TotalD1Credit": totalD1Credit,
        "TotalD1Debit": totalD1Debit,
        "D1BalenceAmount": d1BalenceAmount,
        "EcardButton": ecardButton,
        "WithDrawButton": withDrawButton,
      };
}

class D1CreditRSummaryRpt {
  String sno;
  String dated;
  String inamt;
  String outamt;
  String balance;
  String description;
  String remarks;
  String totcnt;

  D1CreditRSummaryRpt({
    required this.sno,
    required this.dated,
    required this.inamt,
    required this.outamt,
    required this.balance,
    required this.description,
    required this.remarks,
    required this.totcnt,
  });

  factory D1CreditRSummaryRpt.fromJson(Map<String, dynamic> json) =>
      D1CreditRSummaryRpt(
        sno: json["sno"],
        dated: json["Dated"],
        inamt: json["inamt"],
        outamt: json["Outamt"],
        balance: json["Balance"],
        description: json["Description"],
        remarks: json["Remarks"],
        totcnt: json["totcnt"],
      );

  Map<String, dynamic> toJson() => {
        "sno": sno,
        "Dated": dated,
        "inamt": inamt,
        "Outamt": outamt,
        "Balance": balance,
        "Description": description,
        "Remarks": remarks,
        "totcnt": totcnt,
      };
}
