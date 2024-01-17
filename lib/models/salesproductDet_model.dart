// To parse this JSON data, do
//
//     final salesProductModel = salesProductModelFromJson(jsonString);

import 'dart:convert';

SalesProductModel salesProductModelFromJson(String str) =>
    SalesProductModel.fromJson(json.decode(str));

String salesProductModelToJson(SalesProductModel data) =>
    json.encode(data.toJson());

class SalesProductModel {
  List<OverviewRpt> overviewRpt;
  List<ReviewRpt> reviewRpt;
  List<dynamic> endorsements;
  List<CategoryRpt> categoryRpt;
  List<dynamic> productRpt;
  String msg;
  String message;
  int pkid;
  String pkcode;
  String pkname;
  String mrp;
  String pimage;
  String codeNo;
  String cv;
  String img;
  String img1;
  String img2;
  String img3;
  dynamic url;
  dynamic pdfPath;

  SalesProductModel({
    required this.overviewRpt,
    required this.reviewRpt,
    required this.endorsements,
    required this.categoryRpt,
    required this.productRpt,
    required this.msg,
    required this.message,
    required this.pkid,
    required this.pkcode,
    required this.pkname,
    required this.mrp,
    required this.pimage,
    required this.codeNo,
    required this.cv,
    required this.img,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.url,
    required this.pdfPath,
  });

  factory SalesProductModel.fromJson(Map<String, dynamic> json) =>
      SalesProductModel(
        overviewRpt: List<OverviewRpt>.from(
            json["overviewRpt"].map((x) => OverviewRpt.fromJson(x))),
        reviewRpt: List<ReviewRpt>.from(
            json["ReviewRpt"].map((x) => ReviewRpt.fromJson(x))),
        endorsements: List<dynamic>.from(json["endorsements"].map((x) => x)),
        categoryRpt: List<CategoryRpt>.from(
            json["categoryRpt"].map((x) => CategoryRpt.fromJson(x))),
        productRpt: List<dynamic>.from(json["productRpt"].map((x) => x)),
        msg: json["Msg"],
        message: json["Message"],
        pkid: json["pkid"],
        pkcode: json["pkcode"],
        pkname: json["pkname"],
        mrp: json["mrp"],
        pimage: json["Pimage"],
        codeNo: json["CodeNo"],
        cv: json["cv"],
        img: json["img"],
        img1: json["img1"],
        img2: json["img2"],
        img3: json["img3"],
        url: json["Url"] ?? "",
        pdfPath: json["pdfPath"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "overviewRpt": List<dynamic>.from(overviewRpt.map((x) => x.toJson())),
        "ReviewRpt": List<dynamic>.from(reviewRpt.map((x) => x.toJson())),
        "endorsements": List<dynamic>.from(endorsements.map((x) => x)),
        "categoryRpt": List<dynamic>.from(categoryRpt.map((x) => x.toJson())),
        "productRpt": List<dynamic>.from(productRpt.map((x) => x)),
        "Msg": msg,
        "Message": message,
        "pkid": pkid,
        "pkcode": pkcode,
        "pkname": pkname,
        "mrp": mrp,
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

class CategoryRpt {
  String category;
  String status;

  CategoryRpt({
    required this.category,
    required this.status,
  });

  factory CategoryRpt.fromJson(Map<String, dynamic> json) => CategoryRpt(
        category: json["category"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "Status": status,
      };
}

class OverviewRpt {
  String overview;
  String descrip;
  String info;

  OverviewRpt({
    required this.overview,
    required this.descrip,
    required this.info,
  });

  factory OverviewRpt.fromJson(Map<String, dynamic> json) => OverviewRpt(
        overview: json["Overview"],
        descrip: json["Descrip"],
        info: json["Info"],
      );

  Map<String, dynamic> toJson() => {
        "Overview": overview,
        "Descrip": descrip,
        "Info": info,
      };
}

class ReviewRpt {
  String review;
  String name;

  ReviewRpt({
    required this.review,
    required this.name,
  });

  factory ReviewRpt.fromJson(Map<String, dynamic> json) => ReviewRpt(
        review: json["review"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "review": review,
        "name": name,
      };
}
