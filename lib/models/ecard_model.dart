// To parse this JSON data, do
//
//     final ecardModel = ecardModelFromJson(jsonString);

import 'dart:convert';

EcardModel ecardModelFromJson(String str) =>
    EcardModel.fromJson(json.decode(str));

String ecardModelToJson(EcardModel data) => json.encode(data.toJson());

class EcardModel {
  List<Emoneyrpt> emoneyrpt;
  String msg;
  dynamic message;
  String ecard;
  String ePin;
  String totalCredit;
  String totalDebit;
  String balenceAmount;
  String symbol;
  bool ecardButton;
  bool withDrawButton;

  EcardModel({
    required this.emoneyrpt,
    required this.msg,
    required this.message,
    required this.ecard,
    required this.ePin,
    required this.totalCredit,
    required this.totalDebit,
    required this.balenceAmount,
    required this.symbol,
    required this.ecardButton,
    required this.withDrawButton,
  });

  factory EcardModel.fromJson(Map<String, dynamic> json) => EcardModel(
        emoneyrpt: List<Emoneyrpt>.from(
            json["Emoneyrpt"].map((x) => Emoneyrpt.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
        ecard: json["Ecard"],
        ePin: json["EPin"],
        totalCredit: json["TotalCredit"],
        totalDebit: json["TotalDebit"],
        balenceAmount: json["BalenceAmount"],
        symbol: json["Symbol"],
        ecardButton: json["EcardButton"],
        withDrawButton: json["WithDrawButton"],
      );

  Map<String, dynamic> toJson() => {
        "Emoneyrpt": List<dynamic>.from(emoneyrpt.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
        "Ecard": ecard,
        "EPin": ePin,
        "TotalCredit": totalCredit,
        "TotalDebit": totalDebit,
        "BalenceAmount": balenceAmount,
        "Symbol": symbol,
        "EcardButton": ecardButton,
        "WithDrawButton": withDrawButton,
      };
}

class Emoneyrpt {
  String sno;
  String date;
  String creditAmount;
  String debitAmount;
  String balanceAmount;
  String remarks;
  String description;
  String billNo;
  String imageEndPath;
  String imageText;

  Emoneyrpt(
      {required this.sno,
      required this.date,
      required this.creditAmount,
      required this.debitAmount,
      required this.balanceAmount,
      required this.remarks,
      required this.description,
      required this.billNo,
      required this.imageText,
      required this.imageEndPath});

  factory Emoneyrpt.fromJson(Map<String, dynamic> json) => Emoneyrpt(
      sno: json["Sno"],
      date: json["Date"],
      creditAmount: json["CreditAmount"],
      debitAmount: json["DebitAmount"],
      balanceAmount: json["BalanceAmount"],
      remarks: json["Remarks"],
      description: json["Description"],
      billNo: json["BillNo"],
      imageEndPath: json['IMagePath'] ?? "",
      imageText: json['ImageText'] ?? "");

  Map<String, dynamic> toJson() => {
        "Sno": sno,
        "Date": date,
        "CreditAmount": creditAmount,
        "DebitAmount": debitAmount,
        "BalanceAmount": balanceAmount,
        "Remarks": remarks,
        "Description": description,
        "BillNo": billNo,
        "IMagePath": imageEndPath,
        "ImageText": imageText
      };
}
