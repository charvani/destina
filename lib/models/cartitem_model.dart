// To parse this JSON data, do
//
//     final cartItemModel = cartItemModelFromJson(jsonString);

import 'dart:convert';

CartItemModel cartItemModelFromJson(String str) =>
    CartItemModel.fromJson(json.decode(str));

String cartItemModelToJson(CartItemModel data) => json.encode(data.toJson());

class CartItemModel {
  String packageName;
  String packageCode;
  String image;
  String packMrp;
  dynamic packTotMrp;
  String packQuantity;
  String packSno;
  String packId;
  String symbol;

  CartItemModel({
    required this.packageName,
    required this.packageCode,
    required this.image,
    required this.packMrp,
    required this.packTotMrp,
    required this.packQuantity,
    required this.packSno,
    required this.packId,
    required this.symbol,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        packageName: json["packageName"],
        packageCode: json["packageCode"],
        image: json["image"],
        packMrp: json["packMrp"],
        packTotMrp: json["packTotMrp"],
        packQuantity: json["packQuantity"],
        packSno: json["packSno"],
        packId: json["packID"],
        symbol: json["Symbol"],
      );

  Map<String, dynamic> toJson() => {
        "packageName": packageName,
        "packageCode": packageCode,
        "image": image,
        "packMrp": packMrp,
        "packTotMrp": packTotMrp,
        "packQuantity": packQuantity,
        "packSno": packSno,
        "packID": packId,
      };
}
