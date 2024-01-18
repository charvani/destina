// To parse this JSON data, do
//
//     final memberProductModel = memberProductModelFromJson(jsonString);

import 'dart:convert';

MemberProductModel memberProductModelFromJson(String str) =>
    MemberProductModel.fromJson(json.decode(str));

String memberProductModelToJson(MemberProductModel data) =>
    json.encode(data.toJson());

class MemberProductModel {
  List<dynamic> overviewRpt;
  List<ReviewRpt> reviewRpt;
  List<dynamic> endorsements;
  List<CategoryRpt> categoryRpt;
  List<dynamic> productRpt;
  List<DistSelPackageRpt> distSelPackageRpt;
  String msg;
  String message;
  int pkid;
  String pkcode;
  String pkname;
  String mrp;
  String pimage;
  String codeNo;
  String cv;
  String category;
  String img;
  String img1;
  String img2;
  String img3;
  dynamic url;
  dynamic pdfPath;
  String overview;
  String descrip;
  String info;
  String howtoUse;
  String videoUrl;
  dynamic dpPrice;

  MemberProductModel({
    required this.overviewRpt,
    required this.reviewRpt,
    required this.endorsements,
    required this.categoryRpt,
    required this.productRpt,
    required this.distSelPackageRpt,
    required this.msg,
    required this.message,
    required this.pkid,
    required this.pkcode,
    required this.pkname,
    required this.mrp,
    required this.pimage,
    required this.codeNo,
    required this.cv,
    required this.category,
    required this.img,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.url,
    required this.pdfPath,
    required this.overview,
    required this.descrip,
    required this.info,
    required this.howtoUse,
    required this.videoUrl,
    required this.dpPrice,
  });

  factory MemberProductModel.fromJson(Map<String, dynamic> json) =>
      MemberProductModel(
        overviewRpt: List<dynamic>.from(json["overviewRpt"].map((x) => x)),
        reviewRpt: List<ReviewRpt>.from(
            json["ReviewRpt"].map((x) => ReviewRpt.fromJson(x))),
        endorsements: List<dynamic>.from(json["endorsements"].map((x) => x)),
        categoryRpt: List<CategoryRpt>.from(
            json["categoryRpt"].map((x) => CategoryRpt.fromJson(x))),
        productRpt: List<dynamic>.from(json["productRpt"].map((x) => x)),
        distSelPackageRpt: List<DistSelPackageRpt>.from(
            json["DistSelPackageRpt"]
                .map((x) => DistSelPackageRpt.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
        pkid: json["pkid"],
        pkcode: json["pkcode"],
        pkname: json["pkname"],
        mrp: json["mrp"],
        pimage: json["Pimage"],
        codeNo: json["CodeNo"],
        cv: json["cv"],
        category: json["Category"],
        img: json["img"],
        img1: json["img1"],
        img2: json["img2"],
        img3: json["img3"],
        url: json["Url"],
        pdfPath: json["pdfPath"],
        overview: json["Overview"],
        descrip: json["Descrip"],
        info: json["Info"],
        howtoUse: json["HowtoUse"],
        videoUrl: json["VideoUrl"],
        dpPrice: json["DpPrice"],
      );

  Map<String, dynamic> toJson() => {
        "overviewRpt": List<dynamic>.from(overviewRpt.map((x) => x)),
        "ReviewRpt": List<dynamic>.from(reviewRpt.map((x) => x.toJson())),
        "endorsements": List<dynamic>.from(endorsements.map((x) => x)),
        "categoryRpt": List<dynamic>.from(categoryRpt.map((x) => x.toJson())),
        "productRpt": List<dynamic>.from(productRpt.map((x) => x)),
        "DistSelPackageRpt":
            List<dynamic>.from(distSelPackageRpt.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
        "pkid": pkid,
        "pkcode": pkcode,
        "pkname": pkname,
        "mrp": mrp,
        "Pimage": pimage,
        "CodeNo": codeNo,
        "cv": cv,
        "Category": category,
        "img": img,
        "img1": img1,
        "img2": img2,
        "img3": img3,
        "Url": url,
        "pdfPath": pdfPath,
        "Overview": overview,
        "Descrip": descrip,
        "Info": info,
        "HowtoUse": howtoUse,
        "VideoUrl": videoUrl,
        "DpPrice": dpPrice,
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

class DistSelPackageRpt {
  String pkid;
  String pkcode;
  String pkname;
  String mrp;
  String pImage;
  String codeNo;
  String cv;
  String img;

  DistSelPackageRpt({
    required this.pkid,
    required this.pkcode,
    required this.pkname,
    required this.mrp,
    required this.pImage,
    required this.codeNo,
    required this.cv,
    required this.img,
  });

  factory DistSelPackageRpt.fromJson(Map<String, dynamic> json) =>
      DistSelPackageRpt(
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
