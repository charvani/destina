// To parse this JSON data, do
//
//     final selPackageModel = selPackageModelFromJson(jsonString);

import 'dart:convert';

SelPackageModel selPackageModelFromJson(String str) =>
    SelPackageModel.fromJson(json.decode(str));

String selPackageModelToJson(SelPackageModel data) =>
    json.encode(data.toJson());

class SelPackageModel {
  String pkid;
  String pkcode;
  String pkname;
  String mrp;
  String pImage;
  String codeNo;
  String cv;
  String img;
  String rp;

  SelPackageModel({
    required this.pkid,
    required this.pkcode,
    required this.pkname,
    required this.mrp,
    required this.pImage,
    required this.codeNo,
    required this.cv,
    required this.img,
    required this.rp,
  });

  factory SelPackageModel.fromJson(Map<String, dynamic> json) =>
      SelPackageModel(
        pkid: json["pkid"],
        pkcode: json["pkcode"],
        pkname: json["pkname"],
        mrp: json["mrp"],
        pImage: json["PImage"],
        codeNo: json["CodeNo"],
        cv: json["CV"],
        img: json["Img"],
        rp: json["RP"] ?? "",
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
