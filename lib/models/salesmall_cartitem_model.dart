// To parse this JSON data, do
//
//     final salesMallCartItemModel = salesMallCartItemModelFromJson(jsonString);

import 'dart:convert';

SalesMallCartItemModel salesMallCartItemModelFromJson(String str) =>
    SalesMallCartItemModel.fromJson(json.decode(str));

String salesMallCartItemModelToJson(SalesMallCartItemModel data) =>
    json.encode(data.toJson());

class SalesMallCartItemModel {
  String pkname;
  String pkcode;
  String pimage;
  String mrp;
  String qty;
  String symbol;
  dynamic sno;
  String cv;

  SalesMallCartItemModel({
    required this.pkname,
    required this.pkcode,
    required this.pimage,
    required this.mrp,
    required this.qty,
    required this.sno,
    required this.symbol,
    required this.cv,
  });

  factory SalesMallCartItemModel.fromJson(Map<String, dynamic> json) =>
      SalesMallCartItemModel(
        pkname: json["pkname"],
        pkcode: json["pkcode"],
        pimage: json["pimage"],
        mrp: json["mrp"],
        qty: json["qty"],
        sno: json["sno"],
        cv: json["CV"] ?? "",
        symbol: json["Symbol"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "pkname": pkname,
        "pkcode": pkcode,
        "pimage": pimage,
        "mrp": mrp,
        "qty": qty,
        "sno": sno,
        "Symbol": symbol
      };
}
