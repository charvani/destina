// To parse this JSON data, do
//
//     final bankIdModel = bankIdModelFromJson(jsonString);

import 'dart:convert';

BankIdModel bankIdModelFromJson(String str) =>
    BankIdModel.fromJson(json.decode(str));

String bankIdModelToJson(BankIdModel data) => json.encode(data.toJson());

class BankIdModel {
  String bankName;
  String bankId;

  BankIdModel({
    required this.bankName,
    required this.bankId,
  });

  factory BankIdModel.fromJson(Map<String, dynamic> json) => BankIdModel(
        bankName: json["BankName"],
        bankId: json["BankId"],
      );

  Map<String, dynamic> toJson() => {
        "BankName": bankName,
        "BankId": bankId,
      };
}
