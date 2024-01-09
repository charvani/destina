// To parse this JSON data, do
//
//     final retailBonusModel = retailBonusModelFromJson(jsonString);

import 'dart:convert';

RetailBonusModel retailBonusModelFromJson(String str) =>
    RetailBonusModel.fromJson(json.decode(str));

String retailBonusModelToJson(RetailBonusModel data) =>
    json.encode(data.toJson());

class RetailBonusModel {
  String distbutorId;
  String distbutorName;
  String orderNo;
  String cv;
  String orderDate;
  String netAmt;

  RetailBonusModel({
    required this.distbutorId,
    required this.distbutorName,
    required this.orderNo,
    required this.cv,
    required this.orderDate,
    required this.netAmt,
  });

  factory RetailBonusModel.fromJson(Map<String, dynamic> json) =>
      RetailBonusModel(
        distbutorId: json["DistbutorId"],
        distbutorName: json["DistbutorName"],
        orderNo: json["OrderNo"],
        cv: json["CV"],
        orderDate: json["OrderDate"],
        netAmt: json["NetAmt"],
      );

  Map<String, dynamic> toJson() => {
        "DistbutorId": distbutorId,
        "DistbutorName": distbutorName,
        "OrderNo": orderNo,
        "CV": cv,
        "OrderDate": orderDate,
        "NetAmt": netAmt,
      };
}
