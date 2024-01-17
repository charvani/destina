// To parse this JSON data, do
//
//     final salesOrderModel = salesOrderModelFromJson(jsonString);

import 'dart:convert';

SalesOrderModel salesOrderModelFromJson(String str) =>
    SalesOrderModel.fromJson(json.decode(str));

String salesOrderModelToJson(SalesOrderModel data) =>
    json.encode(data.toJson());

class SalesOrderModel {
  String pkid;
  String pkcode;
  String pkname;
  String mrp;
  String pImage;
  String codeNo;
  String cv;
  String img;

  SalesOrderModel({
    required this.pkid,
    required this.pkcode,
    required this.pkname,
    required this.mrp,
    required this.pImage,
    required this.codeNo,
    required this.cv,
    required this.img,
  });

  factory SalesOrderModel.fromJson(Map<String, dynamic> json) =>
      SalesOrderModel(
        pkid: json["pkid"],
        pkcode: json["pkcode"],
        pkname: json["pkname"],
        mrp: json["mrp"],
        pImage: json["PImage"],
        codeNo: json["CodeNo"],
        cv: json["CV"],
        img: json["Img"],
      );

  Map<String, dynamic> toJson() => {
        "pkid": pkid,
        "pkcode": pkcode,
        "pkname": pkname,
        "mrp": mrp,
        "PImage": pImage,
        "CodeNo": codeNo,
        "CV": cv,
        "Img": img,
      };
}
