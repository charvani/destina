// To parse this JSON data, do
//
//     final upgradeCartItemModel = upgradeCartItemModelFromJson(jsonString);

import 'dart:convert';

UpgradeCartItemModel upgradeCartItemModelFromJson(String str) =>
    UpgradeCartItemModel.fromJson(json.decode(str));

String upgradeCartItemModelToJson(UpgradeCartItemModel data) =>
    json.encode(data.toJson());

class UpgradeCartItemModel {
  String msg;
  String message;
  String pkid;
  String pkcode;
  String pkname;
  String mrp;
  String pImage;
  String adMsg;
  bool promorpt;

  UpgradeCartItemModel({
    required this.msg,
    required this.message,
    required this.pkid,
    required this.pkcode,
    required this.pkname,
    required this.mrp,
    required this.pImage,
    required this.adMsg,
    required this.promorpt,
  });

  factory UpgradeCartItemModel.fromJson(Map<String, dynamic> json) =>
      UpgradeCartItemModel(
        msg: json["Msg"],
        message: json["Message"],
        pkid: json["pkid"],
        pkcode: json["pkcode"],
        pkname: json["pkname"],
        mrp: json["mrp"],
        pImage: json["PImage"],
        adMsg: json["AdMsg"],
        promorpt: json["promorpt"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "Message": message,
        "pkid": pkid,
        "pkcode": pkcode,
        "pkname": pkname,
        "mrp": mrp,
        "PImage": pImage,
        "AdMsg": adMsg,
        "promorpt": promorpt,
      };
}
