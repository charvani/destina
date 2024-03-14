// To parse this JSON data, do
//
//     final orderReportModel = orderReportModelFromJson(jsonString);

import 'dart:convert';

OrderReportModel orderReportModelFromJson(String str) =>
    OrderReportModel.fromJson(json.decode(str));

String orderReportModelToJson(OrderReportModel data) =>
    json.encode(data.toJson());

class OrderReportModel {
  String orderDate;
  String orderNo;
  String amt;
  String cv;
  String mallType;
  String modifypay;
  String shippingHis;
  String bDate;
  String name;
  String lbillno;
  String orderagain;

  OrderReportModel({
    required this.orderDate,
    required this.orderNo,
    required this.amt,
    required this.cv,
    required this.mallType,
    required this.modifypay,
    required this.shippingHis,
    required this.bDate,
    required this.name,
    required this.lbillno,
    required this.orderagain,
  });

  factory OrderReportModel.fromJson(Map<String, dynamic> json) =>
      OrderReportModel(
        orderDate: json["OrderDate"],
        orderNo: json["OrderNo"],
        amt: json["Amt"],
        cv: json["CV"],
        mallType: json["MallType"],
        modifypay: json["Modifypay"],
        shippingHis: json["ShippingHis"],
        bDate: json["BDate"],
        name: json["PackageName"],
        lbillno: json["Lbillno"],
        orderagain: json["Orderagain"],
      );

  Map<String, dynamic> toJson() => {
        "OrderDate": orderDate,
        "OrderNo": orderNo,
        "Amt": amt,
        "CV": cv,
        "MallType": mallType,
        "Modifypay": modifypay,
        "ShippingHis": shippingHis,
        "PackageName": bDate,
        "Lbillno": lbillno,
        "Orderagain": orderagain,
      };
}
