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

  ProductCategoryItem({
    required this.packageId,
    required this.image,
    required this.packageName,
    required this.packagecode,
    required this.category,
    required this.slugUrl,
  });

  factory ProductCategoryItem.fromJson(Map<String, dynamic> json) =>
      ProductCategoryItem(
        packageId: json["packageId"],
        image: json["image"],
        packageName: json["packageName"],
        packagecode: json["packagecode"],
        category: json["category"],
        slugUrl: json["slugUrl"],
      );

  Map<String, dynamic> toJson() => {
        "packageId": packageId,
        "image": image,
        "packageName": packageName,
        "packagecode": packagecode,
        "category": category,
        "slugUrl": slugUrl,
      };
}
