// To parse this JSON data, do
//
//     final upgradeListModel = upgradeListModelFromJson(jsonString);

import 'dart:convert';

UpgradeListModel upgradeListModelFromJson(String str) =>
    UpgradeListModel.fromJson(json.decode(str));

String upgradeListModelToJson(UpgradeListModel data) =>
    json.encode(data.toJson());

class UpgradeListModel {
  String orderNo;
  String totalPrice;
  String totalCv;
  String orderDate;
  String packageName;

  UpgradeListModel({
    required this.orderNo,
    required this.totalPrice,
    required this.totalCv,
    required this.orderDate,
    required this.packageName,
  });

  factory UpgradeListModel.fromJson(Map<String, dynamic> json) =>
      UpgradeListModel(
        orderNo: json["OrderNo"],
        totalPrice: json["TotalPrice"],
        totalCv: json["TotalCV"],
        orderDate: json["OrderDate"],
        packageName: json["PackageName"],
      );

  Map<String, dynamic> toJson() => {
        "OrderNo": orderNo,
        "TotalPrice": totalPrice,
        "TotalCV": totalCv,
        "OrderDate": orderDate,
        "PackageName": packageName,
      };
}
