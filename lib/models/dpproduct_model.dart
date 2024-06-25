// To parse this JSON data, do
//
//     final dpProdccutModel = dpProdccutModelFromJson(jsonString);

import 'dart:convert';

DpProdccutModel dpProdccutModelFromJson(String str) =>
    DpProdccutModel.fromJson(json.decode(str));

String dpProdccutModelToJson(DpProdccutModel data) =>
    json.encode(data.toJson());

class DpProdccutModel {
  String msg;
  String message;
  int pkid;
  String pkcode;
  String pkname;
  String mrp;
  String dpPrice;
  String pimage;
  String codeNo;
  String cv;
  String img;
  String img1;
  String img2;
  String img3;
  dynamic url;
  dynamic pdfPath;
  String qty;

  DpProdccutModel({
    required this.msg,
    required this.message,
    required this.pkid,
    required this.pkcode,
    required this.pkname,
    required this.mrp,
    required this.dpPrice,
    required this.pimage,
    required this.codeNo,
    required this.cv,
    required this.img,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.url,
    required this.pdfPath,
    required this.qty,
  });

  factory DpProdccutModel.fromJson(Map<String, dynamic> json) =>
      DpProdccutModel(
        msg: json["Msg"],
        message: json["Message"],
        pkid: json["pkid"],
        pkcode: json["pkcode"],
        pkname: json["pkname"],
        mrp: json["mrp"],
        dpPrice: json["DpPrice"],
        pimage: json["Pimage"],
        codeNo: json["CodeNo"],
        cv: json["cv"],
        img: json["img"],
        img1: json["img1"],
        img2: json["img2"],
        img3: json["img3"],
        url: json["Url"],
        pdfPath: json["pdfPath"],
        qty: json["aqty"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "Message": message,
        "pkid": pkid,
        "pkcode": pkcode,
        "pkname": pkname,
        "mrp": mrp,
        "DpPrice": dpPrice,
        "Pimage": pimage,
        "CodeNo": codeNo,
        "cv": cv,
        "img": img,
        "img1": img1,
        "img2": img2,
        "img3": img3,
        "Url": url,
        "pdfPath": pdfPath,
      };
}
