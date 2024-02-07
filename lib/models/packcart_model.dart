// To parse this JSON data, do
//
//     final packCartModel = packCartModelFromJson(jsonString);

import 'dart:convert';

PackCartModel packCartModelFromJson(String str) =>
    PackCartModel.fromJson(json.decode(str));

String packCartModelToJson(PackCartModel data) => json.encode(data.toJson());

class PackCartModel {
  String pkid;
  String pkcode;
  String pkname;
  String mrp;
  String pImage;
  String symbol;
  String qty;
  String cv;

  PackCartModel({
    required this.pkid,
    required this.pkcode,
    required this.pkname,
    required this.mrp,
    required this.pImage,
    required this.symbol,
    required this.qty,
    required this.cv,
  });

  factory PackCartModel.fromJson(Map<String, dynamic> json) => PackCartModel(
        pkid: json["pkid"],
        pkcode: json["pkcode"],
        pkname: json["pkname"],
        mrp: json["mrp"],
        pImage: json["PImage"],
        symbol: json["symbol"],
        qty: json["Qty"],
        cv: json["CV"],
      );

  Map<String, dynamic> toJson() => {
        "pkid": pkid,
        "pkcode": pkcode,
        "pkname": pkname,
        "mrp": mrp,
        "PImage": pImage,
        "symbol": symbol,
        "Qty": qty,
        "CV": cv
      };
}
