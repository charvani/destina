// To parse this JSON data, do
//
//     final registerCartItemsModel = registerCartItemsModelFromJson(jsonString);

import 'dart:convert';

RegisterCartItemsModel registerCartItemsModelFromJson(String str) =>
    RegisterCartItemsModel.fromJson(json.decode(str));

String registerCartItemsModelToJson(RegisterCartItemsModel data) =>
    json.encode(data.toJson());

class RegisterCartItemsModel {
  String pkid;
  String pkcode;
  String pkname;
  String mrp;
  String pImage;
  String symbol;
  String qty;
  String cv;

  RegisterCartItemsModel({
    required this.pkid,
    required this.pkcode,
    required this.pkname,
    required this.mrp,
    required this.pImage,
    required this.symbol,
    required this.qty,
    required this.cv,
  });

  factory RegisterCartItemsModel.fromJson(Map<String, dynamic> json) =>
      RegisterCartItemsModel(
        pkid: json["pkid"],
        pkcode: json["pkcode"],
        pkname: json["pkname"],
        mrp: json["mrp"],
        pImage: json["PImage"],
        symbol: json["symbol"],
        qty: json["Qty"],
        cv: json["CV"]??"0",
      );

  Map<String, dynamic> toJson() => {
        "pkid": pkid,
        "pkcode": pkcode,
        "pkname": pkname,
        "mrp": mrp,
        "PImage": pImage,
        "symbol": symbol,
        "Qty": qty,
      };
}
