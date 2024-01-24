// To parse this JSON data, do
//
//     final upgradePromotionModel = upgradePromotionModelFromJson(jsonString);

import 'dart:convert';

UpgradePromotionModel upgradePromotionModelFromJson(String str) =>
    UpgradePromotionModel.fromJson(json.decode(str));

String upgradePromotionModelToJson(UpgradePromotionModel data) =>
    json.encode(data.toJson());

class UpgradePromotionModel {
  String pid;
  String pcode;
  String name;
  String qty;
  dynamic shipPrice;
  String mrp;
  String cv;
  String totMrp;

  UpgradePromotionModel({
    required this.pid,
    required this.pcode,
    required this.name,
    required this.qty,
    required this.shipPrice,
    required this.mrp,
    required this.cv,
    required this.totMrp,
  });

  factory UpgradePromotionModel.fromJson(Map<String, dynamic> json) =>
      UpgradePromotionModel(
        pid: json["PID"],
        pcode: json["pcode"],
        name: json["name"],
        qty: json["Qty"],
        shipPrice: json["ShipPrice"],
        mrp: json["MRP"],
        cv: json["CV"],
        totMrp: json["TotMRP"],
      );

  Map<String, dynamic> toJson() => {
        "PID": pid,
        "pcode": pcode,
        "name": name,
        "Qty": qty,
        "ShipPrice": shipPrice,
        "MRP": mrp,
        "CV": cv,
        "TotMRP": totMrp,
      };
}
