// To parse this JSON data, do
//
//     final packageDetailsModel = packageDetailsModelFromJson(jsonString);

import 'dart:convert';

PackageDetailsModel packageDetailsModelFromJson(String str) =>
    PackageDetailsModel.fromJson(json.decode(str));

String packageDetailsModelToJson(PackageDetailsModel data) =>
    json.encode(data.toJson());

class PackageDetailsModel {
  List<dynamic> packageDescriptionRpt1;
  List<dynamic> packageDescriptionRpt2;
  String msg;
  String message;
  String desc;
  String overview;
  String info;
  String pkid;
  String pkcode;
  String pkname;
  String mrp;
  String pImage;
  String codeNo;
  String cv;
  String img;
  String img1;
  String img2;
  String img3;
  String rp;
  String aqty;
  dynamic fddesc;
  String broucherurl;
  String youtubeUrl;
  String imgUrl;

  PackageDetailsModel({
    required this.packageDescriptionRpt1,
    required this.packageDescriptionRpt2,
    required this.msg,
    required this.message,
    required this.desc,
    required this.overview,
    required this.info,
    required this.pkid,
    required this.pkcode,
    required this.pkname,
    required this.mrp,
    required this.pImage,
    required this.codeNo,
    required this.cv,
    required this.img,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.rp,
    required this.aqty,
    required this.fddesc,
    required this.broucherurl,
    required this.youtubeUrl,
    required this.imgUrl,
  });

  factory PackageDetailsModel.fromJson(Map<String, dynamic> json) =>
      PackageDetailsModel(
        packageDescriptionRpt1:
            List<dynamic>.from(json["PackageDescriptionRpt1"].map((x) => x)),
        packageDescriptionRpt2:
            List<dynamic>.from(json["PackageDescriptionRpt2"].map((x) => x)),
        msg: json["Msg"],
        message: json["Message"],
        desc: json["Desc"] ?? "",
        overview: json["Overview"] ?? "",
        info: json["info"] ?? "",
        pkid: json["pkid"],
        pkcode: json["pkcode"],
        pkname: json["pkname"],
        mrp: json["mrp"],
        pImage: json["PImage"],
        codeNo: json["CodeNo"],
        cv: json["CV"],
        img: json["img"],
        img1: json["img1"],
        img2: json["img2"],
        img3: json["img3"],
        rp: json["RP"] ?? "",
        aqty: json["aqty"],
        fddesc: json["Fdescr"],
        broucherurl: json["broucherurl"],
        youtubeUrl: json["youtubeUrl"],
        imgUrl: json["ImgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "PackageDescriptionRpt1":
            List<dynamic>.from(packageDescriptionRpt1.map((x) => x)),
        "PackageDescriptionRpt2":
            List<dynamic>.from(packageDescriptionRpt2.map((x) => x)),
        "Msg": msg,
        "Message": message,
        "Desc": desc,
        "Overview": overview,
        "info": info,
        "pkid": pkid,
        "pkcode": pkcode,
        "pkname": pkname,
        "mrp": mrp,
        "PImage": pImage,
        "CodeNo": codeNo,
        "CV": cv,
        "img": img,
        "img1": img1,
        "img2": img2,
        "img3": img3,
        "aqty": aqty,
      };
}
