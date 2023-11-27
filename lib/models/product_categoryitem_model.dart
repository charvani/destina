// To parse this JSON data, do
//
//     final productCategoryItem = productCategoryItemFromJson(jsonString);

import 'dart:convert';

ProductCategoryItem productCategoryItemFromJson(String str) =>
    ProductCategoryItem.fromJson(json.decode(str));

String productCategoryItemToJson(ProductCategoryItem data) =>
    json.encode(data.toJson());

class ProductCategoryItem {
  String packageId;
  String image;
  String packageName;
  String packagecode;
  String category;
  String slugUrl;
  double dp;
  dynamic currency;

  ProductCategoryItem({
    required this.packageId,
    required this.image,
    required this.packageName,
    required this.packagecode,
    required this.category,
    required this.slugUrl,
    required this.dp,
    required this.currency,
  });

  factory ProductCategoryItem.fromJson(Map<String, dynamic> json) =>
      ProductCategoryItem(
        packageId: json["packageId"],
        image: json["image"],
        packageName: json["packageName"],
        packagecode: json["packagecode"],
        category: json["category"],
        slugUrl: json["slugUrl"],
        dp: json["DP"]?.toDouble(),
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "packageId": packageId,
        "image": image,
        "packageName": packageName,
        "packagecode": packagecode,
        "category": category,
        "slugUrl": slugUrl,
        "DP": dp,
        "currency": currency,
      };
}
