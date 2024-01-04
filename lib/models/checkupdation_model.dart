// To parse this JSON data, do
//
//     final checkUpdationModel = checkUpdationModelFromJson(jsonString);

import 'dart:convert';

CheckUpdationModel checkUpdationModelFromJson(String str) =>
    CheckUpdationModel.fromJson(json.decode(str));

String checkUpdationModelToJson(CheckUpdationModel data) =>
    json.encode(data.toJson());

class CheckUpdationModel {
  List<ChechUpdrpt> chechUpdrpt;
  dynamic msg;
  dynamic message;

  CheckUpdationModel({
    required this.chechUpdrpt,
    required this.msg,
    required this.message,
  });

  factory CheckUpdationModel.fromJson(Map<String, dynamic> json) =>
      CheckUpdationModel(
        chechUpdrpt: List<ChechUpdrpt>.from(
            json["ChechUpdrpt"].map((x) => ChechUpdrpt.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "ChechUpdrpt": List<dynamic>.from(chechUpdrpt.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
      };
}

class ChechUpdrpt {
  dynamic sNo;
  String productCode;
  String productName;
  String qty;

  ChechUpdrpt({
    required this.sNo,
    required this.productCode,
    required this.productName,
    required this.qty,
  });

  factory ChechUpdrpt.fromJson(Map<String, dynamic> json) => ChechUpdrpt(
        sNo: json["SNo"],
        productCode: json["ProductCode"],
        productName: json["ProductName"],
        qty: json["Qty"],
      );

  Map<String, dynamic> toJson() => {
        "SNo": sNo,
        "ProductCode": productCode,
        "ProductName": productName,
        "Qty": qty,
      };
}
