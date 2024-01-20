// To parse this JSON data, do
//
//     final promoCartItemModel = promoCartItemModelFromJson(jsonString);

import 'dart:convert';

PromoCartItemModel promoCartItemModelFromJson(String str) =>
    PromoCartItemModel.fromJson(json.decode(str));

String promoCartItemModelToJson(PromoCartItemModel data) =>
    json.encode(data.toJson());

class PromoCartItemModel {
  String pid;
  String pkcode;
  String name;
  String qty;
  String shipPrice;
  String rpShipPrice;
  dynamic rp;
  String dp;
  String cv;
  String totMrp;
  String discAmt;
  String emoney;
  String totRp;

  PromoCartItemModel({
    required this.pid,
    required this.pkcode,
    required this.name,
    required this.qty,
    required this.shipPrice,
    required this.rpShipPrice,
    required this.rp,
    required this.dp,
    required this.cv,
    required this.totMrp,
    required this.discAmt,
    required this.emoney,
    required this.totRp,
  });

  factory PromoCartItemModel.fromJson(Map<String, dynamic> json) =>
      PromoCartItemModel(
        pid: json["pid"],
        pkcode: json["pkcode"],
        name: json["name"],
        qty: json["Qty"],
        shipPrice: json["ShipPrice"],
        rpShipPrice: json["RPShipPrice"],
        rp: json["RP"],
        dp: json["DP"],
        cv: json["CV"],
        totMrp: json["TotMRP"],
        discAmt: json["DiscAmt"],
        emoney: json["Emoney"],
        totRp: json["TotRP"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "pkcode": pkcode,
        "name": name,
        "Qty": qty,
        "ShipPrice": shipPrice,
        "RPShipPrice": rpShipPrice,
        "RP": rp,
        "DP": dp,
        "CV": cv,
        "TotMRP": totMrp,
        "DiscAmt": discAmt,
        "Emoney": emoney,
        "TotRP": totRp,
      };
}
