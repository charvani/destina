// To parse this JSON data, do
//
//     final packageItemsModel = packageItemsModelFromJson(jsonString);

import 'dart:convert';

PackageItemsModel packageItemsModelFromJson(String str) =>
    PackageItemsModel.fromJson(json.decode(str));

String packageItemsModelToJson(PackageItemsModel data) =>
    json.encode(data.toJson());

class PackageItemsModel {
  List<GetPkgItemsRpt> getPkgItemsRpt;
  String msg;
  String message;
  String lblMsg;
  String head;
  String maxQty;

  PackageItemsModel({
    required this.getPkgItemsRpt,
    required this.msg,
    required this.message,
    required this.lblMsg,
    required this.head,
    required this.maxQty,
  });

  factory PackageItemsModel.fromJson(Map<String, dynamic> json) =>
      PackageItemsModel(
        getPkgItemsRpt: List<GetPkgItemsRpt>.from(
            json["GetPkgItemsRpt"].map((x) => GetPkgItemsRpt.fromJson(x))),
        msg: json["Msg"],
        message: json["Message"],
        lblMsg: json["LblMsg"],
        head: json["Head"],
        maxQty: json["MaxQty"],
      );

  Map<String, dynamic> toJson() => {
        "GetPkgItemsRpt":
            List<dynamic>.from(getPkgItemsRpt.map((x) => x.toJson())),
        "Msg": msg,
        "Message": message,
        "LblMsg": lblMsg,
        "Head": head,
        "MaxQty": maxQty,
      };
}

class GetPkgItemsRpt {
  String maxquan;
  String pcode;
  String name;
  String qty;
  String tqty;
  String selprod;
  String compulsory;
  String? amount;

  GetPkgItemsRpt(
      {required this.maxquan,
      required this.pcode,
      required this.name,
      required this.qty,
      required this.tqty,
      required this.selprod,
      this.amount,
      required this.compulsory});

  factory GetPkgItemsRpt.fromJson(Map<String, dynamic> json) => GetPkgItemsRpt(
      maxquan: json["maxquan"],
      pcode: json["pcode"],
      name: json["Name"],
      qty: json["qty"],
      tqty: json["tqty"],
      selprod: json["selprod"],
      amount: json['Amount'] ?? "",
      compulsory: json['compulprod']);

  Map<String, dynamic> toJson() => {
        "maxquan": maxquan,
        "pcode": pcode,
        "Name": name,
        "qty": qty,
        "tqty": tqty,
        "selprod": selprod,
        "compulprod": compulsory
      };
}
