// To parse this JSON data, do
//
//     final packageReviewModel = packageReviewModelFromJson(jsonString);

import 'dart:convert';

PackageReviewModel packageReviewModelFromJson(String str) =>
    PackageReviewModel.fromJson(json.decode(str));

String packageReviewModelToJson(PackageReviewModel data) =>
    json.encode(data.toJson());

class PackageReviewModel {
  String pkid;
  String pkcode;
  String pkname;
  String mrp;
  String pImage;
  String review;
  String revsts;
  String cv;

  PackageReviewModel({
    required this.pkid,
    required this.pkcode,
    required this.pkname,
    required this.mrp,
    required this.pImage,
    required this.review,
    required this.revsts,
    required this.cv,
  });

  factory PackageReviewModel.fromJson(Map<String, dynamic> json) =>
      PackageReviewModel(
        pkid: json["pkid"],
        pkcode: json["pkcode"],
        pkname: json["pkname"],
        mrp: json["mrp"],
        pImage: json["PImage"],
        review: json["Review"],
        revsts: json["Revsts"],
        cv: json["CV"],
      );

  Map<String, dynamic> toJson() => {
        "pkid": pkid,
        "pkcode": pkcode,
        "pkname": pkname,
        "mrp": mrp,
        "PImage": pImage,
        "Review": review,
        "Revsts": revsts,
        "CV": cv,
      };
}
