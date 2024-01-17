


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
  dynamic sno;

  SalesMallCartItemModel({
    required this.pkname,
    required this.pkcode,
    required this.pimage,
    required this.mrp,
    required this.qty,
    required this.sno,
  });

  factory SalesMallCartItemModel.fromJson(Map<String, dynamic> json) =>
      SalesMallCartItemModel(
        pkname: json["pkname"],
        pkcode: json["pkcode"],
        pimage: json["pimage"],
        mrp: json["mrp"],
        qty: json["qty"],
        sno: json["sno"],
      );

  Map<String, dynamic> toJson() => {
        "pkname": pkname,
        "pkcode": pkcode,
        "pimage": pimage,
        "mrp": mrp,
        "qty": qty,
        "sno": sno,
      };
}
